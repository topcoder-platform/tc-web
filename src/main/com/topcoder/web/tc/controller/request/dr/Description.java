/*
 * Copyright (c) 2001-2008 TopCoder Inc.  All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.dr;

import java.util.Arrays;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Map;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.cache.MaxAge;

/**
 * Copyright (c) 2001-2008 TopCoder, Inc. All rights reserved.
 * Only for use in connection with a TopCoder competition.
 *
 * @author pulky
 * @version $Id$
 * Create Date: Jul 4, 2008
 */
public class Description extends BaseProcessor {

    public static List<Integer> DESIGN_PROJECT_CATEGORIES = Arrays.asList(1, 7, 13);
    public static List<Integer> DEVELOPMENT_PROJECT_CATEGORIES = Arrays.asList(2, 5, 14);
    
    /* (non-Javadoc)
     * @see com.topcoder.web.common.BaseProcessor#businessProcessing()
     */
    @Override
    protected void businessProcessing() throws Exception {

        ResultSetContainer rsc = getPointsData(DBMS.TCS_OLTP_DATASOURCE_NAME);

        PoolPrize designPrize = new PoolPrize();
        PoolPrize developmentPrize = new PoolPrize();        
        for (ResultSetRow rsr : rsc) {
            if (DESIGN_PROJECT_CATEGORIES.contains(rsr.getIntItem("category_id"))) {
                designPrize.addTotal(rsr.getDoubleItem("total_dr_points"));
                designPrize.addToday(rsr.getDoubleItem("total_dr_points_today"));
            } else  if (DEVELOPMENT_PROJECT_CATEGORIES.contains(rsr.getIntItem("category_id"))) {
                developmentPrize.addTotal(rsr.getDoubleItem("total_dr_points"));
                developmentPrize.addToday(rsr.getDoubleItem("total_dr_points_today"));
            }
        }

        PoolPrize studioPrize = new PoolPrize();        
        rsc = getPointsData(DBMS.STUDIO_DATASOURCE_NAME);
        if (rsc.size() > 0) {
            ResultSetRow rsr = rsc.iterator().next();
            studioPrize.addTotal(rsr.getDoubleItem("total_dr_points"));
            studioPrize.addToday(rsr.getDoubleItem("total_dr_points_today"));            
        }
        

        getRequest().setAttribute("designPrize", designPrize);
        getRequest().setAttribute("developmentPrize", developmentPrize);
        getRequest().setAttribute("studioPrize", studioPrize);

        setNextPage("/digital_run/description.jsp");
        setIsNextPageInContext(true);        
    }

    /**
     * @return
     * @throws Exception
     */
    private ResultSetContainer getPointsData(String datasource) throws Exception {
        CachedDataAccess cda = new CachedDataAccess(MaxAge.HALF_HOUR, datasource);
        Request dataRequest = new Request();
        dataRequest.setContentHandle("dr_pool_detail");
        Calendar now = new GregorianCalendar();
        dataRequest.setProperty("month", String.valueOf(now.get(Calendar.MONTH)+1));
        dataRequest.setProperty("year", String.valueOf(now.get(Calendar.YEAR)));
        Map<String, ResultSetContainer> map = cda.getData(dataRequest);
        ResultSetContainer rsc = map.get("dr_pool_detail");
        return rsc;
    }

    public class PoolPrize {
        double total = 0;
        double today = 0;

        public double getTotal() {
            return total;
        }
        public void addToday(double doubleItem) {
            today += doubleItem;
        }
        public void addTotal(double doubleItem) {
            total += doubleItem;
        }
        public void setTotal(double total) {
            this.total = total;
        }
        public double getToday() {
            return today;
        }
        public void setToday(double today) {
            this.today = today;
        }
    }
}
