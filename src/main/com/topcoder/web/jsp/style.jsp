<%@ page contentType="text/html" %>

<%
    String key = request.getParameter("key");
%>
<% if (key.equals("tc_old")) { %>
<link type="text/css" rel="stylesheet" href="/css/style.css">
<link type="text/css" rel="stylesheet" href="/css/coders.css">
<link type="text/css" rel="stylesheet" href="/css/TCOstyle.css">
<% } else if (key.equals("tc_calendar")) { %>
<link type="text/css" rel="stylesheet" href="/css/coders.css">
<link type="text/css" rel="stylesheet" href="/css/tcCalendar.css">
<link type="text/css" rel="stylesheet" href="/css/tcStyles.css">
<% } else if (key.equals("crpf")) { %>
<link type="text/css" rel="stylesheet" href="/css/crpfStyle.css">
<link type="text/css" rel="stylesheet" href="/css/style.css">
<link type="text/css" rel="stylesheet" href="/css/coders.css">
<link type="text/css" rel="stylesheet" href="/css/stats.css">
<link type="text/css" rel="stylesheet" href="/css/tcStyles.css">
<% } else if (key.equals("tc_forums")) { %>
<link type="text/css" rel="stylesheet" href="/css/style.css">
<link type="text/css" rel="stylesheet" href="/css/coders.css">
<link type="text/css" rel="stylesheet" href="/css/roundTables.css">
<link type="text/css" rel="stylesheet" href="/css/stats.css">
<link type="text/css" rel="stylesheet" href="/css/tcStyles.css">
<% } else if (key.equals("tc_main")) { %>
<link type="text/css" rel="stylesheet" href="/css/style.css">
<link type="text/css" rel="stylesheet" href="/css/coders.css">
<link type="text/css" rel="stylesheet" href="/css/tcStyles.css">
<% } else if (key.equals("tc_reg")) { %>
<link type="text/css" rel="stylesheet" href="/css/tcStyles.css">
<link type="text/css" rel="stylesheet" href="/css/tcReg.css">
<% } else if (key.equals("tc_stats")) { %>
<link type="text/css" rel="stylesheet" href="/css/style.css">
<link type="text/css" rel="stylesheet" href="/css/coders.css">
<link type="text/css" rel="stylesheet" href="/css/stats.css">
<link type="text/css" rel="stylesheet" href="/css/tcStyles.css">
<% } else if (key.equals("tc_studio_old")) { %>
<link type="text/css" rel="stylesheet" href="/css/creative/main.css">
<link type="text/css" rel="stylesheet" href="/css/creative/stats.css">
<link type="text/css" rel="stylesheet" href="/css/coders.css">
<% } else if (key.equals("tc_studio_forums_old")) { %>
<link type="text/css" rel="stylesheet" href="/css/creative/main.css">
<link type="text/css" rel="stylesheet" href="/css/creative/stats.css">
<link type="text/css" rel="stylesheet" href="/css/creative/forums.css">
<link type="text/css" rel="stylesheet" href="/css/coders.css">
<% } else if (key.equals("tc_studio")) { %>
<link type="text/css" rel="stylesheet" href="/css/studio/main.css">
<link type="text/css" rel="stylesheet" href="/css/studio/stats.css">
<link type="text/css" rel="stylesheet" href="/css/coders.css">
<% } else if (key.equals("tc_studio_forums")) { %>
<link type="text/css" rel="stylesheet" href="/css/studio/main.css">
<link type="text/css" rel="stylesheet" href="/css/studio/stats.css">
<link type="text/css" rel="stylesheet" href="/css/studio/forums.css">
<link type="text/css" rel="stylesheet" href="/css/coders.css">
<% } %>
