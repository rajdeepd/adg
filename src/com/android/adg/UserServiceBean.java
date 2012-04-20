package com.android.adg;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;


public class UserServiceBean {
	User user;
	
	boolean checked = false;
	String email = "NOT_SET";
	String type = "NOT_SET";
	
	public String getEmail() {
		if(!checked){
		    UserService userService = UserServiceFactory.getUserService();
		    user = userService.getCurrentUser();
		}
		if(user != null) {
		    this.email = user.getEmail();
		}
		checked = true;
		return email;
	}
	
	public void setEmail(){
		//don't do anything here
	}
	public User getUser(){
		if(!checked){
		   UserService userService = UserServiceFactory.getUserService();
		   user = userService.getCurrentUser();
		}
		return user;
	}
	
}
