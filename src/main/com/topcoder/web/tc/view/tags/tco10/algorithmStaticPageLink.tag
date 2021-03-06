<%--
  - Author: TCSDEVELOPER
  - Version: 1.0
  - Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
  -
  - Description: This tag renders the HTML A element referencing the specified page from Algorithm
  - area from 2010 TCO Website.
  -
--%>
<%@ tag language="java" body-content="scriptless" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="page" required="true" type="java.lang.String" %>
<%@ attribute name="styleClass" required="false" type="java.lang.String" %>

<c:set var="url"
       value="/tc?${requestScope.MODULE_KEY}=Static&amp;d1=tournaments&amp;d2=tco10&amp;d3=algorithm&amp;d4=${page}"/>

<c:choose>
    <c:when test="${page eq 'leaderboard'}">
        <c:set var="url" value="/tco10?${requestScope.MODULE_KEY}=AlgorithmAdvancers"/>
    </c:when>
    <c:when test="${page eq 'qualification'}">
        <c:set var="url" value="/tco10?${requestScope.MODULE_KEY}=AlgorithmQualification"/>
    </c:when>
</c:choose>

<c:choose>
    <c:when test="${empty styleClass}">
        <a href="${url}">
            <jsp:doBody/>
        </a>
    </c:when>
    <c:otherwise>
        <a class="${styleClass}" href="${url}">
            <jsp:doBody/>
        </a>
    </c:otherwise>
</c:choose>
