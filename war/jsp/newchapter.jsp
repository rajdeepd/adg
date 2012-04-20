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

<div id="mainBodyFixed">
              <div id="mainBodyLeft">

			<h1>Starting a New Chapter</h1>

			<p>We are currently focusing on getting chapters rolled out in
				select Indian cities.</p>
			<h2>Criteria of getting selected to run a chapter</h2>
			<ul>
				<li>Passionate Android Application Developer with knowledge
					about the platform</li>
				<li>Previous Experience in running a community</li>
				<li>Preference will be given to developers with Published apps
					in the market</li>
				<li>We are "not" accepting applications from students at this
					point in time</li>
			</ul>
			<h2>List of Cities for which ADG applications are being
				accepted:</h2>

			<%
				List listOfCities = City.getAllCities();
				int count = listOfCities.size();
				if (count == 0) {
					City.init();
				}
				listOfCities = City.getAllCities();
			%>
			<ol>

				<%
					for (int i = 0; i < count; i++) {
						Entity entity = (Entity) listOfCities.get(i);
						String cityName = (String) entity.getProperty("name");
				%>
				<li><a href="/chapter?city=<%=cityName%>"><%=cityName%></a></li>
				<%
					}
				%>
			</ol>
			<h2>Apply For Starting a Chapter</h2>
			<%
				UserService userService = UserServiceFactory.getUserService();
				User user = userService.getCurrentUser();
				if (user == null) {
			%>
			<p>
				Please <a
					href="<%=userService.createLoginURL(request.getRequestURI())%>">Sign
					in</a> to Apply.
			</p>
			<%
				} else {
			%>
			<h3>City</h3>
			<form action="/newchapterapply" type="POST">
			<select name="city" id="cityid">
				<%
					for (int i = 0; i < count; i++) {
							Entity entity = (Entity) listOfCities.get(i);
							String cityName = (String) entity.getProperty("name");
				%>
				<option value="<%=cityName%>"><%=cityName%></option>
				<%
				}
				%>
			</select>
			&nbsp;
			<input type="submit" value="Apply"/>
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



