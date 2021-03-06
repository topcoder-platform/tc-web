package com.topcoder.web.tc.controller.request.tournament;

import com.cronos.termsofuse.dao.UserTermsOfUseDao;
import com.topcoder.servlet.request.UploadedFile;
import com.topcoder.shared.security.SimpleResource;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.MultipartRequest;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TermsOfUseUtil;
import com.topcoder.web.ejb.coder.CoderImage;
import com.topcoder.web.ejb.image.Image;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Base;

import javax.transaction.Status;
import javax.transaction.TransactionManager;
import java.io.FileOutputStream;
import java.util.Calendar;
import java.util.Date;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Apr 6, 2005
 */
public class TCO05LogoSubmit extends Base {
    private static final String IMAGE_PATH = ApplicationServer.BASE_DIR + "images/tco05logo/";
    private static final int PATH_ID = 19;
    private static final int IMAGE_TYPE = 13;

    protected void businessProcessing() throws Exception {

        if (getUser().isAnonymous()) {
            throw new PermissionException(getUser(), new SimpleResource(this.getClass().getName()));
        } else {
            //check if they agreed to terms, no back doors here buddy!
            UserTermsOfUseDao ut = TermsOfUseUtil.getUserTermsOfUseDao();
            if (ut.hasTermsOfUse(getUser().getId(), Constants.TCO05_LOGO_TERMS_ID)) {
                MultipartRequest request = (MultipartRequest) getRequest();
                UploadedFile file = request.getUploadedFile(Constants.LOGO);
                if (file != null) {
                    StringBuffer fileName = new StringBuffer(100);
                    fileName.append(getUser().getId()).append("_");
                    Calendar cal = Calendar.getInstance();
                    cal.setTime(new Date());
                    fileName.append(cal.get(Calendar.YEAR)).append("_");
                    fileName.append(cal.get(Calendar.MONTH + 1)).append("_");
                    fileName.append(cal.get(Calendar.DAY_OF_MONTH)).append("_");
                    fileName.append(cal.get(Calendar.HOUR_OF_DAY)).append("_");
                    fileName.append(cal.get(Calendar.MINUTE)).append("_");
                    fileName.append(cal.get(Calendar.SECOND)).append("_");
                    fileName.append(cal.get(Calendar.MILLISECOND));
                    int idx = file.getRemoteFileName().lastIndexOf('.');
                    if (idx >= 0)
                        fileName.append(file.getRemoteFileName().substring(file.getRemoteFileName().lastIndexOf('.')));
                    if (log.isDebugEnabled()) {
                        log.debug("filename built is " + fileName.toString());
                    }
                    FileOutputStream fos = new FileOutputStream(IMAGE_PATH + fileName.toString());
                    if (log.isDebugEnabled()) {
                        log.debug("write that file to " + fileName.toString());
                    }
                    byte[] bytes = new byte[(int) file.getSize()];
                    file.getInputStream().read(bytes);
                    file.getInputStream().close();
                    fos.write(bytes);
                    fos.close();

                    TransactionManager tm = (TransactionManager) getInitialContext().lookup(ApplicationServer.TRANS_MANAGER);
                    try {
                        tm.begin();
                        Image image = (Image) createEJB(getInitialContext(), Image.class);
                        CoderImage coderImage = (CoderImage) createEJB(getInitialContext(), CoderImage.class);
                        long imageId = image.createImage(fileName.toString(), IMAGE_TYPE, PATH_ID,
                                DBMS.JTS_OLTP_DATASOURCE_NAME);

                        log.debug("created image " + imageId);
                        coderImage.createCoderImage(getUser().getId(), imageId, false, DBMS.JTS_OLTP_DATASOURCE_NAME);
                        tm.commit();
                        setNextPage("/tournaments/tco05/logo_success.jsp");
                        setIsNextPageInContext(true);
                    } catch (Exception e) {
                        if (tm != null && (tm.getStatus() == Status.STATUS_ACTIVE || tm.getStatus() == Status.STATUS_MARKED_ROLLBACK)) {
                            log.warn("rolling back");
                            tm.rollback();
                        }
                        throw e;
                    }
                }
            } else {
                //go to the terms of use processor
                setNextPage("/tc?module=TCO05LogoTerms");
                setIsNextPageInContext(false);

            }


        }
    }
}

