<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.Constants"
         autoFlush="false" %>

<!-- My Services begins -->
            <table width="170" bgcolor="#000000" cellspacing="0" cellpadding="0" border="0">
                <tr><td id="myServicesTitle">My Services</td></tr>

                <tr><td id="myServicesBorder"><img alt="" width="170" height="1" src="/i/clear.gif" border="0" /></td></tr>      

                <tr><td id="myServicesNav"><a href="#" class="corpSubNav">Candidate Testing</a></td></tr>

                <tr><td id="myServicesBorder"><img alt="" width="170" height="1" src="/i/clear.gif" border="0" /></td></tr>      

                <tr><td id="myServicesNav"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=spon_prog&d2=index" class="corpSubNav">Sponsorship</a></td></tr>

                <tr><td id="myServicesBorder"><img alt="" width="170" height="1" src="/i/clear.gif" border="0" /></td></tr>      

                <tr><td id="myServicesNav"><a href="/tces/tces?task=MainTask" class="corpSubNav">Employment Services</a></td> </tr>

                <tr><td id="myServicesBorder"><img alt="" width="170" height="1" src="/i/clear.gif" border="0" /></td></tr>      

<!--               <tr><td id="myServicesNav"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=prem_content&d2=index" class="statTextBig">Premium Content</a></td></tr>

                <tr><td id="myServicesNav"><img alt="" width="1" height="1" src="/i/clear.gif" border="0" /></td></tr>      -->

                <tr><td id="myServicesNav"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=acc_admin&d2=index" class="corpSubNav">My Account</a></td></tr>

                <tr><td id="myServicesBorder"><img alt="" width="170" height="1" src="/i/clear.gif" border="0" /></td></tr>      

            </table>
<!-- My Services ends -->

<!-- Company Information begins -->
            <table width="170" cellspacing="0" cellpadding="0" border="0">
                <tr><td id="companyInfoTitle">Company Information</td></tr>

                <tr><td id="companyInfoBorder"><img alt="" width="170" height="1" src="/i/clear.gif" border="0" /></td></tr>      

                <tr><td id="companyInfoNav"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=about&d2=index" class="corpSubNav">About TopCoder</a></td></tr>

                <tr><td id="companyInfoBorder"><img alt="" width="170" height="1" src="/i/clear.gif" border="0" /></td></tr>      

                <tr><td id="companyInfoNav"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=news_events&d2=index" class="corpSubNav">Press Room</a></td></tr>

                <tr><td id="companyInfoBorder"><img alt="" width="170" height="1" src="/i/clear.gif" border="0" /></td></tr>      

                <tr><td id="companyInfoNav"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=contact&d2=index" class="corpSubNav">Contact Us</a></td></tr>

                <tr><td id="companyInfoBorder"><img alt="" width="170" height="1" src="/i/clear.gif" border="0" /></td></tr>      

            </table>
<!-- Company Information ends -->

            <img src="/i/left_nav_btm.gif" width="170" height="69" border="0" alt="" /><br><br>
            <img src="/i/logo_ghosted_bracket.gif" width="160" height="77" border="0" alt="[ TopCoder ]" vspace="10" />

