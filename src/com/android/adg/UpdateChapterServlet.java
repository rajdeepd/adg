package com.android.adg;
import java.io.IOException;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
public class UpdateChapterServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
              throws IOException {
        UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();
        int n = 0;
        StringBuffer sb = new StringBuffer();
        if (user != null) {
        	Enumeration en = req.getParameterNames();
        	while(en.hasMoreElements()){
        		String emailid = (String) en.nextElement();
        		AdminUser.deleteUser(emailid);
        		++n;
        		sb.append("&user" + n + "=" + emailid);
        	}	
        	
        } else {
            resp.sendRedirect(userService.createLoginURL(req.getRequestURI()));
        }
        resp.sendRedirect("/adminuser?deleted=yes&no=" + n + sb.toString());
    }
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		 UserService userService = UserServiceFactory.getUserService();
	        User user = userService.getCurrentUser();

	        if (user != null) {
	        	Map map = req.getParameterMap();
	        	
	        	String emailid = req.getParameter("emailid");
	        	
	        } else {
	            resp.sendRedirect(userService.createLoginURL(req.getRequestURI()));
	        }
	}

	
}