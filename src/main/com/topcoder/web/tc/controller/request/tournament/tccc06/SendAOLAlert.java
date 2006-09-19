package com.topcoder.web.tc.controller.request.tournament.tccc06;

import com.topcoder.alerts.aol.wrapper.AOLAlertNotificationMessage;
import com.topcoder.alerts.aol.wrapper.MessagingNotificationManager;
import com.topcoder.alerts.aol.wrapper.NotificationResult;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.QueryDataAccess;
import com.topcoder.shared.dataAccess.QueryRequest;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.util.format.ObjectFormatter;
import com.topcoder.util.format.ObjectFormatterFactory;
import com.topcoder.web.common.*;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.UserDAO;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.tag.CalendarDateFormatMethod;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.AOLAlertInfo;

import java.util.*;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Sep 8, 2006
 */
public class SendAOLAlert extends ShortHibernateProcessor {


    protected void dbProcessing() throws Exception {
        if (getSessionInfo().isAdmin()) {

            String handle = getRequest().getParameter(Constants.HANDLE);

            String roundId = getRequest().getParameter(Constants.ROUND_ID);
            String projectId = getRequest().getParameter(Constants.PROJECT_ID);

            //String alertId = getRequest().getParameter(AOLHelper.AOL_ALERT_ID);
            String alertName = getRequest().getParameter(AOLHelper.ALERT_NAME);
            if (log.isDebugEnabled()) {
                log.debug("alertname is " + alertName);
            }

            ResultSetContainer roundData = null;
            if (roundId != null) {
                roundData = getRoundData(roundId);
                if (roundData.isEmpty()) {
                    throw new NavigationException("Invalid round id " + roundId);
                }
            }

            ResultSetContainer projectData = null;
            if (projectId != null) {
                projectData = getProjectData(projectId);
                if (projectData.isEmpty()) {
                    throw new NavigationException("Invalid project id " + projectId);
                }
            }

            String text = getRequest().getParameter(AOLHelper.MESSAGE_TEXT);

            if (AOLHelper.INDIVIDUAL.equals(alertName)) {

                String query = StringUtils.checkNull(getRequest().getParameter(AOLHelper.QUERY));

                if ("".equals(StringUtils.checkNull(text))) {
                    addError(AOLHelper.MESSAGE_TEXT, "Empty message");
                    setDefault(AOLHelper.MESSAGE_TEXT, text);
                    setDefault(Constants.PROJECT_ID, projectId);
                    setDefault(Constants.ROUND_ID, roundId);
                    setDefault(Constants.HANDLE, handle);
                    setDefault(AOLHelper.QUERY, query);
                } else {
                    HashMap people = new HashMap();
                    if ("".equals(query)) {
                        User u = DAOUtil.getFactory().getUserDAO().find(handle, false);
                        if (u == null) {
                            addError(Constants.HANDLE, "Invalid handle");
                            setDefault(AOLHelper.MESSAGE_TEXT, text);
                            setDefault(Constants.PROJECT_ID, projectId);
                            setDefault(Constants.ROUND_ID, roundId);
                            setDefault(Constants.HANDLE, handle);
                            setDefault(AOLHelper.QUERY, query);
                        } else {
                            AOLAlertInfo info = (AOLAlertInfo) HibernateUtils.getSession().get(AOLAlertInfo.class, u.getId());
                            if (info == null) {
                                addError(Constants.HANDLE, "This user is not signed up for individual alerts");
                                setDefault(AOLHelper.MESSAGE_TEXT, text);
                                setDefault(Constants.PROJECT_ID, projectId);
                                setDefault(Constants.ROUND_ID, roundId);
                                setDefault(Constants.HANDLE, handle);
                                setDefault(AOLHelper.QUERY, query);
                            } else {
                                people.put(u.getId().toString(), info.getAolEncryptedUserId());
                            }
                        }
                    } else {
                        QueryRequest qr = new QueryRequest();
                        qr.addQuery("list", query);
                        ResultSetContainer rsc = (ResultSetContainer)
                                new QueryDataAccess(DBMS.OLTP_DATASOURCE_NAME).getData(qr).get("list");
                        if (rsc.isEmpty()) {
                            addError(AOLHelper.QUERY, "Query returned no rows");
                            setDefault(AOLHelper.MESSAGE_TEXT, text);
                            setDefault(Constants.PROJECT_ID, projectId);
                            setDefault(Constants.ROUND_ID, roundId);
                            setDefault(Constants.HANDLE, handle);
                            setDefault(AOLHelper.QUERY, query);
                        } else {
                            for (int i = 0; i < rsc.size(); i++) {
                                people.put(rsc.getStringItem(i, "user_id"), rsc.getStringItem(i, "aol_encrypted_user_id"));
                            }
                        }
                    }

                    Map messageData = new HashMap();

                    if (!hasErrors()) {
                        log.debug("sending a individual alert");

                        if (roundId != null) {
                            messageData = createTexts(roundData, text, people);
                        } else {
                            messageData = createTexts(projectData, text, people);
                        }

                        Map.Entry me;
                        for (Iterator it = messageData.entrySet().iterator(); it.hasNext();) {
                            me = (Map.Entry) it.next();
                            if (((String) me.getValue()).length() > 100) {
                                addError(AOLHelper.MESSAGE_TEXT, "Text too long: " + me.getValue());
                                setDefault(AOLHelper.MESSAGE_TEXT, text);
                                setDefault(Constants.PROJECT_ID, projectId);
                                setDefault(Constants.ROUND_ID, roundId);
                                setDefault(Constants.HANDLE, handle);
                                setDefault(AOLHelper.QUERY, query);
                            }
                        }
                    }


                    if (!hasErrors()) {
                        MessagingNotificationManager man = new MessagingNotificationManager(AOLHelper.notificationRegistry);
                        man.setNotificationEndPoint("https://webservices.alerts.aol.com/api/services/AlertsFeedAPIService");

                        NotificationResult result;
                        Map.Entry me;
                        String messageText;
                        StringBuffer buf = new StringBuffer(1000);
                        for (Iterator it = messageData.entrySet().iterator(); it.hasNext();) {
                            me = (Map.Entry) it.next();
                            messageText = (String) me.getValue();
                            result = man.notify(AOLHelper.INDIVIDUAL, new String[]{(String) me.getKey()},
                                    new AOLAlertNotificationMessage(messageText, messageText, messageText, messageText))[0];
                            if (result.getTransactionId() == null) {
                                buf.append("Send to ").append(me.getValue()).append(" failed: ").
                                        append(result.getErrorCode()).append(" ").append(result.getErrorReason()).
                                        append(" ").append(result.getErrorDetail());
                            }

                        }

                        if (buf.length() > 0) {
                            throw new NavigationException(buf.toString());
                        } else {
                            setNextPage(getSessionInfo().getServletPath() + "?" +
                                    Constants.MODULE_KEY + "=Static&d1=tournaments&d2=tccc06&d3=aol_alert_sent");
                            setIsNextPageInContext(false);
                        }
                    }

                }


            } else if (AOLHelper.TCCC_ANNOUNCEMENT.equals(alertName) ||
                    AOLHelper.TCCC_ONSITE_FINALS.equals(alertName) ||
                    AOLHelper.TCCC_REMINDER.equals(alertName) ||
                    AOLHelper.SRM_REMINDER.equals(alertName) ||
                    AOLHelper.COMPONENT_POSTING.equals(alertName)) {
                if ("".equals(StringUtils.checkNull(text))) {
                    addError(AOLHelper.MESSAGE_TEXT, "Empty message");
                    setDefault(AOLHelper.MESSAGE_TEXT, text);
                    setDefault(Constants.PROJECT_ID, projectId);
                    setDefault(Constants.ROUND_ID, roundId);
                    setDefault(Constants.HANDLE, handle);
                } else {
                    log.debug("sending a group alert");

                    String messageText;
                    if (roundId != null) {
                        messageText = createGeneralMessage(roundData, text);
                    } else {
                        messageText = createGeneralMessage(projectData, text);
                    }


                    MessagingNotificationManager man = new MessagingNotificationManager(AOLHelper.notificationRegistry);
                    man.setNotificationEndPoint("https://webservices.alerts.aol.com/api/services/AlertsFeedAPIService");

                    AOLAlertNotificationMessage message = new AOLAlertNotificationMessage(messageText, messageText,
                            messageText, messageText);
                    log.debug("before group send");

                    NotificationResult result = man.notify(alertName, message);
                    log.debug("after group send");
                    if (result.getTransactionId() == null) {
                        throw new NavigationException("Send failed: " + result.getErrorCode() + " " +
                                result.getErrorReason() + " " + result.getErrorDetail());
                    }
                    setNextPage(getSessionInfo().getServletPath() + "?" +
                            Constants.MODULE_KEY + "=Static&d1=tournaments&d2=tccc06&d3=aol_alert_sent");
                    setIsNextPageInContext(false);
                }
            } else {
                addError(AOLHelper.MESSAGE_TEXT, "Unknown alert specified");
                setDefault(AOLHelper.MESSAGE_TEXT, text);
                setDefault(Constants.PROJECT_ID, projectId);
                setDefault(Constants.ROUND_ID, roundId);
                setDefault(Constants.HANDLE, handle);
            }

            if (hasErrors()) {
                setNextPage("/tournaments/tccc06/aol_alerts_sender.jsp");
                setIsNextPageInContext(true);
            }

        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
    }

    private final String[] generalTags = new String[]{
            "round_name", "component_name", "catalog", "version"
    };
    private final String[] personalTags = new String[]{
            "placed", "points", "money"
    };
    private final String[] dateTags = new String[]{
            "reg_start", "reg_end", "date"
    };

    private static ObjectFormatter dateFormatter = ObjectFormatterFactory.getEmptyFormatter();
    private static ObjectFormatter timeFormatter = ObjectFormatterFactory.getEmptyFormatter();

    static {
        dateFormatter.setFormatMethodForClass(Calendar.class,
                new CalendarDateFormatMethod("MMM d, yyyy"), true);
        timeFormatter.setFormatMethodForClass(Calendar.class,
                new CalendarDateFormatMethod("HH:mm z"), true);
    }

    private String createGeneralMessage(ResultSetContainer data, String template) {

        if (data == null) {
            return template;
        } else {
            String ret = template;
            boolean hasGenTag = false;
            for (int i = 0; i < generalTags.length && !hasGenTag; i++) {
                ret = StringUtils.replace(ret, "$" + generalTags[i], data.getStringItem(0, generalTags[i]));
            }
            return ret;
        }
    }

    private Map createTexts(ResultSetContainer data, String template, Map people) {
        HashMap ret = new HashMap();

        String[] $personalTags = new String[personalTags.length];
        String[] $dateTags = new String[dateTags.length];


        boolean hasPersonalTag = false;
        for (int i = 0; i < personalTags.length && !hasPersonalTag; i++) {
            $personalTags[i] = "$" + personalTags[i];
            hasPersonalTag = template.indexOf($personalTags[i]) >= 0;
        }

        boolean hasDateTag = false;
        for (int i = 0; i < dateTags.length && !hasDateTag; i++) {
            $dateTags[i] = "$" + dateTags[i];
            hasDateTag = template.indexOf($dateTags[i]) >= 0;
        }

        String newTemplate = createGeneralMessage(data, template);

        //fill in everyone's general tag stuff.  we can do this all the same since it's "general"
        if (data == null) {
            for (Iterator it = people.entrySet().iterator(); it.hasNext();) {
                ret.put(((Map.Entry) it.next()).getValue(), newTemplate);
            }
        } else {
            for (Iterator it = data.iterator(); it.hasNext();) {
                ret.put(people.get(((ResultSetContainer.ResultSetRow) it.next()).getStringItem("user_id")), newTemplate);
            }

            UserDAO dao = DAOUtil.getFactory().getUserDAO();
            User u;
            Calendar cal = Calendar.getInstance();

            if (hasPersonalTag || hasDateTag) {
                ResultSetContainer.ResultSetRow row;
                String encryptedUserId;
                String text;
                for (Iterator it = data.iterator(); it.hasNext();) {
                    row = (ResultSetContainer.ResultSetRow) it.next();
                    encryptedUserId = (String) people.get(row.getStringItem("user_id"));
                    text = (String) ret.get(encryptedUserId);
                    if (hasPersonalTag) {
                        for (int j = 0; j < personalTags.length; j++) {
                            text = StringUtils.replace(text, $personalTags[j], row.getStringItem(personalTags[j]));
                            ret.put(encryptedUserId, text);
                        }
                    }
                    if (hasDateTag) {
                        for (int j = 0; j < dateTags.length; j++) {
                            if (text.indexOf($dateTags[j]) >= 0) {
                                u = dao.find(new Long(row.getStringItem("user_id")));
                                cal.setTime((Date) row.getItem(dateTags[j]).getResultData());
                                cal.setTimeZone(TimeZone.getTimeZone(u.getTimeZone().getDescription()));
                                if (dateTags[j].equals("date")) {
                                    text = StringUtils.replace(text, $dateTags[j], dateFormatter.format(cal));
                                } else {
                                    text = StringUtils.replace(text, $dateTags[j], timeFormatter.format(cal));
                                }
                                ret.put(encryptedUserId, text);
                            }
                        }
                    }
                }
            }
        }
        return ret;
    }

    private ResultSetContainer getRoundData(String roundId) throws Exception {
        Request r = new Request();
        r.setContentHandle("aol_round_data");
        r.setProperty(Constants.ROUND_ID, roundId);
        DataAccess da = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
        return (ResultSetContainer) da.getData(r).get("aol_round_data");
    }

    private ResultSetContainer getProjectData(String projectId) throws Exception {
        Request r = new Request();
        r.setContentHandle("aol_project_data");
        r.setProperty(Constants.PROJECT_ID, projectId);
        DataAccess da = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
        return (ResultSetContainer) da.getData(r).get("aol_round_data");
    }
}
