package com.topcoder.web.stat.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import com.topcoder.web.stat.bean.*;
import com.topcoder.web.stat.common.*;
import com.topcoder.common.web.data.Navigation;
import com.topcoder.common.*;
import org.w3c.dom.*;
import org.apache.xerces.parsers.*;
import org.xml.sax.*;
import javax.xml.parsers.*;


public class StatisticsHttpServlet extends HttpServlet{
  private static final String LAST_MOD_HDR = "Last-Modified";
  private static final String XML_FILE = ApplicationServer.BASE_DIR+"/resources/stat/statServlet.xml";
  private static final String PUBLIC = "0";
  private static final String LOGGED_IN_ONLY = "1";
  private static final String ACCESS_MAP_KEY = "ACCESSCTRL";
  private Properties mProp = new Properties();
  private static String dataClass = "com.topcoder.web.stat.bean.CachedDataRetrievalBean";

  /**
     * This method returns the associated properties object
    *
     * @return  Properties
     */
    public Properties getProps() {
      return mProp;
    }

   /**
  *  Initializes all the navigation elements and places them in the servlet context
  *
  public void initNavigation() {
    load the page-forwarding info....
  }

  /**
   * This method initializes global variables
   *
   * @return  none
   */
  public void init() {
    ServletContext srvctx = this.getServletContext();
    if (srvctx.getAttribute("PAGECTRL")==null) {
      this.reload(srvctx);
    }
  }

  /**
   * Reloads all the config info
   * @param ServletContext the servlet context
   */
   public static void reload(ServletContext srvctx){

     try{
        Document doc = StatXMLParser.getXMLDocument(XML_FILE);
        QuickStatListBean qslist = StatXMLParser.buildQuickStatListBean(doc);
        srvctx.setAttribute(QuickStatListBean.BEAN_TOKEN, qslist);
        CoderRatingStyleBean crsb = StatXMLParser.buildCoderRatingStyleBean(doc);
        srvctx.setAttribute(CoderRatingStyleBean.BEAN_TOKEN, crsb);
        Map m = StatXMLParser.buildContentMap(doc);
        srvctx.setAttribute("PAGECTRL", m);
        Map accessMap = StatXMLParser.buildAccessMap(doc);
        srvctx.setAttribute(ACCESS_MAP_KEY, accessMap);
        String sMasterError = StatXMLParser.getGlobalErrorFwd(doc);
        srvctx.setAttribute("GLOBAL_ERROR", sMasterError);
     } catch (Exception e){
       e.printStackTrace();
     }
   }

    /**
   * This method implements the doGet method, which forwards the request to process
   *
   * @param HttpServletRequest  Request object
   * @param HttpServletResponse  Response object
   * @return    none
   * @throws    ServletException
   * @throws    IOException
   */
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
          process(request, response);
  }

    /**
   * This method implements the doPost method, which forwards the request to process
   *
   * @param HttpServletRequest  Request object
   * @param HttpServletResponse  Response object
   * @return    none
   * @throws    ServletException
   * @throws    IOException
   */
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
      process(request, response);
  }

   /**
   * This method handles the actual request processing
   *
   * @param HttpServletRequest  Request object
   * @param HttpServletResponse  Response object
   * @return    none
   * @throws    ServletException
   * @throws    IOException
   */
  public void process(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
    String sQueryString = request.getQueryString();
    if (sQueryString != null) {
      // the next line works for Servlet.jar pre Servlet 2.3
      Map map = HttpUtils.parseQueryString(sQueryString);
      // the next line works for Servlet 2.3
      // Map map = request.getParameterMap();

      StatRequestBean srb = new StatRequestBean(map);

      ServletContext sctx = this.getServletContext();
      Map accessMap = (Map)this.getServletContext().getAttribute(ACCESS_MAP_KEY);
      String accessLevel = (String)accessMap.get(srb.getContentHandle());
      Navigation nav = (Navigation)request.getSession().getAttribute("navigation");
      if (nav==null) nav = new Navigation();

      try {
        if (nav.getLoggedIn())
          com.topcoder.common.web.util.Data.loadUser(nav);
        if (nav.getUser() == null)
          Log.msg("[*** stats *** " + srb.getContentHandle() + " ***  ***]");
        else Log.msg("[*** stats *** " + srb.getContentHandle() + " *** " + nav.getUser().getHandle() + " ***]");
     
        //hoke so that we can reload the properties file on the fly 
        if (srb.getContentHandle().equals("reload")) {
          this.reload(sctx);
          return;
        }
 
        if (accessLevel.equals(LOGGED_IN_ONLY) && (!nav.getLoggedIn())) {
          response.sendRedirect("http://" + request.getServerName() +
                                "/?t=authentication&c=login&errorMsg=" +
                                "You must log in to view this portion of the site.&errorURL=http://" +
                                request.getServerName() + "/stat?" + replace(sQueryString));
        }
        request.setAttribute("REQUEST_BEAN", srb);
        StatDataAccessInt dai = (StatDataAccessInt)ObjFactory.create(dataClass);
        Map dataMap = dai.getData(srb);
        request.setAttribute("QUERY_RESPONSE", dataMap);
        Map mpage = (Map) sctx.getAttribute("PAGECTRL");
        sctx.getRequestDispatcher((String)mpage.get(srb.getContentHandle())).forward(request,response);
      } catch (Exception e) {
        e.printStackTrace();
        sctx.getRequestDispatcher(sctx.getAttribute("GLOBAL_ERROR").toString()).forward(request,response);
      }

    }
  }

  private String replace(String s) {

    if (s==null) {
      return "";
    } else {
      StringBuffer buffer = new StringBuffer( s );
      for (int i=0; i<buffer.length(); i++) {
        if ( buffer.charAt(i) == '&' ) {
          buffer.replace(i,i+1,"%26");
          i+=3;
        }
      }
      return buffer.toString();
    }
  }


}
