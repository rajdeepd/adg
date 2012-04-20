<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@ page
	import="com.google.appengine.api.datastore.DatastoreServiceFactory"%>
<%@ page import="com.google.appengine.api.datastore.DatastoreService"%>
<%@ page import="com.google.appengine.api.datastore.Query"%>
<%@ page import="com.google.appengine.api.datastore.Entity"%>
<%@ page import="com.google.appengine.api.datastore.FetchOptions"%>
<%@ page import="com.google.appengine.api.datastore.Key"%>
<%@ page import="com.google.appengine.api.datastore.KeyFactory"%>
<%@ page import="com.android.adg.AdminUser"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<%@include file='head.html'%>
<body class="gc-documentation">
	<jsp:include page="/jsp/headeradmin.jsp" />
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

			<c:choose>
				<c:when test="${ (adminuserbean.type eq 'TYPE_NOT_DEFINED') or 
				                 (adminuserbean.type eq 'ChapterAdmin') }">
					<p style="margin: 20px">You don't have access to the SiteAdmin
						Portal</p>
				</c:when>
				<c:otherwise>

					<div id="header-admin">
						<div id="headerAdminLeft">

							<ul id="header-tabs" class="home-admin">
								<li id="home-link"><a href="/admin"
									onClick="return loadLast(\'resources\')"> <span class="en"
										style="display: inline">Manage Users</span>
								</a></li>
								<li id="resources-link"><a href="/adminchapter"
									onClick="return loadLast(\'resources\')"> <span class="en"
										style="display: inline">Manage Chapters</span>
								</a></li>

							</ul>
						</div>
					</div>
					<!-- header -->

					<div id="mainBodyFixed">
						<div id="mainBodyLeft">
							<!-- <p>Error:<c:out value="${param.error }" /></p>
							<p>Deleted:<c:out value="${param.deleted }" /></p> -->
							<c:set var="error" value="${param.error }" />
							<c:set var="deleted" value="${param.deleted }" />
							<c:set var="nu" value="${param.no}" />
							<c:choose>

								<c:when test="${not empty error }">
									<h4>Error</h4>
									<p><c:out value="${param.error }" />
									</p>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${not empty deleted }">
											<c:if test="${not empty nu }">
												<h4>
													Deleted <c:out value="${param.no}" /> Users
												</h4>
												<c:forEach var="i" begin="1" end="${nu}">
													<c:set var="u" value="user${i}" />
													<c:out value="${param[u]}" />
													<br />
												</c:forEach>
											</c:if>
										</c:when>
										<c:otherwise>
											<%
											    Iterable<Entity> adminUsers = AdminUser.getAllUsers("User");
									        %>
											<h3>List of White listed Admin Users</h3>
											<form action="/updateuser" type="post">
												<table>
													<tr>
														<th>Email Id</th>
														<th>Type</th>
														<th>Delete</th>
													</tr>
													<%
												        for (Entity result : adminUsers) { //for 1 begin
															Key key = result.getKey();
															String email = (String) result.getProperty("email");
															String type = (String)result.getProperty("type");
											        %>
													<tr>
														<td><%=email%></td>
														<td><%=type %></td>
														<td><input name="<%=email%>" type="checkbox" /></td>
													</tr>
													<%
												         } //for 1 close
											        %>
												</table>
												<input type="submit" colspan="3" / value="submit">
												<td></td>
											</form>
											<h3>Add an Admin User</h3>
											<form action="/adduser" type="post">
												<p>
												    <table>
												    <tr>
													<td>Email Id</td><td><input type="text" name="emailid" /></td>
													</tr>
													<tr><td>Type</td>
													    <td>
													    <select name="type" >
													    <c:forEach items="${adminuserbean.userType}" var="current">
													        <option value="${current}">${current}</option>
													     </c:forEach>
													    </select>
													</table>	
												</p>
												<input type="submit" value="submit" />
											</form>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</c:otherwise>
			</c:choose>

		</c:otherwise>
	</c:choose>
	<div></div>
	<!-- end mainBodyLeft -->

	<div id="mainBodyRight"></div>
	<div></div>

	<div id="footer">
		<div id="copyright">
			Except as noted, this content is licensed under <a
				href="http://creativecommons.org/licenses/by/2.5/"> Creative
				Commons Attribution 2.5</a>. For details and restrictions, see the <a
				href="/license.html">Content License</a>.
		</div>

		<div id="footerlinks"></div>

	</div>
	<!-- end footer -->

	<div></div>
	<!-- end doc-content -->

	<div></div>
	<!-- end body-content -->

</body>
</html>
