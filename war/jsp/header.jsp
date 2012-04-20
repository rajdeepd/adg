<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<div id="header">
     <div id="headerLeft">
     <%
      response.setHeader("Cache-Control","public");
      %>
     <%
       String pagename = request.getParameter("pagename");
     %>
     <a href="/home" tabindex="-1"><img src="/assets/images/bg_logo_adg.png" alt="Android Developer Group" /></a>
     <ul id="header-tabs" class="home">
       <%if(pagename.equals("home")){ %>
        <li id="home-link"><a href="/home" onClick="return loadLast(\'resources\')">
       <%}else {%>
        <li id="resources-link"><a href="/home" onClick="return loadLast(\'resources\')">
        <%}%>
            <span class="en" style="display:inline">Home</span>
            </a>
        </li>
        <%if(pagename.equals("active-chapters")){ %>
        <li id="home-link"><a href="/active-chapters" onClick="return loadLast(\'resources\')">
        <%}else {%>
        <li id="resources-link"><a href="/active-chapters" onClick="return loadLast(\'resources\')">
        <%}%>
            <span class="en" style="display:inline">Chapters</span>
        </a>
        </li>
        <%if(pagename.equals("newchapter")){ %>
        <li id="home-link"><a href="/newchapter" onClick="return loadLast(\'resources\')">
        <%}else {%>
        <li id="resources-link"><a href="/newchapter" onClick="return loadLast(\'resources\')">
        <%}%>
            <span class="en" style="display:none">New Chapter</span>
        </a>
        </li>
        <%if(pagename.equals("faq")){ %>
        <li id="home-link"><a href="/faq" onClick="return loadLast(\'resources\')">
        <%}else {%>
        <li id="resources-link"><a href="/faq" onClick="return loadLast(\'resources\')">
        <%}%>
            <span class="en">FAQ</span>
        </a>
        </li>
         <%if(pagename.equals("adminuser")){ %>
         <li id="home-link"><a href="/adminuser" onClick="return loadLast(\'resources\')">
         <%}else {%>
          <li id="resources-link"><a href="/adminuser" onClick="return loadLast(\'resources\')">
         <%}%>
            <span class="en">Admin</span>
         
        </a>
        </li>
    </ul>
</div>
<div id="headerRight">
    <div id="headerLinks"><img src="/assets/images/icon_world.jpg" alt="Language:" />
            <span id="language">
                <select name="language" onChange="changeLangPref(this.value, true)">
                    <option value="en">English&nbsp;&nbsp;&nbsp;</option>
                </select>
            </span> 
            <%
				UserService userService = UserServiceFactory.getUserService();
				User user = userService.getCurrentUser();

				if (user != null) {
			%>
			<%=user.getNickname()%>
			<a href="<%=userService.createLogoutURL(request.getRequestURI())%>">sign
				out</a>
			<%
				}
			%>
    </div>
</div>
      <script type="text/javascript">
        <!--  
        changeTabLang(getLangPref());
        //-->
      </script>
 </div><!-- header -->