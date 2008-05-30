package com.topcoder.web.tc.controller.request;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.SoftwareComponent;
import com.topcoder.web.common.cache.MaxAge;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.ActiveContestsSummary;
import com.topcoder.web.tc.controller.request.tournament.tccc06.ViewAlgoRegistration;
import com.topcoder.web.tc.controller.request.util.TCCC06ComponentTerms;

import java.util.Map;
import java.util.HashMap;

public class Home extends Base {
    public static final String DESIGN = "design";
    public static final String ASSEMBLY = "assembly";
    public static final String DEVELOPMENT = "dev";
    public static final String APPLICATION_TESTING = "apptesting";
    public static final String ARCHITECTURE= "arch";
    public static final String STUDIO = "studio";
    public static final String BUGS = "bugs";
    public static final String DR = "dr";
    public static final String MM = "mm";
    public static final String NEXT_ALGO = "nextalgo";

    protected void businessProcessing() throws TCWebException {
        if (getUser().isAnonymous()) {
            loadPublicData();
            setNextPage(Constants.PUBLIC_HOME_PAGE);
        } else {
            loadPublicData();
            loadMemberData();
            setNextPage(Constants.MEMBER_HOME_PAGE);
        }
        setIsNextPageInContext(true);
    }

    protected void loadPublicData() throws TCWebException {
        try {
/*
            CachedDataAccess nextRoundDai = new CachedDataAccess(DBMS.OLTP_DATASOURCE_NAME);
            nextRoundDai.setExpireTime(30 * 60 * 1000);
            Request nextRoundReq = new Request();
            nextRoundReq.setContentHandle("next_srm");
            getRequest().setAttribute("Next_SRM", nextRoundDai.getData(nextRoundReq).get("Next_SRM"));
*/

            CachedDataAccess dwDai = new CachedDataAccess(DBMS.DW_DATASOURCE_NAME);
            Request dataRequest = new Request();
            dataRequest.setContentHandle("public_home_data");
            dataRequest.setProperty("sr", "1");
            dataRequest.setProperty("er", "10");   // just get the top 10
            
            Map<String, ResultSetContainer> map = dwDai.getData(dataRequest);
            
            getRequest().setAttribute("top_coders", map.get("Coder_Ratings"));
            getRequest().setAttribute("top_mm_coders",map.get("marathon_coder_rank"));
            getRequest().setAttribute("School_Avg_Rating",map.get("School_Avg_Rating"));
            getRequest().setAttribute("Country_Avg_Rating",map.get("Country_Avg_Rating"));
            getRequest().setAttribute("top_developers",map.get("top_developers"));
            getRequest().setAttribute("top_designers",map.get("top_designers"));

            getRequest().setAttribute("activeContestsSummary", getActiveContests());

/*
            CachedDataAccess surveyDai = new CachedDataAccess(DBMS.OLTP_DATASOURCE_NAME);
            Request surveyRequest = new Request();
            surveyRequest.setContentHandle("recent_srm_survey_question");
            getRequest().setAttribute("recent_srm_survey_question",
                    surveyDai.getData(surveyRequest).get("recent_srm_survey_question"));
*/

/*
            CachedDataAccess tcsDai = new CachedDataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
            Request tcsRequest = new Request();
            tcsRequest.setContentHandle("project_totals");
            getRequest().setAttribute("total_component_prices",
                    tcsDai.getData(tcsRequest).get("total_component_prices"));
*/


        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    protected void loadMemberData() throws TCWebException {
        try {
            CachedDataAccess dwDai = new CachedDataAccess(DBMS.DW_DATASOURCE_NAME);
            Request dataRequest = new Request();
            //we'll sacrifice here a little by using the same command as statistics.
            //this gives us WAY more data than we need, but it means that we can
            //use the cache both for the home page and the member profile page
            dataRequest.setContentHandle("member_profile");
            dataRequest.setProperty("cr", String.valueOf(getUser().getId()));
            getRequest().setAttribute("member_info", dwDai.getData(dataRequest).get("Coder_Data"));


            TCCC06ComponentTerms compTerms = new TCCC06ComponentTerms();
            compTerms.setRequest(getRequest());
            compTerms.setResponse(getResponse());
            compTerms.setAuthentication(getAuthentication());

            ViewAlgoRegistration algoTerms = new ViewAlgoRegistration();
            algoTerms.setRequest(getRequest());
            algoTerms.setResponse(getResponse());
            algoTerms.setAuthentication(getAuthentication());

            getRequest().setAttribute("compTerms", compTerms);
            getRequest().setAttribute("algoTerms", algoTerms);

/*
tchs08 is over, don't need to do this anymore
            DataAccess tchs08Dai = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
            Request tchs08Request = new Request();
            tchs08Request.setProperty("cr", String.valueOf(getUser().getId()));
            
            tchs08Request.setContentHandle("tchs08_eligibility");
            getRequest().setAttribute("tchs08_info",
                    tchs08Dai.getData(tchs08Request).get("tchs08_eligibility"));
*/

/*            DataAccess tco07Dai = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
            Request tco07Request = new Request();
            tco07Request.setProperty("cr", String.valueOf(getUser().getId()));
            
            tco07Request.setContentHandle("tco07_info");
            getRequest().setAttribute("tco07_info",
                    tco07Dai.getData(tco07Request).get("tco07_info"));*/

/*  tco is over, don't need to do this anymore
            DataAccess tco08Dai = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
            Request tco08Request = new Request();
            tco08Request.setProperty("cr", String.valueOf(getUser().getId()));
            
            tco08Request.setContentHandle("tco08_info");
            getRequest().setAttribute("tco08_info",
                    tco08Dai.getData(tco08Request).get("tco08_info"));
*/


        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }


    private Map<String, ActiveContestsSummary> getActiveContests() throws Exception {
        HashMap<String, ActiveContestsSummary> ret = new HashMap<String, ActiveContestsSummary>();
        ret.putAll(getOnlineReviewSummary());
        return ret;
    }

    private ActiveContestsSummary getStudioSummary() {
        ActiveContestsSummary ret = new ActiveContestsSummary();
        return ret;
    }

    private Map<String, ActiveContestsSummary> getOnlineReviewSummary() throws Exception {
        HashMap<String, ActiveContestsSummary> ret = new HashMap<String, ActiveContestsSummary>();
        CachedDataAccess dai = new CachedDataAccess(MaxAge.QUARTER_HOUR, DBMS.DW_DATASOURCE_NAME);
        Request dataRequest = new Request();
        dataRequest.setContentHandle("homepage_active_contest_summary");

        ActiveContestsSummary summary;
        StringBuilder b;
        for (ResultSetContainer.ResultSetRow row : dai.getData(dataRequest).get("homepage_active_contest_summary")) {
            summary = new ActiveContestsSummary();
            summary.setContestCount(row.getIntItem("total_contests"));
            summary.setName(row.getStringItem("category_name"));
            summary.setTotalPrizes(row.getFloatItem("total_prizes"));

            switch (row.getIntItem("project_category_id")) {

                case Constants.DESIGN_PROJECT_TYPE: {
                    summary.setUrl(makeDevDesignActiveContestUrl(row.getIntItem("project_category_id")));
                    ret.put(DESIGN, summary);
                    break;
                }
                case Constants.DEVELOPMENT_PROJECT_TYPE: {
                    summary.setUrl(makeDevDesignActiveContestUrl(row.getIntItem("project_category_id")));
                    ret.put(DEVELOPMENT, summary);
                    break;
                }
                case Constants.ASSEMBLY_PROJECT_TYPE: {
                    summary.setUrl(makeGeneralActiveContestUrl(row.getIntItem("project_category_id")));
                    ret.put(ASSEMBLY, summary);
                    break;
                }
                case Constants.APPLICATION_TESTING_PROJECT_TYPE: {
                    summary.setUrl(makeGeneralActiveContestUrl(row.getIntItem("project_category_id")));
                    ret.put(APPLICATION_TESTING, summary);
                    break;
                }
                case Constants.ARCHITECTURE_PROJECT_TYPE: {
                    summary.setUrl(makeGeneralActiveContestUrl(row.getIntItem("project_category_id")));
                    ret.put(ARCHITECTURE, summary);
                    break;
                }
            }
            
        }

        return ret;
    }

    /**
     * we have a number of contest types that use the same active contests page.
     * this method builds the url for that
     *
     * @param type the type of contest - it will be a project_category_id
     * @return the url
     */
    private String makeGeneralActiveContestUrl(int type) {
        StringBuilder b = new StringBuilder(70);
        b.append(getSessionInfo().getServletPath()).append("?").append(Constants.MODULE_KEY);
        b.append("=").append("ActiveContests").append("&amp;").append(Constants.PROJECT_TYPE_ID);
        b.append("=").append(type);
        return b.toString();
    }

    /**
     * dev and design use a similar url for their active contest page.  use
     * the type passed in to create that url.
     * @param type - the project_category_id of the contest
     * @return the url to link to the active contests page
     */
    private String makeDevDesignActiveContestUrl(int type) {
        StringBuilder b = new StringBuilder(70);
        b.append(getSessionInfo().getServletPath()).append("?").append(Constants.MODULE_KEY);
        b.append("=").append("ViewActiveContests").append("&amp;").append(Constants.PHASE_ID).append("=");
        if (type==Constants.DEVELOPMENT_PROJECT_TYPE) {
            b.append(SoftwareComponent.DEV_PHASE);
        } else if (type==Constants.DESIGN_PROJECT_TYPE) {
            b.append(SoftwareComponent.DESIGN_PHASE);
        }
        return b.toString();

    }
    private ActiveContestsSummary getMMSummary() {
        ActiveContestsSummary ret = new ActiveContestsSummary();
        return ret;
    }

    private ActiveContestsSummary getBugRaceSummary() {
        ActiveContestsSummary ret = new ActiveContestsSummary();
        return ret;
    }

    private ActiveContestsSummary getDigitalRunSummary() {
        ActiveContestsSummary ret = new ActiveContestsSummary();
        return ret;
    }





    //**********************************************
    //* member stuff
    //**********************************************

/*

                    dataRequest = new Request();
                    dataRequest.setContentHandle("member_profile");
                    dataRequest.setProperty("cr", String.valueOf(nav.getUserId()));
                    resultMap = dai.getData(dataRequest);
                    rsc = (ResultSetContainer) resultMap.get("Coder_Data");
                    homeTag.addTag(rsc.getTag("Coder", "Coder"));

                    dataRequest = new Request();
                    dataRequest.setContentHandle("member_profile");
                    dataRequest.setProperty("cr", "" + nav.getUserId());
                    resultMap = dai.getData(dataRequest);
                    rsc = (ResultSetContainer) resultMap.get("Coder_Data");
                    homeTag.addTag(rsc.getTag("CoderData", "Data"));


                }*/

}
