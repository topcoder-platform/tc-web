<%--
/**
 *  profile.jsp
 */
--%>
<%@  page
  language="java"
  errorPage="/errorPage.jsp"
  import="java.util.*,
          com.topcoder.common.web.data.report.*,
          com.topcoder.shared.dataAccess.resultSet.*"

%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>


<html>
  <head>
    <title>TopCoder Reporting</title>
  </head>
  <body>
<%
    Map m = null;
    ResultSetContainer.ResultSetRow p;
    m = (Map)request.getAttribute(Constants.REPORT_PROFILE_SEARCH_KEY);
    ResultSetContainer states = (ResultSetContainer)m.get("state_list");
    ResultSetContainer countries = (ResultSetContainer)m.get("country_list");
    ResultSetContainer languages = (ResultSetContainer)m.get("languages");
%>
  <FORM ACTION="/tc?module=ProfileSearch" METHOD="POST">
    <table cellpadding="0" cellspacing="0" border="0">
      <TR><TD><A HREF="<%=Constants.SERVLET_ADDR%>">&lt;&lt; back to main menu</A></TD></TR>
      <tr><td>Handle: <input type="text" name="handle" size="15"></td></tr>
      <tr><td>E-Mail: <input type="text" name="email" size="15"></td></tr>
      <tr><td>First Name: <input type="text" name="firstname" size="15"></td></tr>
      <tr><td>Last Name: <input type="text" name="lastname" size="15"></td></tr>
      <tr><td>Zipcode: <input type="text" name="zipcode" size="5"></td></tr>
      <tr><td>City: <input type="text" name="city" size="15"></td></tr>
      <tr><td>Company: <input type="text" name="company" size="15"></td></tr>
      <tr><td>State: <select name="states" multiple size=5>
        <rsc:iterator list="<%=states%>" id="resultRow">
          <option value="<rsc:item name="state_code" row="<%=resultRow%>"/>"><rsc:item name="state_code" row="<%=resultRow%>"/></option>
        </rsc:iterator>
        </select>
      </td></tr>
      <tr><td>Country: <select name="country" multiple size=5>
        <option value="840">United States</option>
        <rsc:iterator list="<%=countries%>" id="resultRow">
          <% 
            String countryCode = resultRow.getStringItem("country_code");
            if(countryCode == null || countryCode.equals("840") || countryCode.equals(""))continue;//put the US first for convenience 
          %>
          <option value="<rsc:item name="country_code" row="<%=resultRow%>"/>"><rsc:item name="country_name" row="<%=resultRow%>"/></option>
        </rsc:iterator>
        </select>
      </td></tr>
      <tr><td>Country of Origin<select name="countryoforigin" multiple size=5>
        <option value="840">United States</option>
        <rsc:iterator list="<%=countries%>" id="resultRow">
          <% 
            String countryCode = resultRow.getStringItem("country_code");
            if(countryCode == null || countryCode.equals("840") || countryCode.equals(""))continue;//put the US first for convenience 
          %>
          <option value="<rsc:item name="country_code" row="<%=resultRow%>"/>"><rsc:item name="country_name" row="<%=resultRow%>"/></option>
        </rsc:iterator>
        </select>
      </td></tr>
      <tr><td><INPUT type="checkbox" name="pro" value="Professional" checked/>
      <INPUT type="checkbox" name="stud" value="Student" checked/></td></tr>
      <tr><td><INPUT type="checkbox" name="placement" value="Placement Indicator"/></td></tr>
      <tr><td>Languages: 
        <rsc:iterator list="<%=languages%>" id="resultRow">
          <input type="checkbox" name="<rsc:item name="language_id" row="<%=resultRow%>"/>" value="<rsc:item name="language_name" row="<%=resultRow%>"/>" checked>
        </rsc:iterator>
        </select>
      </td></tr>
      <tr><td>Max days since last rating: <input type="textbox" size="5" name="maxdayssincerating"></td></tr>
      <tr><td>Min events: <input type="textbox" size="5" name="minevents"></td></tr>
      <tr><td>Days since registration: <input type="textbox" size="5" name="mindays"> to <input type="textbox" size="5" name="maxdays"></td></tr>
    </table>
  </FORM>
  </body>
</html>



