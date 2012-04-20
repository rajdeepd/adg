<!DOCTYPE html>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory" %>
<%@ page import="com.google.appengine.api.datastore.DatastoreService" %>
<%@ page import="com.google.appengine.api.datastore.Query" %>
<%@ page import="com.google.appengine.api.datastore.Entity" %>
<%@ page import="com.google.appengine.api.datastore.FetchOptions" %>
<%@ page import="com.google.appengine.api.datastore.Key" %>
<%@ page import="com.google.appengine.api.datastore.KeyFactory" %>
<%@ page import="com.android.adg.City" %>
<%@ page import="java.util.List" %>
<html>

<%@include file='head.html'%>
<body class="gc-documentation">
<%!String pagename = "home";%>
<jsp:include page="/jsp/header.jsp">
    <jsp:param name="pagename" value="newchapter" />
</jsp:include>
	<%
		UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();
		String userName = "";
		String email = "";
		if(user != null){
			userName = user.getNickname();
			email = user.getEmail();
		}
	%>
	<div id="mainBodyFixed">
             <div id="mainBodyLeft">

			<h1>Application for Chapter Coordinator</h1>
			<%
			String result = request.getParameter("result");
			String error = request.getParameter("error");
			String emailIdResult = request.getParameter("email");
			String cityResult = request.getParameter("city");
			String time = request.getParameter("time");
			if(result != null) {
			%>
            <p>Application <%=result %></p>
            <p><%=emailIdResult%> <%=cityResult%> <%=time %><p>
            <%
            }else if(error != null) {%>
            
                 <b>Error in processing the request</b><br/>
                 <p><%=error %></p>
            <%}else{ %>
			<p>Please fill in all the fields with the appropriate information</p>
			
			<form action="/newchaptersubmit" type="POST">
			<table>
			<tr>
			<td>First Name</td>
			<td><input type="Text" name="fname"/>
			</tr>
			<tr>
			<td>Last Name</td>
			<td><input type="Text" name="lname"/>
			</tr>
			<tr>
			<td>ChapterApplying for</td>
			
			<td>
			<b><input type="Text" name="city" value="<%=request.getParameter("city")%>" readonly="readonly"/></b>
			</td>
			</tr>
			<tr>
			<td>Primary Email Id</td>
			<td><input type="Text" name="emailid" value="<%=email%>"/>
			</tr>
			<tr>
			<td>Brief Profile</td>
			<td>
			<textarea rows="10" cols="100" name="profile">
			</textarea>
			</td>
			</tr>
			<tr>
			<td>Proposal</td>
			<td>
			<textarea rows="10" cols="100" name="proposal">
			</textarea>
			</td>
			</tr>
			</table>
			<input type="submit" value="Submit"/>
			</form>
			<%
			}
			%>
		</div><!-- end mainBodyLeft -->
              <div id="mainBodyRight" >                  
              </div>
</div>
<%@include file='footer.html'%>
</div><!-- end doc-content -->
</div> <!-- end body-content --> 

</body>
</html>



