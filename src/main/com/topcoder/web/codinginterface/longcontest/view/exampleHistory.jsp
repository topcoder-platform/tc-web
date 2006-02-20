<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page
        language="java"
        import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                com.topcoder.web.codinginterface.longcontest.Constants,
                java.util.Date"

        %>
<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="struts-logic.tld" prefix="logic" %>
<%@ taglib uri="codinginterface.tld" prefix="ci" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<jsp:useBean id="resultMap" type="java.util.Map" scope="request"/>
<jsp:useBean id="sortLinkBase" class="java.lang.String" scope="request"/>
<jsp:useBean id="prevPageLink" class="java.lang.String" scope="request"/>
<jsp:useBean id="nextPageLink" class="java.lang.String" scope="request"/>
<%
    ResultSetContainer examples = (ResultSetContainer) resultMap.get("long_coder_examples");
    ResultSetContainer tmp = (ResultSetContainer) resultMap.get("long_contest_over");
    boolean over = tmp.getBooleanItem(0, 0);
    boolean self = !examples.isEmpty() && examples.getLongItem(0, "coder_id")==sessionInfo.getUserId();
    tmp = (ResultSetContainer) resultMap.get("long_contest_coder_examples_info");
    ResultSetContainer.ResultSetRow infoRow = (ResultSetContainer.ResultSetRow) tmp.get(0);
%>
<% int roundType = request.getAttribute(Constants.ROUND_TYPE_ID)==null?Constants.LONG_ROUND_TYPE_ID:((Integer)request.getAttribute(Constants.ROUND_TYPE_ID)).intValue();%>
<% String level2 = "topcoder";
   String image = "long_comps_topcoder";
    if (roundType==Constants.LONG_PRACTICE_ROUND_TYPE_ID) {
        level2="topcoder_practice";
    } else if (roundType ==Constants.INTEL_LONG_PRACTICE_ROUND_TYPE_ID) {
        level2="intel_practice";
        image = "long_comps_intel";
    } else if (roundType ==Constants.INTEL_LONG_ROUND_TYPE_ID) {
        level2="intel";
        image = "long_comps_intel";
    }
%>

<html>
<head>
    <title>TopCoder</title>
    <jsp:include page="script.jsp" />
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
            <script type="text/javascript">
            function next() {
            var myForm = document.exampleForm;
            myForm.<%=DataAccessConstants.START_RANK%>.value=parseInt(myForm.<%=DataAccessConstants.START_RANK%>.value)+parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
            myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
            myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
            myForm.submit();
            }
            function previous() {
            var myForm = document.exampleForm;
            myForm.<%=DataAccessConstants.START_RANK%>.value=parseInt(myForm.<%=DataAccessConstants.START_RANK%>.value)-parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
            myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
            myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';

            myForm.submit();
            }
        </script>
</head>

<body>

<jsp:include page="top.jsp">
    <jsp:param name="level1" value="long"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
        <%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="level1" value="long_contests"/>
                <jsp:param name="level2" value="<%=level2%>"/>
            </jsp:include>
        </td>
        <%-- Left Column Ends --%>

        <%-- Center Column Begins --%>
        <TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">

            <jsp:include page="page_title.jsp">
                <jsp:param name="image" value="<%=image%>"/>
                <jsp:param name="title" value="Example History"/>
            </jsp:include>

            <div style="float:right; padding: 0px 0px 0px 5px;">
               <ci:sponsorImage image="<%=Constants.SPONSOR_IMAGE%>" alt="Sponsor" border="0" ifNull="&#160;"/>
            </div>
            <span class="bigHandle">Contest:
                    <A href="?module=ViewStandings&rd=<rsc:item name="round_id" row="<%=infoRow%>"/>" class="bcLink"><rsc:item name="contest_name" row="<%=infoRow%>"/> &gt; <rsc:item name="round_name" row="<%=infoRow%>"/></A>
            </span><br>
            <span class="bodySubtitle">Problem: <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=ViewProblemStatement&<%=Constants.ROUND_ID%>=<rsc:item name="round_id" row="<%=infoRow%>"/>&<%=Constants.PROBLEM_ID%>=<rsc:item name="problem_id" row="<%=infoRow%>"/>" class="bcLink">
                <rsc:item name="problem_name" row="<%=infoRow%>"/></a></span><br>
            <span class="bodySubtitle">Coder: <tc-webtag:handle coderId='<%=request.getParameter(Constants.CODER_ID)%>'/></span>
            <br>

            <div style="clear: both;" align="center">
               <div class="pagingBox">
                    <%=(examples.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
                   | <%=(examples.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>":"next &gt;&gt;")%>
               </div>
            </div>

            <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
                <tr>
                    <td>
                        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">

                            <tr>
                                <% if (over||self) { %>
                                <td class="tableTitle" colspan="5">Submissions: <rsc:item name="num_submissions" row="<%=infoRow%>"/></td>
                                <% } else { %>
                                <td class="tableTitle" colspan="4">Submissions: <rsc:item name="num_submissions" row="<%=infoRow%>"/></td>
                                <% } %>
                            </tr>
                            <tr>
                                <td class="tableHeader" width="20%">
                                    <A href="<%=sortLinkBase%><tc-webtag:sort column="4"/>">Submission</A></td>
                                <td class="tableHeader" width="20%" align="center">
                                    <A href="<%=sortLinkBase%><tc-webtag:sort column="5"/>">Time</A></td>
                                <td class="tableHeader" width="20%" align="right">
                                    <A href="<%=sortLinkBase%><tc-webtag:sort column="6"/>">Score</A></td>
                                <td class="tableHeader" width="20%" align="center">
                                    <A href="<%=sortLinkBase%><tc-webtag:sort column="<%=examples.getColumnIndex("language_name")%>"/>">Language</A></td>
                                <% if (over||self) { %>
                                <td class="tableHeader" width="20%" align="right">&#160;</td>
                                <% } %>
                            </tr>
                            <%boolean even = true;%>
                            <rsc:iterator list="<%=examples%>" id="resultRow">
                                <tr>
                                    <td class="<%=even?"statLt":"statDk"%>">
                                    <% if (over||self) { %>
                                       <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=ViewProblemSolution&<%=Constants.PROBLEM_ID%>=<rsc:item name="problem_id" row="<%=resultRow%>"/>&<%=Constants.ROUND_ID%>=<rsc:item name="round_id" row="<%=resultRow%>"/>&<%=Constants.CODER_ID%>=<rsc:item name="coder_id" row="<%=resultRow%>"/>&<%=Constants.SUBMISSION_NUMBER%>=<rsc:item name="submission_number" row="<%=resultRow%>"/>" class="statLink">
                                    <% } %>
                                        <rsc:item name="submission_number" row="<%=resultRow%>"/>
                                    <% if (over||self) { %>
                                       </A>
                                    <% } %>
                                    </td>
                                    <td class="<%=even?"statLt":"statDk"%>" align="center" nowrap="nowrap">
                                        <tc-webtag:format object="<%=new Date(resultRow.getLongItem("submit_time"))%>" format="MM.dd.yyyy HH:mm:ss"/></td>
                                    <td class="<%=even?"statLt":"statDk"%>" align="right">
                                        <rsc:item name="submission_points" row="<%=resultRow%>" format="0.00"/><%=resultRow.getIntItem("status_id")==130?"*":""%></td>
                                    <td class="<%=even?"statLt":"statDk"%>" align="center">
                                        <rsc:item name="language_name" row="<%=resultRow%>"/></td>
                                    <% if (over||self) { %>
                                    <td class="<%=even?"statLt":"statDk"%>" align="center" nowrap="nowrap">
                                    <% if (resultRow.getIntItem("submission_number")==examples.size() && resultRow.getIntItem("status_id")==150) { %>
                                        <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=ViewExampleResults&<%=Constants.PROBLEM_ID%>=<rsc:item name="problem_id" row="<%=resultRow%>"/>&<%=Constants.ROUND_ID%>=<rsc:item name="round_id" row="<%=resultRow%>"/>&<%=Constants.CODER_ID%>=<rsc:item name="coder_id" row="<%=resultRow%>"/>" class="statLink">example results</A>
                                    <% } %>
                                    </td>
                                    <% } %>
                                </tr>
                                <%even = !even;%>
                            </rsc:iterator>
                        </TABLE>
                    </TD>
                </tr>
            </TABLE>
            <p>* Indicates that this submission has not yet been scored</p>

            <div class="pagingBox">
                    <%=(examples.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
                | <%=(examples.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>":"next &gt;&gt;")%>
            </div>

        </td>

        <%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="public_right.jsp">
                <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
        </td>
        <%-- Right Column Ends --%>

        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
    </tr>
</table>

<jsp:include page="foot.jsp"/>
</body>
</html>