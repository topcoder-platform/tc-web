<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="com.topcoder.web.tc.controller.request.tournament.tccc06.AOLHelper" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %>


<html>
<head>
    <jsp:include page="/script.jsp"/>
    <title>2006 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
    <link type="text/css" rel="stylesheet" href="/css/TCCC06style.css"/>
    <script language="javascript" type="text/javascript" src="/js/tcdhtml.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>


    <script language="javascript" type="text/javascript">
        <!--
        var srmResults = "srm results";
        var tcccAlgoResults = "tccc alog results";
        var compResults = "comp results";
        var tcccAnnouncement = "tccc announcement";
        var tcccOnsiteFinals = "tccc onsite finals";
        var tcccReminder = "tccc reminder";
        var componentPosting = "component posting";
        var srmReminder = "srm reminder";

            function choose() {
                    if (getValue("document.groupSendFrom", "<%=AOLHelper.ALERT_NAME%>")=="<%=AOLHelper.INDIVIDUAL%> - SRM Results") {
                        putValue("document.groupSendFrom", "<%=AOLHelper.MESSAGE_TEXT%>", srmResults);
                    } else if (getValue("document.groupSendFrom", "<%=AOLHelper.ALERT_NAME%>")=="<%=AOLHelper.INDIVIDUAL%> - TCCC Algo Results") {
                        putValue("document.groupSendFrom", "<%=AOLHelper.MESSAGE_TEXT%>", tcccAlgoResults);
                    } else if (getValue("document.groupSendFrom", "<%=AOLHelper.ALERT_NAME%>")=="<%=AOLHelper.INDIVIDUAL%> - Comp Results") {
                        putValue("document.groupSendFrom", "<%=AOLHelper.MESSAGE_TEXT%>", compResults);
                    } else if (getValue("document.groupSendFrom", "<%=AOLHelper.ALERT_NAME%>")=="<%=AOLHelper.TCCC_ANNOUNCEMENT%>") {
                        putValue("document.groupSendFrom", "<%=AOLHelper.MESSAGE_TEXT%>", tcccAnnouncement);
                    } else if (getValue("document.groupSendFrom", "<%=AOLHelper.ALERT_NAME%>")=="<%=AOLHelper.TCCC_ONSITE_FINALS%>") {
                        putValue("document.groupSendFrom", "<%=AOLHelper.MESSAGE_TEXT%>", tcccOnsiteFinals);
                    } else if (getValue("document.groupSendFrom", "<%=AOLHelper.ALERT_NAME%>")=="<%=AOLHelper.TCCC_REMINDER%>") {
                        putValue("document.groupSendFrom", "<%=AOLHelper.MESSAGE_TEXT%>", tcccReminder);
                    } else if (getValue("document.groupSendFrom", "<%=AOLHelper.ALERT_NAME%>")=="<%=AOLHelper.COMPONENT_POSTING%>") {
                        putValue("document.groupSendFrom", "<%=AOLHelper.MESSAGE_TEXT%>", componentPosting);
                    } else if (getValue("document.groupSendFrom", "<%=AOLHelper.ALERT_NAME%>")=="<%=AOLHelper.SRM_REMINDER%>") {
                        putValue("document.groupSendFrom", "<%=AOLHelper.MESSAGE_TEXT%>", srmReminder);
                    }
            }
        -->
    </script>


</head>

<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp">
    <jsp:param name="tabLev1" value="overview"/>
    <jsp:param name="tabLev2" value="sponsors"/>
    <jsp:param name="tabLev3" value="aol"/>
</jsp:include>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <!-- Body-->
    <tr valign="top">
        <td valign="top" align="center">
            <div class="bodySpacer">

                <div align="center"><img src="/i/tournament/tccc06/aol_logo.gif" alt="AOL" border="0"/></div>

                <form action="${sessionInfo.servletPath}" method="post" name="groupSendFrom">
                    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="SendAOLAlert"/>
                    <select name="<%=AOLHelper.ALERT_NAME%>" onchange="choose()">
                        <option value=""></option>
                        <option value="<%=AOLHelper.INDIVIDUAL%>"><%=AOLHelper.INDIVIDUAL%> - SRM Results</option>
                        <option value="<%=AOLHelper.INDIVIDUAL%>"><%=AOLHelper.INDIVIDUAL%> - TCCC Algo Results</option>
                        <option value="<%=AOLHelper.INDIVIDUAL%>"><%=AOLHelper.INDIVIDUAL%> - Comp Results</option>
                        <option value="<%=AOLHelper.TCCC_ANNOUNCEMENT%>"><%=AOLHelper.TCCC_ANNOUNCEMENT%></option>
                        <option value="<%=AOLHelper.TCCC_ONSITE_FINALS%>"><%=AOLHelper.TCCC_ONSITE_FINALS%></option>
                        <option value="<%=AOLHelper.TCCC_REMINDER%>"><%=AOLHelper.TCCC_REMINDER%></option>
                        <option value="<%=AOLHelper.COMPONENT_POSTING%>"><%=AOLHelper.COMPONENT_POSTING%></option>
                        <option value="<%=AOLHelper.SRM_REMINDER%>"><%=AOLHelper.SRM_REMINDER%></option>
                    </select>


                    <p>
                    <span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=Constants.HANDLE%>">${err}
                        <br></tc-webtag:errorIterator></span>
                    </p>

                    <p>
                    <span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=Constants.ROUND_ID%>">${err}
                        <br></tc-webtag:errorIterator></span>
                    </p>

                    <p>
                        Round Id: <tc-webtag:textInput name="<%=Constants.ROUND_ID%>"/>
                    </p>

                    <p>
                    <span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=Constants.PROJECT_ID%>">${err}
                        <br></tc-webtag:errorIterator></span>
                    </p>

                    <p>
                        Project Id: <tc-webtag:textInput name="<%=Constants.PROJECT_ID%>"/>
                    </p>

                    <p>
                        Handle: <tc-webtag:textInput name="<%=Constants.HANDLE%>"/>
                    </p>
                    <span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=AOLHelper.QUERY%>">${err}
                        <br></tc-webtag:errorIterator></span>

                    <p>
                        Query: (The query should return a list of informixoltp:aol_alert_info.aol_encrypted_user_id)
                        <br/><tc-webtag:textArea name="<%=AOLHelper.QUERY%>" rows="10" cols="50"/>
                    </p>

                    <p>
                    <span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=AOLHelper.MESSAGE_TEXT%>">${err}
                        <br></tc-webtag:errorIterator></span>
                    </p>

                    <p>Message text:<br/>
                        <tc-webtag:textArea name="<%=AOLHelper.MESSAGE_TEXT%>" rows="10" cols="80"/>
                    </p>
                    <button name="send" value="submit" type="submit">Send</button>

                </form>

            </div>
        </td>


        <!-- Right Column-->
        <td>&#160;</td>

    </tr>

</table>


<jsp:include page="../../foot.jsp"/>
</body>

</html>
