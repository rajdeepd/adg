<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.android.adg.AdminUser"%>
<%@ page import="com.android.adg.Chapter"%>
<%@ page import="com.android.adg.City"%>
<%@ page import="com.google.appengine.api.datastore.Entity"%>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
Entity entity = AdminUser.getUser("rajdeep.dua@gmail.com");
if (entity == null) {
	AdminUser.createOrUpdateUser("rajdeep.dua@gmail.com",
			AdminUser.SITEADMIN);
}
List<Entity> chapters = Chapter.getAllChapters();
if(chapters.size()  == 0) {
	List cities = City.getAllCities();
	if(cities.size() == 0){
		
	}
	for(int i = 0; i < cities.size(); i++) {
		Entity city = (Entity)cities.get(i);
		String name = (String)city.getProperty("name");
		Chapter.createChapter(name, name, Chapter.NOT_STARTED);
		Entity ent = Chapter.getChapter(name);
		out.println(ent);
	}
	List<Entity> chapters2 = Chapter.getAllChapters();	
}
%>

<div id="header">
      <div id="headerLeft">
    <a href="/home.html" tabindex="-1"><img src="/assets/images/bg_logo_adg.png" alt="Android Developer Group" /></a>
    <ul id="header-tabs" class="home">
        <li id="resources-link"><a href="/home" onClick="return loadLast(\'resources\')">
            <span class="en" style="display:inline">Home</span>
            </a>
        </li>
        <li id="resources-link"><a href="/active-chapters" onClick="return loadLast(\'resources\')">
            <span class="en" style="display:inline">Chapters</span>
        </a>
        </li>
        <li id="resources-link"><a href="/newchapter" onClick="return loadLast(\'resources\')">
            <span class="en" style="display:inline">New Chapter</span>
        </a>
        </li>
        <li id="resources-link"><a href="/faq" onClick="return loadLast(\'resources\')">
            <span class="en">FAQ</span>
        </a>
        </li>
         <li id="home-link"><a href="/admin" onClick="return loadLast(\'resources\')">
            <span class="en">Admin</span>
        </a>
        </li>
    </ul>
</div>
	<div id="headerRight">
		<div id="headerLinks">
			<img src="/assets/images/icon_world.jpg" alt="Language:" /> <span
				id="language"> <select name="language"
				onChange="changeLangPref(this.value, true)">
					<option value="en">English&nbsp;&nbsp;&nbsp;</option>
			</select>
			</span>
			<%
				UserService userService = UserServiceFactory.getUserService();
				User user = userService.getCurrentUser();

				if (user != null) {
			%>
			<%=user.getNickname()%>
			<a href="<%=userService.createLogoutURL(request.getRequestURI())%>">sign out</a>
			<%
				}
			%>
			
			<jsp:useBean id="adminuserbean" class="com.android.adg.AdminUserBean">
				<jsp:setProperty name="adminuserbean" property="*" />
		
			</jsp:useBean>
			Role : <c:out value="${adminuserbean.type }" />
		</div>
	</div>

</div><!-- header -->