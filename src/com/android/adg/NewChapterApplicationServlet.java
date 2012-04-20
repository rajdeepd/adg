package com.android.adg;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.http.*;

import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
public class NewChapterApplicationServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
              throws IOException {
        UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();
        if (user != null) {
        	String firstName = req.getParameter("fname");
        	String lastName = req.getParameter("lname");
        	String city = req.getParameter("city");
        	String emailid = req.getParameter("emailid");
        	String profile = "Profile";
        	String proposal = "Proposal";
        	//long time  =  System.currentTimeMillis();
        	Date date = new Date();
 
        	SimpleDateFormat sdf; 
        
        	sdf = new SimpleDateFormat("dd MMM yyyy hh:mm:ss zzz"); 
        	String time = sdf.format(date); 
        	if(emailid == null || city == null){
        		resp.sendRedirect("/newchapterapply?error=Email id is null");
        	}
        	Entity entity = NewChapterApplication.getApplication(city, emailid);
        	if(entity == null) {
        		NewChapterApplication.insertApplication(city, emailid, firstName, lastName, profile, proposal, time);
            	resp.sendRedirect("/newchapterapply?result=Submitted&email=" + emailid + "&city=" + city + "&time=" + time);
        	}else {
        		resp.sendRedirect("/newchapterapply?result= already submitted by the the user" + emailid);
        	}
        } else {
            resp.sendRedirect(userService.createLoginURL(req.getRequestURI()));
        }
    }
}