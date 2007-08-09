<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>

<head>
    <title>TopCoder Introductory Events</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../../script.jsp" />
    <jsp:include page="../../style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
                <jsp:param name="node" value="m_algo_competitions"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="fixedWidthBody">
            
                <jsp:include page="../../page_title.jsp">
                    <jsp:param name="image" value="introevent"/>
                    <jsp:param name="title" value="&nbsp;"/>
                </jsp:include>

                <div align="center">
                    <img src="/i/introevent/bcsLogo.png" alt="" />
                </div>

                <p>TopCoder is the recognised leader in identifying, evaluating and mobilising effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognises and promotes the abilities of the best programmers around the world. </p>

                <div style="margin-bottom: 20px;">
                    <h2>August 2007</h2>
                    <strong>SumOfSelectedCells</strong>
                    <br /><a href="/tc?module=Static&amp;d1=introevent&amp;d2=bcsscs&amp;d3=sumOfSelectedCells">Problem statement</a>
                    | Solution posted with next month's problem!
                    <%--
                    | <a href="/tc?module=Static&amp;d1=introevent&amp;d2=bcsscs&amp;d3=sumOfSelectedCellsSol">Solution</a>
                    --%>
                </div>

                <div style="margin-bottom: 20px;">
                    <h2>July 2007</h2>
                    <strong>AttendanceShort</strong>
                    <br /><a href="/tc?module=Static&amp;d1=introevent&amp;d2=bcsscs&amp;d3=attendanceShort">Problem statement</a>
                    | <a href="/tc?module=Static&amp;d1=introevent&amp;d2=bcsscs&amp;d3=attendanceShortSol">Solution</a>
                </div>

                <div style="margin-bottom: 20px;">
                    <h2>June 2007</h2>
                    <strong>NumberofFiboCalls</strong>
                    <br /><a href="/tc?module=Static&amp;d1=introevent&amp;d2=bcsscs&amp;d3=numberOfFiboCalls">Problem statement</a>
                    | <a href="/tc?module=Static&amp;d1=introevent&amp;d2=bcsscs&amp;d3=numberOfFiboCallsSol">Solution</a>
                </div>

                <div style="margin-bottom: 20px;">
                    <h2>May 2007</h2>
                    <strong>PersistentNumber</strong>
                    <br /><a href="/tc?module=Static&amp;d1=introevent&amp;d2=bcsscs&amp;d3=persistentNumber">Problem statement</a>
                    | <a href="/tc?module=Static&amp;d1=introevent&amp;d2=bcsscs&amp;d3=persistentNumberSol">Solution</a>
                </div>

            </div>
        </td>
<%-- Center Column Ends --%>
        
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
        
    </tr>
</tbody>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>