<%@ page import="com.topcoder.web.common.BaseServlet,
                com.topcoder.web.common.BaseProcessor,
                com.topcoder.web.forums.ForumConstants,
                com.topcoder.web.forums.controller.ForumsUtil,
                com.topcoder.web.common.StringUtils,
                com.topcoder.shared.util.ApplicationServer,
                com.jivesoftware.base.User,
                com.jivesoftware.base.JiveConstants,
                com.jivesoftware.forum.action.util.Page,
                com.jivesoftware.forum.WatchManager,
                com.jivesoftware.forum.Watch,
                com.jivesoftware.forum.ForumCategory,
                com.jivesoftware.forum.ForumThread,
                com.jivesoftware.forum.ForumMessage,
                com.jivesoftware.forum.ReadTracker,
                com.jivesoftware.forum.RatingManagerFactory,
                com.jivesoftware.forum.RatingManager,
                com.jivesoftware.forum.Attachment,
                com.jivesoftware.forum.database.DbAttachmentManager,
                java.util.*,
                com.topcoder.shared.util.DBMS"
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<tc-webtag:useBean id="authToken" name="authToken" type="com.jivesoftware.base.AuthToken" toScope="request"/>
<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="forum" name="forum" type="com.jivesoftware.forum.Forum" toScope="request"/>
<tc-webtag:useBean id="thread" name="thread" type="com.jivesoftware.forum.ForumThread" toScope="request"/>
<tc-webtag:useBean id="paginator" name="paginator" type="com.jivesoftware.forum.action.util.Paginator" toScope="request"/>
<tc-webtag:useBean id="historyBean" name="historyBean" type="com.topcoder.web.ejb.messagehistory.MessageHistory" toScope="request"/>
<tc-webtag:useBean id="unreadCategories" name="unreadCategories" type="java.lang.String" toScope="request"/>

<%  HashMap errors = (HashMap)request.getAttribute(BaseProcessor.ERRORS_KEY);
    User user = (User)request.getAttribute("user");
    String threadView = StringUtils.checkNull(request.getParameter(ForumConstants.THREAD_VIEW));
    RatingManager ratingManager = RatingManagerFactory.getInstance(authToken);
    ReadTracker readTracker = forumFactory.getReadTracker();
    ForumThread nextThread = (ForumThread)request.getAttribute("nextThread");
    ForumThread prevThread = (ForumThread)request.getAttribute("prevThread");
    boolean showPrevNextThreads = !(user != null && "false".equals(user.getProperty("jiveShowPrevNextThreads")));
    String prevTrackerClass = "", nextTrackerClass = "";
    ForumMessage prevPost = null, nextPost = null;

    String cmd = "";
    String watchMessage = "";
    WatchManager watchManager = forumFactory.getWatchManager();
    if (!authToken.isAnonymous() && watchManager.isWatched(user, thread)) {
       Watch watch = watchManager.getWatch(user, thread);
       watchMessage = "Stop Watching Thread";
       cmd = "remove";
    } else {
       watchMessage = "Watch Thread";
       cmd = "add";
    } 
    
    String flatMode = "flat";
    if (user != null && user.getProperty("jiveFlatMode") != null) {
        flatMode = user.getProperty("jiveFlatMode");
    } %>

<html>
<head>
<title>TopCoder Forums</title>
<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
   <jsp:param name="key" value="tc_forums"/>
</jsp:include>

</head>

<body>

<jsp:include page="top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<script type="text/javascript">
<!--
function toggle(obj) {
    var el = document.getElementById(obj);
    if ( el.style.display != "none" ) {
        el.style.display = 'none';
    }
    else {
        el.style.display = '';
    }
}

var req;
function rate(messageID, voteValue) {
   var url = "?module=Rating";
   if (window.XMLHttpRequest) {
       req = new XMLHttpRequest();
   } else if (window.ActiveXObject) {
       req = new ActiveXObject("Microsoft.XMLHTTP");
   }
   req.open("POST", url, true);
   req.onreadystatechange = callback;
   req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
   req.send("messageID="+messageID+"&voteValue="+voteValue);
}

function callback() {
    if (req.readyState == 4) {
        if (req.status == 200) {
            var messageID = req.responseXML.getElementsByTagName("messageID")[0].firstChild.nodeValue;
            var posRatings = req.responseXML.getElementsByTagName("posRatings")[0].firstChild.nodeValue;
            var negRatings = req.responseXML.getElementsByTagName("negRatings")[0].firstChild.nodeValue;
            displayVotes(messageID, posRatings, negRatings);
        }
    }
}

function displayVotes(messageID, posVotes, negVotes) {
    var mspan = document.getElementById("ratings"+messageID);
    mspan.innerHTML = "(+"+posVotes+"/-"+negVotes+")";
}
//-->
</script>

<style type="text/css">
<!--
.pointer {
    cursor: pointer;
}

.rtTextCellHlt
{
    background-color: #FFFF99;
    padding: 10px 15px 10px 15px;
    color: #333;
    font-size: 12px;
    vertical-align: top;
}
-->
</style>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
      <td width="180">
          <jsp:include page="includes/global_left.jsp">
             <jsp:param name="node" value="forums"/>
          </jsp:include>
      </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" class="rtBody">

        <jsp:include page="page_title.jsp" >
            <jsp:param name="image" value="forums"/>
            <jsp:param name="title" value="&#160;"/>
        </jsp:include>

<table cellpadding="0" cellspacing="0" class="rtbcTable">
<tr>
   <td class="categoriesBox" style="padding-right: 20px;">
      <jsp:include page="categoriesHeader.jsp" />
   </td>
   <td nowrap="nowrap" valign="top" width="100%" style="padding-right: 20px;">
       <jsp:include page="searchHeader.jsp" />
   </td>
   <td align="right" nowrap="nowrap" valign="top">
   <A href="?module=Watch&<%=ForumConstants.WATCH_TYPE%>=<%=JiveConstants.THREAD%>&<%=ForumConstants.WATCH_ID%>=<%=thread.getID()%><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>&<%=ForumConstants.WATCH_COMMAND%>=<%=cmd%>"
   class="rtbcLink"><%=watchMessage%></A>&#160;&#160;|&#160;&#160;<A href="?module=History" class="rtbcLink">My Post History</A>&#160;&#160;|&#160;&#160;<A href="?module=Watches" class="rtbcLink">My Watches</A>&#160;&#160;|&#160;&#160;<A href="?module=Settings" class="rtbcLink">User Settings</A><br>
   View:
   <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=thread.getID()%>&mc=<%=thread.getMessageCount()%>&<%=ForumConstants.THREAD_VIEW%>=<%=flatMode%>" class="rtbcLink">Flat</A>&#160;&#160;|
   <span class="currentPage">Threaded</span>&#160;&#160;|
   <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=thread.getID()%>&mc=<%=thread.getMessageCount()%>&<%=ForumConstants.THREAD_VIEW%>=tree" class="rtbcLink">Tree</A>
   <% if (errors.get(ForumConstants.WATCH_THREAD) != null) { %><br><font color="red"><tc-webtag:errorIterator id="err" name="<%=ForumConstants.WATCH_THREAD%>"><%=err%></tc-webtag:errorIterator></font><% } %>
   <%   if (showPrevNextThreads && (nextThread != null || prevThread != null)) { %><br>
        <% if (prevThread != null) { %>
            <%  prevPost = ForumsUtil.getLatestMessage(prevThread);
                prevTrackerClass = (user == null || readTracker.getReadStatus(user, prevPost) == ReadTracker.READ) ? "rtbcLink" : "rtLinkBold"; %>
           <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=prevThread.getID()%>&<%=ForumConstants.START_IDX%>=0&mc=<%=prevThread.getMessageCount()%><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="<%=prevTrackerClass%>">Previous Thread</A>
        <% } else { %>
           Previous Thread
        <% } %>&#160;|&#160;
        <% if (nextThread != null) { %>
            <%  nextPost = ForumsUtil.getLatestMessage(nextThread);
                nextTrackerClass = (user == null || readTracker.getReadStatus(user, nextPost) == ReadTracker.READ) ? "rtbcLink" : "rtLinkBold"; %>
           <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=nextThread.getID()%>&<%=ForumConstants.START_IDX%>=0&mc=<%=nextThread.getMessageCount()%><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="<%=nextTrackerClass%>">Next Thread</A>
        <% } else { %>
           Next Thread
        <% } %>
   <%   }   %>
   </td>
</tr>

<tr><td colspan="3" style="padding-bottom:3px;"><b>
    <%	Iterator itCategories = ForumsUtil.getCategoryTree(forum.getForumCategory());
    	while (itCategories.hasNext()) {
    		ForumCategory category = (ForumCategory)itCategories.next(); %>
	        <A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=category.getID()%>" class="rtbcLink"><%=category.getName()%></A>
	<%      if (!itCategories.hasNext() && ForumsUtil.isSoftwareSubcategory(forum.getForumCategory())) { %>
	        	(<a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=<%=forum.getForumCategory().getProperty(ForumConstants.PROPERTY_COMPONENT_ID)%>" class="rtbcLink">Component</a>)	
		<%	} %>
			<img src="/i/interface/exp_w.gif" align="absmiddle"/>
   <%	} %>
   <A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<%=forum.getID()%>&mc=<%=forum.getMessageCount()%>" class="rtbcLink"><%=forum.getName()%></A>
   <%	String linkStr = ForumsUtil.createLinkString(forum);
   		if (!linkStr.equals("()")) { %>
   			<%=linkStr%>
   <% 	} %>
   <img src="/i/interface/exp_w.gif" align="absmiddle"/> <%=thread.getName()%></b>
   </td>
</tr>
</table>

<%-------------POSTS---------------%>
<tc-webtag:iterator id="message" type="com.jivesoftware.forum.ForumMessage" iterator='<%=(Iterator)request.getAttribute("messages")%>'>
  <%  int depth=thread.getTreeWalker().getMessageDepth(message);
      int width=Math.round(Math.min(500,500-((depth-50)*(depth-50))/5)); %>
<div style="padding:0px 0px 0px <%=width%>px;">
<table cellpadding="0" cellspacing="0" class="rtTable">
      <tr>
          <td class="rtHeader" colspan="2">
            <%  String msgBodyID = "msgBody" + message.getID();
                String ratingsID = "ratings" + message.getID(); 
                int ratingCount = -1;
                int posRatings = -1; 
                int negRatings = -1; %> 
            <div valign="top" style="float: right; padding-left: 5px; white-space: nowrap;">
                  <%  int editCount = historyBean.getEditCount(message.getID(), DBMS.FORUMS_DATASOURCE_NAME);
                  if (editCount > 0) { %> 
                      <a href="?module=RevisionHistory&<%=ForumConstants.MESSAGE_ID%>=<%=message.getID()%>" class="rtbcLink" title="Last updated <tc-webtag:format object="${message.modificationDate}" format="EEE, MMM d, yyyy 'at' h:mm a z" timeZone="${sessionInfo.timezone}"/>"><%=ForumsUtil.display(editCount, "edit")%></a> | 
                  <%  } %>
               <a name=<%=message.getID()%>><tc-webtag:format object="${message.creationDate}" format="EEE, MMM d, yyyy 'at' h:mm a z" timeZone="${sessionInfo.timezone}"/></a>
            </div>
            <%  if (ratingManager.isRatingsEnabled() && user != null && ForumsUtil.showRatings(user)) { %>
                <a class="pointer" onMouseOver="this.style.color='#FF0000'"; onMouseOut="this.style.color='#333'"; onclick="toggle('<%=msgBodyID%>')";><%=message.getSubject()%></a>
            <%  } else { %>
                <%=message.getSubject()%>
            <%  } %>
            <%   if (message.getParentMessage() != null) { %>
               (response to <A href="#<%=message.getParentMessage().getID()%>" class="rtbcLink">post</A><%if (message.getParentMessage().getUser() != null) {%> by <tc-webtag:handle coderId="<%=message.getParentMessage().getUser().getID()%>"/><%}%>)
            <%   } %>
            <%  if (ratingManager.isRatingsEnabled() && user != null && ForumsUtil.showRatings(user)) {
                    int[] ratings = ForumsUtil.getRatings(ratingManager, message);
                    posRatings = ratings[0];
                    negRatings = ratings[1];
                    ratingCount = posRatings+negRatings; %>
            | Feedback: <span id="<%=ratingsID%>">(+<%=posRatings%>/-<%=negRatings%>)</span> 
            | <a href="javascript:void(0)" onclick="rate('<%=message.getID()%>','2')" class="rtbcLink">[+]</a> 
              <a href="javascript:void(0)" onclick="rate('<%=message.getID()%>','1')" class="rtbcLink">[-]</a>
            <%  } %>
            | <A href="?module=Post&<%=ForumConstants.POST_MODE%>=Reply&<%=ForumConstants.MESSAGE_ID%>=<%=message.getID()%>" class="rtbcLink">Reply</A>
            <%  if (message.getUser() != null && message.getUser().equals(user)) { %>
            | <A href="?module=Post&<%=ForumConstants.POST_MODE%>=Edit&<%=ForumConstants.MESSAGE_ID%>=<%=message.getID()%>" class="rtbcLink">Edit</A>
            <%   } %>
          </td>
      </tr>
      <% if (message.getAttachmentCount() > 0) { %>
		<tr>
			<td class="rtHeader" colspan="2">
				Attachments:
				<%	Iterator attachments = message.getAttachments();
					while(attachments.hasNext()) {
						Attachment attachment = (Attachment)attachments.next(); %>&nbsp;
						<A href="?module=GetAttachment&<%=ForumConstants.ATTACHMENT_ID%>=<%=attachment.getID()%>"><img align="absmiddle" src="/i/roundTables/icons/<%=DbAttachmentManager.getThumbnailImage(attachment.getContentType())%>" border="0" alt="Attachment" /></A>
						<A href="?module=GetAttachment&<%=ForumConstants.ATTACHMENT_ID%>=<%=attachment.getID()%>" class="rtbcLink"><%=attachment.getName()%></A> (<%=ForumsUtil.getFileSizeStr(attachment.getSize())%>)&nbsp;&nbsp;
				<% 	} %>
			</td>
	 	</tr>
	  <% } %>
      <%   double pct = ratingCount<=0 ? 0 : 100*(double)(posRatings)/(double)(ratingCount);
           String msgBodyDisplay = ForumsUtil.collapsePost(user, pct, ratingCount, thread.getMessageCount())?"display:none":"";
      %>
      <tr id="<%=msgBodyID%>" style="<%=msgBodyDisplay%>">
      <td class="rtPosterCell">
         <div class="rtPosterSpacer">
         <%  if (ForumsUtil.displayMemberPhoto(user, message.getUser())) { %>
            <img src="<%=message.getUser().getProperty("imagePath")%>" width="55" height="61" border="0" class="rtPhoto" /><br>
         <%  } %>
         <span class="bodyText"><%if (message.getUser() != null) {%><tc-webtag:handle coderId="<%=message.getUser().getID()%>"/><%}%></span><br><%if (message.getUser() != null) {%><A href="?module=History&<%=ForumConstants.USER_ID%>=<%=message.getUser().getID()%>"><%=ForumsUtil.display(forumFactory.getUserMessageCount(message.getUser()), "post")%></A><%}%>
         </div>
      </td>
      <%   if (ForumsUtil.highlightPost(user, pct, ratingCount)) { %>
      <td class="rtTextCellHlt" width="100%"><%=message.getBody()%></td>
      <%   } else { %>
      <td class="rtTextCell" width="100%"><%=message.getBody()%></td>
      <%   } %>
      </tr>
      <tr>
	      <td></td>
	      <td width="100%"></td>
      </tr>
</table>
</div>
</tc-webtag:iterator>
<%-------------POSTS END---------------%>

<table cellpadding="0" cellspacing="0" class="rtbcTable">
<tr><td><b>
   <%	itCategories = ForumsUtil.getCategoryTree(forum.getForumCategory());
    	while (itCategories.hasNext()) {
    		ForumCategory category = (ForumCategory)itCategories.next(); %>
	        <A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=category.getID()%>" class="rtbcLink"><%=category.getName()%></A>
	<%      if (!itCategories.hasNext() && ForumsUtil.isSoftwareSubcategory(forum.getForumCategory())) { %>
	        	(<a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=<%=forum.getForumCategory().getProperty(ForumConstants.PROPERTY_COMPONENT_ID)%>" class="rtbcLink">Component</a>)	
		<%	} %>
			<img src="/i/interface/exp_w.gif" align="absmiddle"/>
   <%	} %>
   <A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<%=forum.getID()%>&mc=<%=forum.getMessageCount()%>" class="rtbcLink"><%=forum.getName()%></A>
   <%	linkStr = ForumsUtil.createLinkString(forum);
   		if (!linkStr.equals("()")) { %>
   			<%=linkStr%>
   <% 	} %>
   <img src="/i/interface/exp_w.gif" align="absmiddle"/> <%=thread.getName()%></b>
   <%   if (showPrevNextThreads && (nextThread != null || prevThread != null)) { %><br>
        <% if (prevThread != null) { %>
            <%  prevPost = ForumsUtil.getLatestMessage(prevThread);
                prevTrackerClass = (user == null || readTracker.getReadStatus(user, prevPost) == ReadTracker.READ) ? "rtbcLink" : "rtLinkBold"; %>
           <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=prevThread.getID()%>&<%=ForumConstants.START_IDX%>=0&mc=<%=prevThread.getMessageCount()%><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="<%=prevTrackerClass%>">Previous Thread</A>
        <% } else { %>
           Previous Thread
        <% } %>&#160;|&#160;
        <% if (nextThread != null) { %>
            <%  nextPost = ForumsUtil.getLatestMessage(nextThread);
                nextTrackerClass = (user == null || readTracker.getReadStatus(user, nextPost) == ReadTracker.READ) ? "rtbcLink" : "rtLinkBold"; %>
           <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=nextThread.getID()%>&<%=ForumConstants.START_IDX%>=0&mc=<%=nextThread.getMessageCount()%><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="<%=nextTrackerClass%>">Next Thread</A>
        <% } else { %>
           Next Thread
        <% } %>
   <%   }   %>
   </td>
    <td align="right"><a href="?module=RSS&<%=ForumConstants.THREAD_ID%>=<%=thread.getID()%>"><img alt="RSS" border="none" src="/i/interface/btn_rss.gif"/></a></td>
</table>

        <p><br></p>
        </td>

<!-- Center Column Ends -->

    </tr>
</table>

<jsp:include page="foot.jsp" />

</body>

</html>