/******************************************************************************\
*
* File:          InternalDispatchTaxFormList.java
* Creation date: March 11, 2002 19:32
* Author:        Matt Murphy
*
* Modifications: @INSERT_MODIFICATIONS(* )
*
* Copyright 2002, TopCoder, Inc
* All rights are reserved. Reproduction in whole or part is prohibited
* without the written consent of the copyright owner.
*
\******************************************************************************/

package com.topcoder.web.pacts.bean.pacts_internal.dispatch;

import com.topcoder.web.pacts.common.*;
//import com.topcoder.web.pacts.bean.pacts_internal.interface.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
//import com.topcoder.web.stat.common.*;
import com.topcoder.web.pacts.bean.*;

public class InternalDispatchTaxFormList implements PactsConstants {
	HttpServletRequest request;
	HttpServletResponse response;

	public InternalDispatchTaxFormList(HttpServletRequest request,
			HttpServletResponse response) {

		this.request = request;
		this.response = response;
	}

/**
*
* This method returns an array of TaxFormHeaders that match the search criteria.
* The criteria are found in the cgi variables of request.
* Method assumes at least one search parameter exists.
*
* @Args    - none
* @Returns - TaxFormHeader[]
*
*/
	public TaxFormHeader[] get() throws Exception {
		Map query = new Hashtable();
		String param;

/*
    public static final String EARLIEST_DATE_FILED = "earliest_date_filed";
    public static final String LATEST_DATE_FILED = "latest_date_filed";
    public static final String LOWEST_WITHHOLDING_AMOUNT = "lowest_withholding_amount";
    public static final String HIGHEST_WITHHOLDING_AMOUNT = "highest_withholding_amount";
    public static final String LOWEST_WITHHOLDING_PERCENTAGE = "lowest_withholding_percentage";
    public static final String HIGHEST_WITHHOLDING_PERCENTAGE = "highest_withholding_percentage";
*/

		param = request.getParameter(STATUS_CODE);
		if (param != null && !param.equals("")) query.put(STATUS_CODE, param);
		param = request.getParameter(LOWEST_WITHHOLDING_AMOUNT);
		if (param != null && !param.equals("")) query.put(LOWEST_WITHHOLDING_AMOUNT, param);
		param = request.getParameter(HIGHEST_WITHHOLDING_AMOUNT);
		if (param != null && !param.equals("")) query.put(HIGHEST_WITHHOLDING_AMOUNT, param);
		param = request.getParameter(LOWEST_WITHHOLDING_PERCENTAGE);
		if (param != null && !param.equals("")) query.put(LOWEST_WITHHOLDING_PERCENTAGE, param);
		param = request.getParameter(HIGHEST_WITHHOLDING_PERCENTAGE);
		if (param != null && !param.equals("")) query.put(HIGHEST_WITHHOLDING_PERCENTAGE, param);

		DataInterfaceBean bean = new DataInterfaceBean();

		Map results = bean.findTaxForms(query);

		if (results == null) return new TaxFormHeader[0];

		TaxFormHeaderList tfhl = new TaxFormHeaderList(results);

		return tfhl.headerList;
	}
};
