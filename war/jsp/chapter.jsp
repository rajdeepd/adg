<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
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
<%@ page import="com.android.adg.AdminUser" %>
<!DOCTYPE html>
<html>
<%@include file='head.html'%>
<body class="gc-documentation">
<jsp:include page="/jsp/header.jsp">
 <jsp:param name="pagename" value="active-chapters" />
</jsp:include>

	<!-- header -->
<div id="mainBodyFixed">
	<div id="mainBodyLeft">

		<h1>ADG <%=request.getParameter("city") %></h1>
		<p>
		Overview of the Chapter	
		</p>
		<h2>Announcements</h2>
		<p>Announcements go here</p>
		
		<p>Last Event</p>

	</div>
	<!-- end mainBodyLeft -->

	<div id="mainBodyRight"></div>
	</div>

	<div id="footer">
		<div id="copyright">
			Except as noted, this content is licensed under <a
				href="http://creativecommons.org/licenses/by/2.5/"> Creative
				Commons Attribution 2.5</a>.
		</div>

		<div id="footerlinks"></div>

	</div>
	<!-- end footer -->

</div><!-- end doc-content -->

</div> <!-- end body-content --> 

</body>
</html>
