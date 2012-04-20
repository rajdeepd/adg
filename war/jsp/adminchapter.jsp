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
<%@ page import="com.android.adg.Chapter" %>
<%@ page import="com.android.adg.City" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<%@include file='head.html'%>
<body class="gc-documentation">
<jsp:include page="/jsp/headeradmin.jsp"/>

	<jsp:useBean id="userservicebean"
		class="com.android.adg.UserServiceBean">
		<jsp:setProperty name="userservicebean" property="*" />
	</jsp:useBean>
	<!--<c:out value="${userservicebean.email}"/>
	<c:out value="${userservicebean.user }"/>-->

	<jsp:useBean id="adminuserbean" class="com.android.adg.AdminUserBean">
		<jsp:setProperty name="adminuserbean" property="*" />
	</jsp:useBean>
<%
	UserService userService = UserServiceFactory.getUserService();
	User user = userService.getCurrentUser();
%>

  <c:choose>
		<c:when test="${userservicebean.email  eq  'NOT_SET'  }">
			<p style="margin: 20px">
				Please <a
					href="<%=userService.createLoginURL(request
							.getRequestURI())%>">Sign
					in</a> to access the Admin Portal.
			</p>
		</c:when>
		<c:otherwise>         
      		
			<%
				List<Entity> chapters = Chapter.getAllChapters();	
			    out.println(chapters);
			%>
	<div id="header-admin">
		<div id="headerAdminLeft">

			<ul id="header-tabs" class="home-admin">
				<li id="resources-link"><a href="/adminuser"
					onClick="return loadLast(\'resources\')"> <span class="en"
						style="display: inline">Manage Users</span>
				</a></li>
				<li id="home-link"><a href="/adminchapter"
					onClick="return loadLast(\'resources\')"> <span class="en"
						style="display: inline">Manage Chapters</span>
				</a></li>

			</ul>
		</div>
	</div>
	<!-- header -->

	<div id="mainBodyFixed">
    <div id="mainBodyLeft">
            <form action="/updatechapter" type="post">
				<table>
					<tr>
						<th>Chapter Name</th>

						<th>Current Status</th>
						<th>New Status</th>
						<th>Organizer</th>
						<th>Co Organizer One</th>
						<th>Co Organizer Two</th>
						<th>External Website</th>
					</tr>
					<%
						if (chapters != null) {
									for (Entity result : chapters) {
										Key key = result.getKey();

										Key cityKey = (Key) result.getProperty("city");
										Entity entity = City.getCity(cityKey);
										String city = (String) entity.getProperty("name");
										String status = (String) result
												.getProperty("status");
										String active =  Chapter.ACTIVE;
					%>
					<tr>
						<td>ADG <%=city%></td>
						<td><%=status%></td>
						<td>
						    
						    <select name="newstatus" id="newstatus">
						         <option value="<%=Chapter.NOT_STARTED%>"><%=Chapter.NOT_STARTED%></option>
						        <option value="<%=Chapter.ACTIVE%>"><%=Chapter.ACTIVE%></option>
						        <option value="<%=Chapter.INACTIVE%>"><%=Chapter.INACTIVE%></option>
						        <option value="<%=Chapter.DELISTED%>"><%=Chapter.DELISTED%></option>
						    </select>
						</td>
						<td><input type="text" name =<%=Chapter.ORGANIZER %>/>
						<td><input type="text" name =<%=Chapter.CO_ORGANIZER_1 %>/>
						<td><input type="text" name =<%=Chapter.CO_ORGANIZER_2 %>/>
						<td><input type="text" name =<%=Chapter.EXT_WEBSITE %>/>
						<td><input type="submit" value="Update"/></td>
					</tr>
					<%
						}
					}
					%>
					
				</table>
           

    </div><!-- end mainBodyLeft -->

    <div id="mainBodyRight">
    </div>
	</div>
	</c:otherwise>
	</c:choose>
	<div id="footer">
  <div id="copyright">  
  Except as noted, this content is 
  licensed under <a href="http://creativecommons.org/licenses/by/2.5/">
  Creative Commons Attribution 2.5</a>. For details and 
  restrictions, see the <a href="/license.html">Content 
  License</a>.
</div>

  <div id="footerlinks">
    
</div>

</div> <!-- end footer -->

</div><!-- end doc-content -->

</div> <!-- end body-content --> 

</body>
</html>
