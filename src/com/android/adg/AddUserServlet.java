package com.android.adg;
import java.io.IOException;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.http.*;

import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
public class AddUserServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
              throws IOException {
        UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();
        String contextPath = req.getContextPath();
        if (user != null) {
            
        	String emailid = req.getParameter("emailid");
        	String type = req.getParameter("type");
        	if(emailid == null){
        		resp.sendRedirect("/adminuser?error=Email id is null");
        	}
        	Entity entity = AdminUser.getUser(emailid);
        	if(entity == null) {
        		AdminUser.createOrUpdateUser(emailid, type);
            	resp.sendRedirect("/adminuser");
        	}else {
        		resp.sendRedirect("/adminuser?error=User Already Exists");
        	}
        	
        } else {
            resp.sendRedirect(userService.createLoginURL(req.getRequestURI()));
        }
    }
}