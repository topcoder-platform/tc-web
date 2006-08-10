<%@ page language="java" %>
<%@ page import="com.topcoder.web.common.BaseServlet" %>
<%@ page import="com.topcoder.web.common.SessionInfo" %>
<%@ page import="com.topcoder.web.common.model.NavNode" %>
<%@ page import="com.topcoder.web.common.model.NavTree" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ taglib uri="nav.tld" prefix="nav" %>


<%
    /* m_name indicates the name of an expandable menu */

    SessionInfo sessionInfo = (SessionInfo) request.getAttribute(BaseServlet.SESSION_INFO_KEY);
    NavTree nav = new NavTree();
    nav.addRoot(new NavNode(sessionInfo.getServletPath(), "TC Studio Home", "home"));
    nav.addRoot(new NavNode(sessionInfo.getServletPath() + "?" + Constants.MODULE_KEY + "=AdminViewContests", "Contests", "contests"));
    nav.addRoot(new NavNode(sessionInfo.getServletPath() + "?" + Constants.MODULE_KEY + "=AdminViewContest", "Create Contest", "create_contest"));
    request.setAttribute("tree", nav);

%>

<script language="javascript" type="text/javascript">
    <!--
    function toggleMenu(menuTitle, menuID) {
        var menu = document.getElementById(menuID);
        if (menu.style.display == 'block') menu.className = 'CLOSED';
        else if (menu.className == 'OPEN' && menu.style.display != 'none') menu.className = 'CLOSED';
        else {
            menu.className = 'OPEN';
        }
        if (menuTitle.blur)menuTitle.blur();
        if (menuTitle.className == 'exp') menuTitle.className = 'exp_ed';
        else menuTitle.className = 'exp';
        return;
    }
    function flipMenu(myMenuName) {
        var menuName = document.getElementById(myMenuName);
        menuName.className = 'exp_ed';
    }

    // -->
</script>

<!--node is <%=request.getParameter("node")%> -->
<div id="leftNav">
    <nav:navBuilder navTree="tree" openClass="OPEN" selectedLeafClass="highlight" selectedParentClass="exp_ed" unSelectedParentClass="exp" selectedNode="<%=request.getParameter("node")%>"/>
</div>


