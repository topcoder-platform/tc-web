package com.topcoder.web.tc.controller.request.problemRating;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.web.tc.model.ProblemRatingResult;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class Questions extends Base {
    protected void businessProcessing() throws TCWebException {
        try{
            Request r = new Request();
            r.setContentHandle("Problem Rating Questions");
            r.setProperty("pm", getRequest().getParameter(Constants.PROBLEM_ID));
            //response data has to be live, no cache
            DataAccessInt dataAccess = getDataAccess();
            Map qMap = dataAccess.getData(r);
            ResultSetContainer questions = (ResultSetContainer) qMap.get("problem rating questions");
            ResultSetContainer problemName = (ResultSetContainer) qMap.get("problem name");
            getRequest().setAttribute("problemRatingQuestions",questions);
            getRequest().setAttribute("problemName",problemName.getRow(0).getStringItem("name"));
            setNextPage(Constants.PROBLEM_RATING_QUESTIONS);
            setIsNextPageInContext(true);
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}

