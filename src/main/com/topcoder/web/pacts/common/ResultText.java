package com.topcoder.web.pacts.common;

import java.util.*;
import com.topcoder.web.common.*;
import org.apache.log4j.*;
   
public class ResultText implements PactsConstants {
    private static Category log = 
	PactsLog.getInstance(ResultText.class.getName());

    public String text;

    public ResultText(Map results) {
	ResultSetContainer rsc = (ResultSetContainer) results.get(TEXT);

	// check if it was there
	if(rsc == null) {
	    log.error("The result map did not contain " + TEXT );
	    return;
	}

	ResultSetContainer.ResultSetRow rRow = rsc.getRow(0);

	text = TCData.getTCString(rRow,"text");
    }
}

