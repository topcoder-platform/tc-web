package com.topcoder.shared.util;

import java.util.StringTokenizer;

/**
 * A class to hold application wide constants
 * @author Steve Burrows
 * @version $Revision$
 * @version $Revision$
 */
public class ApplicationServer {

    private static TCResourceBundle bundle = new TCResourceBundle("ApplicationServer");

    public static final int PROD = bundle.getIntProperty("PROD", 1);
    public static final int QA = bundle.getIntProperty("QA", 2);
    public static final int DEV = bundle.getIntProperty("DEV", 3);

    public static int ENVIRONMENT = bundle.getIntProperty("ENVIRONMENT", DEV);
    public static String SERVER_NAME = bundle.getProperty("SERVER_NAME", "172.16.20.20");
    public static String HOST_URL = bundle.getProperty("HOST_URL", "t3://172.16.20.41:7030");
    public static String CONTEST_HOST_URL = bundle.getProperty("CONTEST_HOST_URL", "t3://172.16.20.40:9003");
    public static String[] WEBLOGIC_CLUSTER_IP = getClusterArray(bundle.getProperty("WEBLOGIC_CLUSTER_IP", "172.16.20.41"));
    public static String BASE_DIR = bundle.getProperty("BASE_DIR", "/usr/web/build/classes");
    public static String SECURITY_PROVIDER_URL = bundle.getProperty("SECURITY_PROVIDER_URL", "172.16.20.40:1099");

    public static String IAGREE = bundle.getProperty("IAGREE", BASE_DIR + "/com/topcoder/common/terms.txt");
    public final static String JNDI_FACTORY = bundle.getProperty("JNDI_FACTORY", "weblogic.jndi.WLInitialContextFactory");
    public final static String JMS_FACTORY = bundle.getProperty("JMS_FACTORY", "jms.connection.jmsFactory");
    public final static String JMS_BKP_FACTORY = bundle.getProperty("JMS_BKP_FACTORY", "jms.connection.jmsFactory_BKP");
    public final static String TRANS_FACTORY = bundle.getProperty("TRANS_FACTORY", "javax.transaction.UserTransaction");
    public final static String TRANS_MANAGER = bundle.getProperty("TRANS_MANAGER", "weblogic/transaction/TransactionManager");
    public final static String SECURITY_CONTEXT_FACTORY = bundle.getProperty("SECURITY_CONTEXT_FACTORY", "org.jnp.interfaces.NamingContextFactory");

    public static String TCS_APP_SERVER_URL = bundle.getProperty("TCS_APP_SERVER_URL", "172.16.20.222:1099");

    public static String AUTHENTICATION_SERVICES = bundle.getProperty("AUTHENTICATION_SERVICES", "com.topcoder.ejb.AuthenticationServicesHome");
    public static String CODER_STATISTICS = bundle.getProperty("CODER_STATISTICS", "com.topcoder.ejb.CoderStatisticsHome");
    public static String DATA_CACHE = bundle.getProperty("DATA_CACHE", "com.topcoder.ejb.DataCacheHome");
    public static String REPORTING = bundle.getProperty("REPORTING", "com.topcoder.ejb.ReportingHome");
    public static String SEARCH = bundle.getProperty("SEARCH", "com.topcoder.ejb.SearchHome");
    public static String USER_SERVICES = bundle.getProperty("USER_SERVICES", "com.topcoder.ejb.UserServicesHome");
    public static String UTIL = bundle.getProperty("UTIL", "com.topcoder.ejb.UtilHome");
    public static String MPSQAS_SERVICES = bundle.getProperty("MPSQAS_SERVICES", "jma.MPSQASServicesHome");
    public static String CONTEST_ADMIN_SERVICES = bundle.getProperty("CONTEST_ADMIN_SERVICES", "jma.ContestAdminServicesHome");
    public static String PACTS_SERVICES = bundle.getProperty("PACTS_SERVICES", "com.topcoder.web.pacts.ejb.PactsServicesHome");
    public static String PROJECT_SERVICES = bundle.getProperty("PROJECT_SERVICES", "tc.ProjectServicesHome");
    public static String JOB_POSTING_SERVICES = bundle.getProperty("JOB_POSTING_SERVICES", "com.topcoder.web.tces.ejb.JobPostingServicesHome");
    public static String JAVA_DOC_SERVICES = bundle.getProperty("JAVA_DOC_SERVICES", "jma.JavaDocServicesHome");
    public static String RESUME_SERVICES = bundle.getProperty("RESUME_SERVICES", "com.topcoder.web.resume.ejb.ResumeServicesHome");

    public static String Q_QUERY_AUTHENTICATION = bundle.getProperty("Q_QUERY_AUTHENTICATION", "com.topcoder.web.query.ejb.QueryServices.QueryAuthentication");
    public static String Q_COMMAND = bundle.getProperty("Q_COMMAND", "com.topcoder.web.query.ejb.QueryServices.Command");
    public static String Q_COMMAND_GROUP = bundle.getProperty("Q_COMMAND_GROUP", "com.topcoder.web.query.ejb.QueryServices.CommandGroup");
    public static String Q_COMMAND_QUERY = bundle.getProperty("Q_COMMAND_QUERY", "com.topcoder.web.query.ejb.QueryServices.CommandQuery");
    public static String Q_INPUT = bundle.getProperty("Q_INPUT", "com.topcoder.web.query.ejb.QueryServices.Input");
    public static String Q_QUERY = bundle.getProperty("Q_QUERY", "com.topcoder.web.query.ejb.QueryServices.Query");
    public static String Q_QUERY_INPUT = bundle.getProperty("Q_QUERY_INPUT", "com.topcoder.web.query.ejb.QueryServices.QueryInput");

    //formats used by informix for converting string to date(time)
    public static String INFORMIX_DATE_FORMAT = bundle.getProperty("INFORMIX_DATE_FORMAT", "MM/dd/yy");
    public static String INFORMIX_DATETIME_FORMAT = bundle.getProperty("INFORMIX_DATETIME_FORMAT", "yyyy-MM-dd HH:mm:ss.SSS");

    private static String[] getClusterArray(String s) {
        StringTokenizer st = new StringTokenizer(s, ",");
        String[] ret = new String[st.countTokens()];
        int i = 0;
        while (st.hasMoreTokens()) {
            ret[i] = st.nextToken();
            i++;
        }
        return ret;
    }
}
