<%--
  - Author: TCSDEVELOPER, isv
  - Version: 1.2
  - Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page renders studio site top section.
  -
  - Version 1.12 (Studio Enhancements Release Assembly 1) Change notes:
  - * Changed URLs and re-arranged footer area. TC logo is now displayed.
  - Version 1.2 (Studio Contest Detail Pages Assembly version 1.0) changes:
  -     - Removed unsed section variable and 3 closing DIV elements without opening elements.  
--%>
<%@ page import="com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.web.common.BaseServlet, com.topcoder.web.common.SessionInfo" %>

<%
    SessionInfo sessionInfo = (SessionInfo)request.getAttribute(BaseServlet.SESSION_INFO_KEY);
    String handle = null;
    if (sessionInfo != null)
    {
        handle = sessionInfo.getHandle();
    }

%>
             </div>
         </div>
    </div><%-- #page-wrap ends --%>
<%-- FOOTER BLOCK --%>
<div id="footer">
    <div class="wrapper2">
        <div class="socials">
            <span>Follow Us!</span>
            <a href="https://www.facebook.com/pages/TopCoder-Studio-Design-Competitions/32709273825" rel="nofollow" target="_blank">
                <img width="16" height="16" title="Follow Us on Facebook" alt="Follow Us on Facebook" src="/i/facebook.png">
            </a>
            <a href="http://www.flickr.com/photos/53993064@N03" rel="nofollow" target="_blank">
                <img width="16" height="16" src="/i/flickr.png" alt="Follow Us on Flickr" title="Follow Us on Flickr">
            </a>
            <a href="https://twitter.com/TCStudio" rel="nofollow" target="_blank">
                <img width="16" height="16" src="/i/twitter.png" alt="Follow Us on Twitter" title="Follow Us on Twitter">
            </a>
            <a href="http://www.youtube.com/topcoderinc" rel="nofollow" target="_blank">
                <img width="16" height="16" src="/i/youtube.png" alt="Follow Us on YouTube" title="Follow Us on YouTube">
            </a>
        </div>
        <div class="nav">
            <span class="copyright">Copyright TopCoder, Inc. 2001-<script type="text/javascript">d=new Date();document.write(d.getFullYear());</script></span>
            <span class="line"></span><a href="https://www.topcoder.com/contact-us">Contact Us</a>
            <span class="line"></span><a href="http://www.topcoder.com/home/studio/what-is-studio/">About TopCoder Studio</a>
            <span class="line"></span><a href="http://www.topcoder.com/about/">About TopCoder</a>
            <span class="line"></span><a href="http://www.topcoder.com/tc?module=Static&d1=pressroom&d2=index">News</a>
            <span class="line"></span><a href="https://www.topcoder.com/community/how-it-works/privacy-policy/">Privacy Policy</a>
            <span class="line"></span><a href="https://www.topcoder.com/community/how-it-works/terms/">Terms &amp; Conditions</a>
        </div>

    </div>
    <%-- .wrapper ends --%>
</div>
<%-- #footer ends --%>

<script>
  !function(){var analytics=window.analytics=window.analytics||[];if(!analytics.initialize)if(analytics.invoked)window.console&&console.error&&console.error("Segment snippet included twice.");else{analytics.invoked=!0;analytics.methods=["trackSubmit","trackClick","trackLink","trackForm","pageview","identify","reset","group","track","ready","alias","debug","page","once","off","on"];analytics.factory=function(t){return function(){var e=Array.prototype.slice.call(arguments);e.unshift(t);analytics.push(e);return analytics}};for(var t=0;t<analytics.methods.length;t++){var e=analytics.methods[t];analytics[e]=analytics.factory(e)}analytics.load=function(t){var e=document.createElement("script");e.type="text/javascript";e.async=!0;e.src=("https:"===document.location.protocol?"https://":"http://")+"cdn.segment.com/analytics.js/v1/"+t+"/analytics.min.js";var n=document.getElementsByTagName("script")[0];n.parentNode.insertBefore(e,n)};analytics.SNIPPET_VERSION="4.0.0";
  analytics.load("iqUByt5YHfDgSB8zJWzqYJKWQI0aGoZK");
  analytics.page();
  }}();
</script>


