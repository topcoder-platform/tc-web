<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>      

<title>TopCoder | JavaOne(TM)</title>

<xsl:call-template name="CSS"/>      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<!-- Header begins -->
<xsl:call-template name="Top"/>
<!-- Header ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
<!-- Left Column Begins -->
        <td width="170" bgcolor="#CCCCCC" valign="top">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="5" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->	
        <td class="bodyText" width="100%">
            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="bodyText" width="100%">      
                        <table width="100%" border="0" cellpadding="4" cellspacing="0">

<!-- 2003 JavaOne Conference -->
                            <tr><td colspan="2" align="center"><img src="/i/private_label/javaone_landing_logo.gif" alt="2003 JavaOne Conference" width="247" height="75" /></td></tr>
                            
                            <tr><td class="statTextBig" bgcolor="#333399" colspan="2"><p style="font-family: Verdana; font-size: 15px;">2003 JavaOne Conference in San Francisco</p></td></tr>
                            
                            <tr>
                                <td class="bodyText" colspan="2">
                                    <p>Everywhere you look, Java<span style="font-size: 5px; vertical-align: super">TM</span> technology is at work; 
                                    powering businesses, enabling mobile devices, and defining 
                                    the future of Web services. The Java platform unifies the computing landscape, from the smallest smart card to the 
                                    most massive data center. Today, the power of Java technology translates into unlimited opportunities to build and 
                                    develop solutions that integrate networking systems across all business functions.</p>

                                    <p>The JavaOne<span style="font-size: 5px; vertical-align: super">sm</span> conference is the source for the 
                                    unparalleled opportunity to learn from the creators and foremost 
                                    experts in Java technology. Interact with peers and share success stories and innovative ideas. Gain the knowledge you 
                                    need to solve your most pertinent problems and advance your critical projects. Choose from more than 200 technical 
                                    sessions, 175 Birds-of-a-Feather sessions, or test drive real-world Java technology solutions in one of the following 
                                    topics: </p>

                                    <ul>
                                        <li>Java Core Technology</li>
                                        <li>Java Technology in Mobility</li>
                                        <li>Core Enterprise</li>
                                        <li>Java Technology in the Web Tier</li>
                                        <li>Web Services</li>
                                        <li>Java Technology on the Desktop</li>
                                        <li>Java Technology Products and Success Stories</li>
                                        <li>Advanced Network Technologies</li>
                                    </ul>

                                    <p><A href="#"><strong>Register for the conference</strong></A></p><br />
                                </td>
                            </tr>

<!-- JavaOne Coding Challenge -->
                            <tr valign="bottom">
                                <td class="statTextBig" bgcolor="#333399" width="90%"><p style="font-family: Verdana; font-size: 15px;">JavaOne Coding Challenge</p></td>
                                <td class="statTextSmall" bgcolor="#333399" width="10%" nowrap="nowrap">Powered by TopCoder<span style="font-size: 5px; vertical-align: super">TM</span></td>
                            </tr>
                            
                            <tr>
                                <td class="bodyText" colspan="2">
                                    <p><font size="4"><strong>Code - Compete - Win!</strong></font></p>

                                    <p><img src="/i/private_label/javaone_landing_photo.jpg" alt="" width="227" height="244" align="right" />
                                    JavaOne has teamed up with TopCoder<span style="font-size: 5px; vertical-align: super">TM</span> to provide the ultimate hands-on 
                                    ava  experience to conference attendees. If you are a Java developer, you do not want to miss this event.</p>

                                    <p><font size="3"><strong>Let the Coding Begin!</strong></font></p>

                                    <ul>
                                        <li>Tuesday, June 10th through Thursday, June 12th </li>
                                        <li>All registered attendees of JavaOne may participate </li>
                                        <li>All competition takes place at the JavaOne Coding Challenge exhibit area </li>
                                        <li>Code, compile, test, and submit solutions to real-world programming problems </li>
                                        <li>Problems will focus on Mobility, Enterprise Applications and Web Services </li>
                                        <li>All participants will be awarded a prize</li>
                                    </ul>
                                    
                                    <p>Some of the prizes for the "top" coders include a Nokia&#174; 3650 cell phone, a complete volume of SMI Press books, and a 
                                    pass to next year's JavaOne conference. These prizes will not be available anywhere else at the conference and will be a 
                                    "badge of honor" for those who participate</p>

                                    <p><font size="3"><strong>Bring it On!</strong></font><br />
                                    As the day goes by, TopCoder will calculate the scores of all participants and invite the top scorers back for head-to-head 
                                    competition in the evening. At the end of sessions each day, the top performers will battle it out in the arena for the elite 
                                    prizes and bragging rights.  The points are calculated based on accuracy and speed. Scores are automatically determined 
                                    as the TopCoder system runs code submitted by the competitors through a battery of test cases. The person who writes a 
                                    correct piece of code in the shortest amount of time will win the top prize. Runner-up prizes will be awarded as well. 
                                    THERE ARE NO JUDGES FOR THE COMPETITION AS THE SYSTEM TELLS THE TALE.</p>

                                    <p><font size="3"><strong>Be Recognized</strong></font><br />
                                    The winners of each day's competition will be recognized by Sun Microsystems and TopCoder, Inc. The winners will be 
                                    promoted at the JavaOne Coding Challenge area, on the JavaOne web site, on the TopCoder web site and in press materials. 
                                    Some attendees are going to walk away as winners of valuable, exciting prizes and bragging rights. Will it be you?</p>

                                </td>
                            </tr>
                        </table>

                        <p><br /></p>

                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170" valign="top"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>
            <xsl:call-template name="public_right_col"/>       
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->
    </tr>
</table>

<!-- Footer begins -->
<xsl:call-template name="Foot"/>
<!-- Footer ends -->

</body>

</html>

  </xsl:template>
</xsl:stylesheet>
