/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.contest;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.util.config.ConfigManager;
import com.topcoder.util.config.UnknownNamespaceException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * <p><strong>Purpose</strong>: This processor handle requests to preview active contests for a specific
 * project type.</p>
 *
 * <p>
 *   Version 1.1 (Studio Coding In Online Review) Change notes:
 *   <ol>
 *     <li>Added support for new UI Prototype, RIA Build and RIA Component competitions.</li>
 *   </ol>
 *
 *   Version 1.2 (Testing Competition Split Release Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Updated Application Testing to Test Suites</li>
 *     <li>Added support for new Test Scenarios competitions</li>
 *   </ol>
 * </p>
 *
 * @author dok, pulky
 * @version 1.2
 */
public class ActiveContests extends ActiveContestsBase {

    /**
     * <p>An <code>int[]</code> representing default valid project types. This array will be used for
     * validation if the configuration entry is not found.</p>
     */
    public static final int[] DEFAULT_PROJECT_TYPES = new int[] {Constants.ASSEMBLY_PROJECT_TYPE,
        Constants.ARCHITECTURE_PROJECT_TYPE, Constants.TEST_SUITES_PROJECT_TYPE, Constants.TEST_SCENARIOS_PROJECT_TYPE,
        Constants.SPECIFICATION_PROJECT_TYPE, Constants.CONCEPTUALIZATION_PROJECT_TYPE,
        Constants.UI_PROTOTYPE_PROJECT_TYPE, Constants.RIA_BUILD_PROJECT_TYPE,
        Constants.RIA_COMPONENT_PROJECT_TYPE, Constants.COPILOT_POSTING_PROJECT_TYPE};

    public static final String DEFAULT_NAMESPACE = "com.topcoder.web.tc.controller.request.contest.ActiveContests";

    @Override
    protected void developmentProcessing() throws TCWebException {
        int projectTypeId =  com.topcoder.web.tc.controller.request.development.Base.getProjectTypeId(getRequest());

        if (isValidProjectType(projectTypeId)) {
            setProjectType(projectTypeId);
        } else {
            throw new TCWebException("Invalid project type specified " + projectTypeId);
        }

        if (projectTypeId == Constants.COPILOT_POSTING_PROJECT_TYPE) {
            try {
                // get permission map and set into request for copilot postings
                Map<Long, Boolean> copilotPostingViewPermissions = populateCopilotPostingPermissions();

                if (this.getSessionInfo().isAdmin()) {
                    System.out.println("this.getSessionInfo().isAdmin():" + this.getSessionInfo().isAdmin());

                    // set all the copilot permissions to true
                    for (Long key : copilotPostingViewPermissions.keySet()) {
                        copilotPostingViewPermissions.put(key, true);
                    }
                }
                getRequest().setAttribute("permissions", copilotPostingViewPermissions);
            } catch (Exception ex) {
                throw new TCWebException("Error occurs while getting copilot posting permissions", ex);
            }
        }
        super.developmentProcessing();
    }

    @Override
    protected String getCommandName() {
        if (getProjectType()==Constants.ARCHITECTURE_PROJECT_TYPE) {
            return "active_architecture_contests";
        } else {
            return super.getCommandName();
        }
    }

    @Override
    protected String getActiveContestsPage() {
        if (getProjectType()==Constants.COPILOT_POSTING_PROJECT_TYPE) {
            return "/copilotposting/activeContests.jsp";
        } else {
            return "/contest/activeContests.jsp";
        }
    }

    @Override
    protected Boolean hasDR() {
        return Boolean.TRUE;
    }

    private static boolean isValidProjectType(int projectType) {
        ConfigManager configManager = ConfigManager.getInstance();

        String[] projectTypes = null;
        if (configManager.existsNamespace(DEFAULT_NAMESPACE)) {
            try {
                projectTypes = configManager.getStringArray(DEFAULT_NAMESPACE, "ValidProjectTypes");
            } catch (UnknownNamespaceException e) {
                e.printStackTrace();
                projectTypes = null;
            }
        }

        if (projectTypes == null) {
            for (int i = 0; i < DEFAULT_PROJECT_TYPES.length; i++) {
                if (projectType == DEFAULT_PROJECT_TYPES[i]) {
                    return true;
                }
            }
        } else {
            for (int i = 0; i < projectTypes.length; i++) {
                String strValue = projectType + "";
                if (strValue.equals(projectTypes[i])) {
                    return true;
                }
            }
        }

        return false;
    }

    private Map<Long, Boolean> populateCopilotPostingPermissions() throws Exception {
        Request r = new Request();
        // command - copilot_posting
        r.setContentHandle("copilot_posting");
        r.setProperty("uid", String.valueOf(getUser().getId()));

        // query copilot_postings_permission
        ResultSetContainer result = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME).getData(r).get("copilot_postings_permission");

        Iterator<ResultSetContainer.ResultSetRow> iterator = result.iterator();
        Map<Long, Boolean> permissions = new HashMap<Long, Boolean>();

        // Build the result map
        while (iterator.hasNext()) {
            ResultSetContainer.ResultSetRow row = iterator.next();
            int postingResources = row.getIntItem("copilot_posting_resources");
            int inCopilotPool = row.getIntItem("in_copilot_pool");
            int hasDirectProjectPermission = row.getIntItem("has_direct_project_permission");

            boolean hasPermission =  postingResources > 0 ||  inCopilotPool > 0 || hasDirectProjectPermission > 0;

            permissions.put(row.getLongItem("project_id"), hasPermission);
        }

        return permissions;
    }
}
