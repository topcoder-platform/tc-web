<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../top.xsl" />
    <xsl:import href="../script.xsl" />
    <xsl:import href="../includes/body_top.xsl" />  
    <xsl:import href="../foot.xsl" />
    <xsl:import href="../includes/modules/stats_intro.xsl" />  
  <xsl:import href="../includes/global_left.xsl"/>  
    <xsl:import href="../includes/dev/public_dev_right.xsl" />     
    <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN" />
    <xsl:template match="/">

<html>
<head>

    <xsl:call-template name="Preload" />      

 <title>TopCoder | Development</title>

    <xsl:call-template name="CSS" />      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities." />
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++" />

</head>

<body>
    <xsl:call-template name="Top" />

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#001B35">
    <tr valign="top">
<!-- Left Column Begins -->
        <td width="180">
            <xsl:call-template name="global_left"/>
          </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="5" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
            <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
            <xsl:with-param name="image1">steelblue</xsl:with-param>
            <xsl:with-param name="image">development</xsl:with-param>
            <xsl:with-param name="title">&#160;Component Development</xsl:with-param>
            </xsl:call-template>

            <table border="0" cellspacing="0" cellpadding="0" bgcolor="#001B35" width="100%">
                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td colspan="3"><img src="/i/clear.gif" alt="" width="240" height="10" border="0" /></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
<!-- 
                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="captionText" width="49%"><img src="/i/development/royalty_payments.gif" alt="Royalty Payments" width="276" height="49" border="0" /><br />
                        We're proud to announce our first round of royalty payments totaling $3500. The TopCoder members to the right 
                        developed the components that make up the <a href="http://software.topcoder.com/pages/c_component.jsp?comp=600191" class="statText">Rules Engine Tool.</a> 
                        Inquire about <a href="?t=development&amp;c=comp_projects" class="statText">open projects</a> so you can earn royalties too.</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td width="49%">
                        <table border="0" cellspacing="0" cellpadding="0" width="100%">
                            <tr valign="middle">
                                <td width="10" background="/i/steel_gray_bg.gif"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                                <td background="/i/steel_gray_bg.gif" class="registerNav" height="18" colspan="2">Royalties Paid</td>
                                <td width="10" background="/i/steel_gray_bg.gif"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                            </tr>

                            <tr>
                                <td width="10" background="/i/steel_bluebv_bg.gif"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                                <td background="/i/steel_bluebv_bg.gif" class="statText" height="18">Developer&#160;</td>
                                <td width="1%" background="/i/steel_bluebv_bg.gif" class="statText" height="18" align="right">&#160;Total&#160;Royalties</td>
                                <td width="10" background="/i/steel_bluebv_bg.gif"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                            </tr>

                            <tr><td height="3" colspan="4"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                            <tr valign="middle">
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                                <td class="statText" height="15"><a href="/stat?c=member_profile&amp;cr=265522" class="coderTextBlue"><strong>veredox</strong></a></td>
                                <td class="statText" height="15" align="right">$1,708.07&#160;&#160;</td>
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                            </tr>

                            <tr><td height="3" colspan="4"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                            <tr valign="middle">
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                                <td class="statText" height="15"><a href="/stat?c=member_profile&amp;cr=119676" class="coderTextBlue"><strong>Pops</strong></a></td>
                                <td class="statText" height="15" align="right">$1,111.17&#160;&#160;</td>
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                            </tr>

                            <tr><td height="3" colspan="4"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                            <tr valign="middle">
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                                <td class="statText" height="15"><a href="/stat?c=member_profile&amp;cr=271008" class="coderTextBlue"><strong>ilya</strong></a></td>
                                <td class="statText" height="15" align="right">$283.65&#160;&#160;</td>
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                            </tr>

                            <tr><td height="3" colspan="4"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                            <tr valign="middle">
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                                <td class="statText" height="15"><a href="/stat?c=member_profile&amp;cr=136367" class="coderTextYellow"><strong>timurz</strong></a></td>
                                <td class="statText" height="15" align="right">$133.19&#160;&#160;</td>
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                            </tr>

                            <tr><td height="3" colspan="4"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                            <tr valign="middle">
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                                <td class="statText" height="15"><a href="/stat?c=member_profile&amp;cr=260578" class="coderTextGreen"><strong>danno</strong></a></td>
                                <td class="statText" height="15" align="right">$74.00&#160;&#160;</td>
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                            </tr>
 
                            <tr><td height="3" colspan="4"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                            <tr valign="middle">
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                                <td class="statText" height="15"><a href="/stat?c=member_profile&amp;cr=142986" class="coderTextGreen"><strong>dcros</strong></a></td>
                                <td class="statText" height="15" align="right">$55.50&#160;&#160;</td>
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                            </tr>

                            <tr><td height="3" colspan="4"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                            <tr valign="middle">
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                                <td class="statText" height="15"><a href="/stat?c=member_profile&amp;cr=150498" class="coderTextYellow"><strong>ThinMan</strong></a></td>
                                <td class="statText" height="15" align="right">$55.50&#160;&#160;</td>
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                            </tr>

                            <tr><td height="3" colspan="4"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                            <tr valign="middle">
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                                <td class="statText" height="15"><a href="/stat?c=member_profile&amp;cr=267275" class="coderTextYellow"><strong>magead7</strong></a></td>
                                <td class="statText" height="15" align="right">$49.33&#160;&#160;</td>
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                            </tr>

                            <tr><td height="3" colspan="4"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                            <tr valign="middle">
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                                <td class="statText" height="15"><a href="/stat?c=member_profile&amp;cr=128873" class="coderTextBlue"><strong>DEBEDb</strong></a></td>
                                <td class="statText" height="15" align="right">$29.60&#160;&#160;</td>
                                <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                            </tr>
                        </table>
                    </td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
                -->
                <tr><td height="10" colspan="5"><img src="/i/clear.gif" alt="" height="10" border="0" /></td></tr>
            </table>

<!-- Featured Winner Begins -->
            <table border="0" cellspacing="0" cellpadding="0" bgcolor="#001B35" width="100%">
                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText" width="100%" colspan="4"><strong><img src="/i/development/title_weekly_comp_winners.gif" alt="This Week's Component Project Winners" width="346" height="26" border="0" /></strong></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td height="5" colspan="6"><img src="/i/clear.gif" alt="" height="5" border="0" /></td></tr>

                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="/i/steel_gray_bg.gif" class="registerNav" height="18" colspan="4">&#160;&#160;Featured Winner</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td colspan="4">
                        <table border="0" cellspacing="0" cellpadding="0" width="100%">
                            <tr><td height="5" colspan="4"><img src="/i/clear.gif" alt="" height="5" border="0" /></td></tr>
                            
                           <!-- <tr valign="top"><td class="statText" colspan="4">&#160;&#160;<strong>1st Place</strong></td></tr>-->

                            <tr valign="top"><td class="statText" colspan="4">&#160;&#160;<strong>Coder: <span class="statText"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=304697"><strong>ozzie</strong></a></span></strong></td></tr>

                            <tr><td height="5" colspan="4"><img src="/i/clear.gif" alt="" height="5" border="0" /></td></tr>

                            <tr valign="top">
                                <td class="statText" rowspan="5" width="55"><!-- <a href="/stat?c=member_profile&amp;cr=2058651" class="coderTextRed"><img src="/i/m/nophoto_login.gif" alt="None" width="62" height="70" border="0" hspace="5" vspace="5" /></a> --></td>
                                <td class="statText" rowspan="5" width="5"><img src="/i/clear.gif" alt="" width="5" height="61" border="0" vspace="5" /></td>
                                <td class="statText" width="65%">Designer Level:</td>
                                <td class="statText" align="right" width="10%">III</td>
                                <td class="statText" width="25%"></td>
                            </tr>

                            <tr valign="top">
                                <td class="statText">Rating:</td>
                                <td class="statText" align="right">1408</td>
                                <td class="statText">&#160;&#160;<a href="/stat?c=ratings_history&amp;cr=290448" class="statText">[ ratings history ]</a></td>
                            </tr>

                            <tr valign="top">
                                <td class="statText">Total Earnings for All Component Projects*:</td>
                                <td class="statText" align="right">$1,371.25</td>
                                <td class="statText"></td>
                            </tr>

                            <tr valign="top">
                                <td class="statText">Review Board Score for this Project:</td>
                                <td class="statText" align="right">90.33</td>
                                <td class="statText"></td>
                            </tr>

                            <tr valign="top">
                                <td class="statText">Total Submissions for this Project:</td>
                                <td class="statText" align="right">1</td>
                                <td class="statText"></td>
                            </tr>
                            
                            
                            
                           <!--
                            <tr><td height="5" colspan="4"><img src="/i/clear.gif" alt="" height="10" border="0" /></td></tr>
                            
                            <tr valign="top"><td class="statText" colspan="4">&#160;&#160;<strong>2nd Place</strong></td></tr>

                            <tr valign="top"><td class="statText" colspan="4">&#160;&#160;<strong>Coder: <span class="statText"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=294570">Saxophonist</a></span></strong></td></tr>

                            <tr><td height="5" colspan="4"><img src="/i/clear.gif" alt="" height="5" border="0" /></td></tr>

                            <tr valign="top">
                                <td class="statText" rowspan="5" width="55"><a href="/stat?c=member_profile&amp;cr=296145" class="coderTextYellow"><img src="/i/m/srowen_small.jpg" alt="srowen" width="55" height="61" border="0" hspace="5" vspace="5" /></a></td>
                                <td class="statText" rowspan="5" width="5"><img src="/i/clear.gif" alt="" width="5" height="61" border="0" vspace="5" /></td>
                                <td class="statText" width="65%">Designer Level:</td>
                                <td class="statText" align="right" width="10%">I</td>
                                <td class="statText" width="25%"></td>
                            </tr>

                            <tr valign="top">
                                <td class="statText">Rating:</td>
                                <td class="statText" align="right">1349</td>
                                <td class="statText">&#160;&#160;<a href="/stat?c=ratings_history&amp;cr=294570" class="statText">[ ratings history ]</a></td>
                            </tr>

                            <tr valign="top">
                                <td class="statText">Total Earnings for All Component Projects*:</td>
                                <td class="statText" align="right">$420.00</td>
                                <td class="statText"></td>
                            </tr>

                            <tr valign="top">
                                <td class="statText">Review Board Score for this Project:</td>
                                <td class="statText" align="right">82.03</td>
                                <td class="statText"></td>
                            </tr>

                            <tr valign="top">
                                <td class="statText">Total Submissions for this Project:</td>
                                <td class="statText" align="right">2</td>
                                <td class="statText"></td>
                            </tr>-->
                            
                        </table>
                    </td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="10" bgcolor="#001B35" width="100%">
                <tr valign="middle">
                    <td class="statText">
                        <p><strong>Lightweigh Model View Controller</strong><br />
                         Framework to facilitate the Model-View-Controller design paradigmn.  Check out <a href="http://software.topcoder.com/pages/c_component.jsp?comp=3300831" target="parent" class="statText">Lightweight Model View controller</a> on the TopCoder Software web site.</p>


                        
                        <p><strong>Review Board Comments</strong><br />
                        "Nice design that meets the requirements in an elegant way. Good documentation, especially the demo-tutorial. I can say that this work is worth the money."
                        <a href="/stat?c=member_profile&amp;cr=299180" class="coderTextGreen">&#160;&#151;isv</a></p></td>
                </tr>
            </table>

    <!-- Featured Winner Ends -->

    <!-- Design Winners Begins -->
            <table border="0" cellspacing="0" cellpadding="0" bgcolor="#001B35" width="100%">
                <tr><td height="5" colspan="7"><img src="/i/clear.gif" alt="" height="5" border="0" /></td></tr>

                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="/i/steel_gray_bg.gif" class="registerNav" height="18" colspan="5">&#160;&#160;Design Winners</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="/i/steel_bluebv_bg.gif" class="statText" width="25%" height="18">&#160;&#160;Project Name</td>
                    <td background="/i/steel_bluebv_bg.gif" class="statText" width="15%" height="18" align="center">&#160;Total&#160;Submissions&#160;&#160;</td>
                    <td background="/i/steel_bluebv_bg.gif" class="statText" width="30%" height="18">Winner(s)&#160;</td>
                    <td background="/i/steel_bluebv_bg.gif" class="statText" width="15%" height="18" align="center">&#160;Board&#160;Score&#160;</td>
                    <td background="/i/steel_bluebv_bg.gif" class="statText" width="14%" height="18" align="right">&#160;Total&#160;Earnings*&#160;</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
                
                <tr><td height="3" colspan="7"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText" height="15">&#160;&#160;<a href="http://software.topcoder.com/pages/c_component.jsp?comp=6403441" class="statText" target="parent">Authentication Factory</a></td>
                    <td class="statText" height="15" align="center">1</td>
                    <td class="statText" height="15"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=287614"><strong>argolite</strong></a></td>
                    <td class="statText" height="15" align="center">86.54</td>
                    <td class="statText" height="15" align="right">$822.50&#160;&#160;</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td height="3" colspan="7"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText" height="15">&#160;&#160;<a href="http://software.topcoder.com/pages/c_component.jsp?comp=7289752" class="statText" target="parent">Complex Number</a></td>
                    <td class="statText" height="15" align="center">3</td>
                    <td class="statText" height="15"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=150498"><strong>ThinMan</strong></a></td>
                    <td class="statText" height="15" align="center">93.09</td>
                    <td class="statText" height="15" align="right">$709.80&#160;&#160;</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
                
                <tr><td height="3" colspan="7"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText" height="15">&#160;</td>
                    <td class="statText" height="15" align="center">&#160;</td>
                    <td class="statText" height="15"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=278342"><strong>adic</strong></a></td>
                    <td class="statText" height="15" align="center">92.58</td>
                    <td class="statText" height="15" align="right">$1,944.80&#160;&#160;</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
                
                <tr><td height="5" colspan="7"><img src="/i/clear.gif" alt="" height="5" border="0" /></td></tr>

                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText" height="15">&#160;</td>
                    <td class="statText" height="15" align="center">&#160;</td>
                    <td class="statText" height="15"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=296145"><strong>srowen</strong></a></td>
                    <td class="statText" height="15" align="center">92.18</td>
                    <td class="statText" height="15" align="right">$3,380.60&#160;&#160;</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
                
                <tr><td height="5" colspan="7"><img src="/i/clear.gif" alt="" height="5" border="0" /></td></tr>

                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText" height="15">&#160;&#160;<a href="http://software.topcoder.com/pages/c_component.jsp?comp=4310994" class="statText" target="parent">Distributed Simple Cache</a></td>
                    <td class="statText" height="15" align="center">2</td>
                    <td class="statText" height="15"><a class="coderTextGray" href="/stat?c=member_profile&amp;cr=289864"><strong>FTolToaster</strong></a></td>
                    <td class="statText" height="15" align="center">95.34</td>
                    <td class="statText" height="15" align="right">$245.00&#160;&#160;</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td height="3" colspan="7"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText" height="15">&#160;&#160;<a href="http://software.topcoder.com/pages/c_component.jsp?comp=3300831" class="statText" target="parent">Lightweight Model View Controller</a></td>
                    <td class="statText" height="15" align="center">1</td>
                    <td class="statText" height="15"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=304697"><strong>ozzie</strong></a></td>
                    <td class="statText" height="15" align="center">90.33</td>
                    <td class="statText" height="15" align="right">$1,371.25&#160;&#160;</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td height="3" colspan="7"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText" height="15">&#160;&#160;<a href="http://software.topcoder.com/pages/c_component.jsp?comp=7297246" class="statText" target="parent">Phonetic Spell Check</a></td>
                    <td class="statText" height="15" align="center">1</td>
                    <td class="statText" height="15"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=297450"><strong>kesteloot</strong></a></td>
                    <td class="statText" height="15" align="center">82.40</td>
                    <td class="statText" height="15" align="right">$0.00&#160;&#160;</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td height="3" colspan="7"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText" height="15">&#160;&#160;<a href="http://software.topcoder.com/pages/c_component.jsp?comp=6511818" class="statText" target="parent">Pluggable Persistence</a></td>
                    <td class="statText" height="15" align="center">2</td>
                    <td class="statText" height="15"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=287614"><strong>argolite</strong></a></td>
                    <td class="statText" height="15" align="center">86.28</td>
                    <td class="statText" height="15" align="right">$822.50&#160;&#160;</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td height="3" colspan="7"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText" height="15">&#160;</td>
                    <td class="statText" height="15" align="center">&#160;</td>
                    <td class="statText" height="15"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=304697"><strong>ozzie</strong></a></td>
                    <td class="statText" height="15" align="center">82.19</td>
                    <td class="statText" height="15" align="right">$1,371.25&#160;&#160;</td>
                </tr>
                
                <tr><td height="5" colspan="7"><img src="/i/clear.gif" alt="" height="5" border="0" /></td></tr>


                <tr><td height="3" colspan="7"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText" height="15">&#160;&#160;<a href="http://software.topcoder.com/pages/c_component.jsp?comp=7311989" class="statText" target="parent">Priority Queue</a></td>
                    <td class="statText" height="15" align="center">4</td>
                    <td class="statText" height="15"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=268546"><strong>TangentZ</strong></a></td>
                    <td class="statText" height="15" align="center">92.18</td>
                    <td class="statText" height="15" align="right">$962.25&#160;&#160;</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>


                <tr><td height="3" colspan="7"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText" height="15">&#160;</td>
                    <td class="statText" height="15" align="center">&#160;</td>
                    <td class="statText" height="15"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=299180"><strong>isv</strong></a></td>
                    <td class="statText" height="15" align="center">89.75</td>
                    <td class="statText" height="15" align="right">$1,869.00&#160;&#160;</td>
                </tr>
                
                <tr><td height="5" colspan="7"><img src="/i/clear.gif" alt="" height="5" border="0" /></td></tr>

                <tr><td height="3" colspan="7"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText" height="15">&#160;</td>
                    <td class="statText" height="15" align="center">&#160;</td>
                    <td class="statText" height="15"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=279551"><strong>scamp</strong></a></td>
                    <td class="statText" height="15" align="center">79.60</td>
                    <td class="statText" height="15" align="right">$388.50&#160;&#160;</td>
                </tr>
                
                <tr><td height="5" colspan="7"><img src="/i/clear.gif" alt="" height="5" border="0" /></td></tr>

                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="/i/steel_gray_bg.gif" class="registerNav" height="18" colspan="5">&#160;&#160;Development Winners</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="/i/steel_bluebv_bg.gif" class="statText" width="25%" height="18">&#160;&#160;Project Name</td>
                    <td background="/i/steel_bluebv_bg.gif" class="statText" width="15%" height="18" align="center">&#160;Total&#160;Submissions&#160;&#160;</td>
                    <td background="/i/steel_bluebv_bg.gif" class="statText" width="30%" height="18">Winner(s)&#160;</td>
                    <td background="/i/steel_bluebv_bg.gif" class="statText" width="15%" height="18" align="center">&#160;Board&#160;Score&#160;</td>
                    <td background="/i/steel_bluebv_bg.gif" class="statText" width="14%" height="18" align="right">&#160;Total&#160;Earnings*&#160;</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
                
                <tr><td height="3" colspan="7"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText" height="15">&#160;&#160;<a href="http://software.topcoder.com/pages/c_component.jsp?comp=4201389" class="statText" target="parent">Heartbeat</a></td>
                    <td class="statText" height="15" align="center">2</td>
                    <td class="statText" height="15"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=286907"><strong>WishingBone</strong></a></td>
                    <td class="statText" height="15" align="center">90.13</td>
                    <td class="statText" height="15" align="right">$2,352.75&#160;&#160;</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
                
                <tr><td height="3" colspan="7"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>
                

                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText" height="15">&#160;</td>
                    <td class="statText" height="15" align="center">&#160;</td>
                    <td class="statText" height="15"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=263162"><strong>JavaGrinder</strong></a></td>
                    <td class="statText" height="15" align="center">80.72</td>
                    <td class="statText" height="15" align="right">$0.00&#160;&#160;</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
                
                <tr><td height="3" colspan="7"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText" height="15">&#160;&#160;<a href="http://software.topcoder.com/pages/c_component.jsp?comp=6402026" class="statText" target="parent">SMTP Connection Manager</a></td>
                    <td class="statText" height="15" align="center">1</td>
                    <td class="statText" height="15"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=286907"><strong>WishingBone</strong></a></td>
                    <td class="statText" height="15" align="center">89.15</td>
                    <td class="statText" height="15" align="right">$2,352.75&#160;&#160;</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
                
                <tr><td height="3" colspan="7"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                <tr valign="middle">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText" height="15">&#160;&#160;<a href="http://software.topcoder.com/pages/c_component.jsp?comp=3300871" class="statText" target="parent">URL Loader</a></td>
                    <td class="statText" height="15" align="center">1</td>
                    <td class="statText" height="15"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=286907"><strong>WishingBone</strong></a></td>
                    <td class="statText" height="15" align="center">88.52</td>
                    <td class="statText" height="15" align="right">$2,352.75&#160;&#160;</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
                



               
                <tr><td height="5" colspan="7"><img src="/i/clear.gif" alt="" height="20" border="0" /></td></tr>
            </table>
<!-- Development Winners Ends -->
        </td>
<!-- Center Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="244" bgcolor="#001B35">
            <xsl:call-template name="public_dev_right" />        
        </td>
<!-- Right Column Ends -->
    
    </tr>
</table>

<!-- Footer Begins -->
        <xsl:call-template name="Foot" /> 
<!-- Footer Endss -->

</body>
</html>
    </xsl:template>
</xsl:stylesheet>

