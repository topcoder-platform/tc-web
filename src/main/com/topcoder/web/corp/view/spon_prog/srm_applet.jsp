<%@ page contentType="text/html; charset=ISO-8859-1"
         autoFlush="false"
         buffer="64kb"
         import="com.topcoder.web.corp.Constants,
                 com.topcoder.web.corp.controller.TransactionServlet"
         errorPage="../exc/InternalError.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Sponsor a TopCoder Single Round Match</title>

<jsp:include page="../includes/css.jsp" />

<script language="JavaScript" type="text/javascript" src="/js/script.js"></script>

</head>

<body>

<!-- Top begins -->
<jsp:include page="../includes/top.jsp"/>
<!-- Top ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170" bgcolor="#CCCCCC">
            <jsp:include page="../includes/left.jsp">
                <jsp:param name="level1" value="sponsorship"/>
                <jsp:param name="level2" value="srm_web"/> 
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td valign="top"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
        <td valign="top" width="7"><img src="/i/title_brackets.gif" width="7" height="47" alt="[ ]" border="0"></td>
<!-- Gutter Ends -->

<!-- Center Column begins -->
        <td width="100%">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top"><td id="corpTitle" width="100%" colspan="3"><img src="/i/header_event_sponsorship.gif" alt="" width="546" height="41" border="0"></td></tr>
                
                <tr valign="top">
                    <td class="bodyText" width="99%">
                        <img src="/i/clear.gif" width="1" height="10" alt="" border="0"><br>
                        
                        <h2 class="corpHead">SRM Package - Applet Coverage</h2>

                        <table cellpadding="10" cellspacing="0" border="0" align="right">
                        <tr><td><table border="0" cellpadding="6" cellspacing="0" class="sidebarBox">
                            <tr><td class="sidebarTitle" >SRM PACKAGE LINKS:</td></tr>
                            
                            <tr valign="top">
                                <td class="sidebarText">
                                    <a href="<?module=Static&d1=corp&d2=spon_prog&d3=srm_index">SRM Overview</a><br />
                                    <a href="<?module=Static&d1=corp&d2=spon_prog&d3=srm_web">Web site coverage</a><br />
                                    <strong>Applet coverage</strong><br />
                                    <a href="<?module=Static&d1=corp&d2=spon_prog&d3=srm_email">Email distribution</a><br />
                                </td>
                            </tr>
                        </table></td></tr>
                        </table>
                        
                        <p>The Arena Applet is where the action takes place. Coders square off against each other in "rooms" based upon their 
                        current rating. A sample of how a sponsor is presented in the applet is shown below and on the following sample pages.</p>
                    
                        <ul>
                            <li><strong>Lobby</strong> - entry way and chat area for both competitors and spectators 
                            <nobr><a href="?module=Static&d1=corp&d2=spon_prog&d3=applet_l">View large sample</a></nobr></li>
                            <li><strong>Coding</strong> - where competitors view problems, submit solutions, and challenge code 
                            <nobr><a href="?module=Static&d1=corp&d2=spon_prog&d3=applet_c">View large sample</a></nobr></li>
                            <li><strong>Status</strong> - informs both spectators and coders of who's doing what 
                            <nobr><a href="?module=Static&d1=corp&d2=spon_prog&d3=applet_s">View large sample</a></nobr></li>
                            <li><strong>Leader Board</strong> - Dynamic listing of room leaders and current points 
                            <nobr><a href="?module=Static&d1=corp&d2=spon_prog&d3=applet_lb">View large sample</a></nobr></li>
                        </ul>
                    
                        <div align="left"><img src="/i/sample_sponsor.gif" alt="" width="300" height="50" border="0"/></div>
                    
                        <p><strong>Note</strong> - TopCoder Marketing will produce all necessary graphics &#40;working with a sponsor's internal marketing team 
                        or agency of record&#41; needed for the medium.</p>
                        
                        <p><a href="?module=Static&d1=corp&d2=spon_prog&d3=tourny_index">What is in a Tournament Package?</a></p>

                        <p><br/></p>
                    </td>

<!-- Gutter -->
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column begins -->
                    <jsp:include page="../includes/right.jsp">
                        <jsp:param name="level1" value="sponsor"/>
                        <jsp:param name="level2" value="srm_index"/> 
                    </jsp:include>
<!-- Right Column ends -->

                </tr>
            </table>
        </td>
<!-- Center Column ends -->
    </tr>
</table>

<!-- Footer begins -->
  <jsp:include page="../includes/foot.jsp"/>
<!-- Footer ends -->

</body>
</html>
