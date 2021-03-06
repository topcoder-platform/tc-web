﻿<%--
  - Author: TCSASSEMBLER 
  - Version: 1.0
  - Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
  -
  - Description: This is the page to show the spin index page.
  - Version 1.0 (Release Assembly - Porting CS Mashathon pages to TopCoder website) changes: The first version.
  -
--%>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en">
    <!-- Start head -->
    <head>
        <meta charset="utf-8">
        
        <!-- Page title -->
        <title>API Mashathon Virtual Spinner</title>
        
        <!-- CSS Styles -->
        <link href="/css/mashathon.css" media="screen" rel="stylesheet" type="text/css" />
        
        <!-- Javascript files -->
        <script src="/js/jquery-2.0.3.min.js" type="text/javascript"></script>
        <script src="/js/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
        <script src="/js/jquery.arctext.js" type="text/javascript"></script>
        <script src="/js/spin.js" type="text/javascript"></script>
        
    </head>
    <!-- End head -->

    <!-- Start body -->
    <body>
        <!-- Start .spinner-wrap -->
        <section class="spinner-wrap">
            <!-- Start .spinner -->
            <section class="spinner">
                <!-- Start .intro -->
                <section class="intro">
                    <!-- Title -->
                    <h1 class="title">SUPERAWESOME CLOUD API MASHATHON SPINNER!</h1>
                    <!-- Start .content -->
                    <div class="content">
                        <!-- Main text -->
                        <p>Spin the wheel and find out what APIs you have to use for your app!</p>
                        <p>Two out of three must be used.</p>
                        <!-- Start button-->
                        <div class="start-btn-wrap"><a class="start-btn" href="javascript:;">START</a></div>
                    </div>
                    <!-- End .content -->
                </section>
                <!-- End .intro -->

                <!-- Spinner pointer at the top -->
                <div class="pointer"></div>
                <!-- Spinner inner title -->

                <!-- Start .intro-text -->
                <div class="intro-text">
                    <h2 class="title">SUPERAWESOME <br/> CLOUD API MASHATHON <br/> SPINNER!</h2>
                </div>
                <!-- End .intro-text -->

                <!-- Start .end-text -->
                <div class="end-text">
                    <h2 class="title">Congratulations!</h2>
                    <p class="text">Your selected APIs are</p>
                </div>
                <!-- End .end-text -->

                <!-- Start .buttons -->
                <ul class="buttons">
                    <!-- Button item -->
                        
                    <c:forEach var="item" items="${apis}" varStatus="i">
                        <li class="result">
                            <span class="number">${i.count}.</span>
                            <span class="text result">${item.apiName}</span>
                        </li>
                    </c:forEach>
                    
                    <c:forEach begin="${fn:length(apis) + 1}" end="3" varStatus="i">
                        <li>
                            <span class="number">${i.index}.</span>
                            <span class="text">-----Click Spin!-----</span>
                        </li>
                    </c:forEach>
                    
                </ul>
                <!-- End .buttons -->

                <!-- Start .item, this represent item template, all items are created by javascript cloning this -->
                <div class="item">
                    <!-- Item name text set by javascript -->
                    <h3 class="item-name"></h3>
                    <!-- Start svg -->
                    <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="141px" height="66px"    xml:space="preserve">
                        <!-- Start .group, svg group containing all items elements -->
                        <g class="group" transform="rotate(0)">
                            <!-- Start defs -->
                            <defs>
                                <!-- Start .activeGradient, active gradient -->
                                <radialGradient class="activeGradient" id="SVGID_1_" cx="71.0977" cy="6.5234" r="63.8377" gradientUnits="userSpaceOnUse">
                                    <stop class="stop1" offset="0" stop-color="#ED1E79" />
                                    <stop class="stop2" offset="1" stop-color="#8C005D" />
                                </radialGradient>
                                <!-- End .activeGradient -->
                            </defs>
                            <!-- End defs -->

                            <!-- Start .shadow, item shadow -->
                            <path class="shadow" fill="#B22024"                     d="M6.409,14.412c41.752-11.113,86.31-11.133,127.881-0.055c4.663,1.242,7.19,6.121,5.699,10.71l-11.413,35.098
                            c-1.493,4.588-6.443,7.16-11.123,5.982c-31.145-7.842-63.556-7.668-94.21,0.043c-4.681,1.176-9.632-1.398-11.124-5.988L0.709,25.117
                            C-0.782,20.528,1.746,15.652,6.409,14.412z"/>
                            <!-- End .shadow -->

                            <!-- Start .main, item main path -->
                            <path class="main" fill="#ED2224" d="M20.669,59.912c-3.846,0-7.203-2.382-8.354-5.926L0.903,18.9c-0.694-2.134-0.497-4.374,0.555-6.306
                            c1.02-1.874,2.724-3.21,4.798-3.762C27.029,3.303,48.558,0.5,70.246,0.5c21.614,0,43.023,2.785,63.635,8.276
                            c2.074,0.553,3.778,1.891,4.798,3.765c1.052,1.934,1.248,4.174,0.555,6.309L127.82,53.948c-1.152,3.542-4.508,5.92-8.349,5.92
                            c-0.733,0-1.466-0.091-2.177-0.27c-15.352-3.864-31.189-5.824-47.074-5.824c-15.955,0-31.896,1.975-47.38,5.869
                            C22.131,59.821,21.4,59.912,20.669,59.912z"/>
                            <!-- End .main -->

                            <!-- Start .border, item border -->
                            <path class="border" fill="#B22024" d="M70.252,0v1c21.565,0,42.93,2.779,63.499,8.26c1.94,0.517,3.534,1.768,4.487,3.521
                            c0.985,1.812,1.17,3.912,0.519,5.915l-11.413,35.098c-1.085,3.335-4.249,5.575-7.873,5.575c-0.691,0-1.383-0.085-2.055-0.255
                            c-15.39-3.874-31.269-5.838-47.196-5.839c-15.994,0-31.976,1.979-47.502,5.884c-0.669,0.168-1.359,0.253-2.049,0.253
                            c-3.628,0-6.795-2.243-7.879-5.581L1.379,18.746c-0.651-2.002-0.467-4.103,0.519-5.913c0.953-1.752,2.547-3.001,4.487-3.518
                            C27.113,3.798,48.599,1,70.246,1L70.252,0 M70.246,0C48.657,0,27.037,2.784,6.127,8.349c-4.662,1.24-7.191,6.117-5.7,10.706
                            L11.839,54.14c1.248,3.842,4.921,6.272,8.83,6.272c0.761,0,1.531-0.092,2.293-0.284c15.438-3.882,31.315-5.854,47.258-5.854
                            c15.714,0,31.492,1.917,46.952,5.809c0.765,0.193,1.536,0.285,2.299,0.285c3.906,0,7.575-2.427,8.824-6.266l11.413-35.098
                            c1.491-4.589-1.036-9.468-5.699-10.711C113.256,2.764,91.766-0.001,70.246,0L70.246,0z"/>
                            <!-- End .border -->
                        </g>
                        <!-- End .group -->
                    </svg>
                    <!-- End svg -->
                </div>
                <!-- Start .item -->

                <!-- Spin button -->
                <a class="spin-btn" href="javascript:;"></a>
            </section>
            <!-- End .spinner -->
            <!-- Modal overlay -->
            <div class="overlay"></div>
            <p style="padding-top:25px;color:#ffffff">For details on each API, see the <a href="http://<%=ApplicationServer.SERVER_NAME%>/tco13/overview/api-hackathon/" style="color:#ffffff">official TCO Hackathon page</a>. You can view the results of each contestant’s spin <a href="/tc?module=SpinResults" style="color:#ffffff">here</a>.</p>
        </section>
        <!-- End .spinner-wrap -->
    </body>
    <!-- End body -->
</html>