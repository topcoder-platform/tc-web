<html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>PACTS</title>
</head>

<body>

<%@ page import="com.topcoder.web.pacts.common.*" %>
<%@ page import="com.topcoder.web.common.*" %>
<%
	String contract_id_string = request.getParameter(PactsConstants.CONTRACT_ID);
	boolean payment_is_for_contract = true;
	long contract_id=0;
	if (contract_id_string != null)  contract_id = Long.parseLong(contract_id_string);
	else payment_is_for_contract = false;
	ResultSetContainer stati = (ResultSetContainer)
		request.getAttribute(PactsConstants.STATUS_CODE_LIST);
	ResultSetContainer paymentTypes = (ResultSetContainer)
		request.getAttribute(PactsConstants.PAYMENT_TYPE_LIST);
	String message = (String)
		request.getAttribute("message");
	if (message == null) {
		message = "";
	}
	UserProfileHeader user = null;
	ContractHeader contract = null;
	if (payment_is_for_contract) {
		contract = (ContractHeader)
		  request.getAttribute(PactsConstants.PACTS_INTERNAL_RESULT);
		if (contract == null) {
			out.println("no contract!!!</br>");
			contract = new ContractHeader();
		}
	}
	else {
		user = (UserProfileHeader)
		  request.getAttribute(PactsConstants.PACTS_INTERNAL_RESULT);
		if (user == null) {
			out.println("no user!!!<br>");
			user = new UserProfileHeader();
		}
	}
%>

<h1>PACTS</h1>
<h2>Add 
<% if (payment_is_for_contract) out.print("Contract"); %>
Payment</h2>

<% out.print("<form action=\""+PactsConstants.INTERNAL_SERVLET_URL+"\" method=\"post\">");
   out.print("<input type=\"hidden\" name=\""+PactsConstants.TASK_STRING+"\" value=\"");
   out.print(PactsConstants.ADD_TASK+"\">");
   out.print("<input type=\"hidden\" name=\""+PactsConstants.CMD_STRING+"\" value=\"");
   out.print(PactsConstants.PAYMENT_CMD+"\">");
   if (payment_is_for_contract) {
	   out.print("<input type=\"hidden\" name=\""+PactsConstants.CONTRACT_ID+"\" value=\"");
	   out.print(""+contract_id+"\">");
	   out.print("<input type=\"hidden\" name=\""+PactsConstants.USER_ID+"\" value=\"");
	   out.print(""+contract._user._id+"\">");
   }
   else {
	   out.print("<input type=\"hidden\" name=\""+PactsConstants.USER_ID+"\" value=\"");
	   out.print(""+user._id+"\">");
   }
%>
		<table border="0" cellpadding="5" cellspacing="5">
		<tr>
		<td>
<%		if (payment_is_for_contract) {
			out.print("<b>User:</b></td>");
 			out.print("<td><a href=\"");
			out.print(PactsConstants.INTERNAL_SERVLET_URL);
			out.print("?"+PactsConstants.TASK_STRING+"=");
			out.print(PactsConstants.VIEW_TASK+"&");
			out.print(PactsConstants.CMD_STRING+"=");
			out.print(PactsConstants.USER_CMD+"&");
			out.print(PactsConstants.USER_ID+"=");
			out.print(contract._user._id);
			out.print("\">"+contract._user._handle+"</a></td></tr>\n");

			out.print("<tr><td><b>Contract:</b></td>");
 			out.print("<td><a href=\"");
			out.print(PactsConstants.INTERNAL_SERVLET_URL);
			out.print("?"+PactsConstants.TASK_STRING+"=");
			out.print(PactsConstants.VIEW_TASK+"&");
			out.print(PactsConstants.CMD_STRING+"=");
			out.print(PactsConstants.CONTRACT_CMD+"&");
			out.print(PactsConstants.CONTRACT_ID+"=");
			out.print(contract._id);
			out.print("\">"+contract._name+"</a>\n");
		}
		else { 
			out.print("<b>User:</b></td>");
 			out.print("<td><a href=\"");
			out.print(PactsConstants.INTERNAL_SERVLET_URL);
			out.print("?"+PactsConstants.TASK_STRING+"=");
			out.print(PactsConstants.VIEW_TASK+"&");
			out.print(PactsConstants.CMD_STRING+"=");
			out.print(PactsConstants.USER_CMD+"&");
			out.print(PactsConstants.USER_ID+"=");
			out.print(user._id);
			out.print("\">"+user._handle+"</a>\n");
		}
%>
		</td>
		</tr>
		<tr>
		<td><b>Status:</b></td>
		<td>
		<select name="status_id">
<%		int rowCount;
		ResultSetContainer.ResultSetRow rsr;
		String s;
		if (stati != null) {
			rowCount = stati.getRowCount();
			for (int n = 0; n < rowCount; n++) {
				rsr = stati.getRow(n);
				out.print("<option value=");
				out.print("" + TCData.getTCInt(rsr,"status_id",0,true));
				s = TCData.getTCString(rsr,"status_desc","default status",true);
				if (payment_is_for_contract && s.equals(PactsConstants.DEFAULT_CONTRACT_PAYMENT_STATUS)) {
					out.print(" selected");
				} else if (!payment_is_for_contract && s.equals(PactsConstants.DEFAULT_PAYMENT_STATUS)) {
					out.print(" selected");
				}
				out.print(">" + s + "</option>\n");
			}
		}
%>
		</select>
		</td>
		</tr>
		<tr>
		<td><b>Description:</b></td><td>
		<input type=text width=25 name="payment_desc">
		</td></tr>
		<tr>
		<td><b>Type:</b></td><td>
		<select name="payment_type_id">
<%		if (paymentTypes != null) {
			rowCount = paymentTypes.getRowCount();
			for (int n = 0; n < rowCount; n++) {
				rsr = paymentTypes.getRow(n);
				out.print("<option value=");
				out.print("" + TCData.getTCInt(rsr,"payment_type_id",0,true));
				s = TCData.getTCString(rsr,"payment_type_desc","default payment type",true);
				if (payment_is_for_contract && s.equals(PactsConstants.DEFAULT_CONTRACT_PAYMENT_TYPE)) {
					out.print(" selected");
				} else if (!payment_is_for_contract && s.equals(PactsConstants.DEFAULT_PAYMENT_TYPE)) {
					out.print(" selected");
				}
				out.print(">" + s + "</option>\n");
			}
		}
%>
		</select>
		</td></tr>
		<tr>
		<td><b>Net Amount:</b></td><td>
		<input type=text width=25 name="net_amount">
		</td></tr>
		<tr>
		<td><b>Gross Amount:</b></td><td>
		<input type=text width=25 name="gross_amount">
		</td></tr>
		<tr>
		<td><b>Date Due:</b></td><td>
		<input type=text width=25 name="date_due">
		</td></tr>

	</table>

<input type=submit>
</form>
<jsp:include page="/InternalFooter.jsp" flush="true" />

</body>

</html>