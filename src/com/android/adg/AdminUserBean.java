package com.android.adg;

import java.util.LinkedList;
import java.util.List;

import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;


public class AdminUserBean {
	Entity userEntity;
	String type = "TYPE_NOT_SET";
	List adminUsers;
	List userType;
	boolean mUserTypeSet = false;
	boolean mSet = false;
	
	public void setUserEntity(){
		
	}
	
	public Entity getUserEntity() {
		return userEntity;
	}
	
	public String getType() {
		if(!mSet){
			UserService userService = UserServiceFactory.getUserService();
			User user = userService.getCurrentUser();
			if( user != null) {
				this.userEntity = AdminUser.getUser(user.getEmail());
				if(userEntity != null) {
					this.type = (String) userEntity.getProperty(AdminUser.TYPE);
					mSet  =true;
				}else {
					type = "TYPE_NOT_DEFINED";
				}
			}
		}
		return type;
	}
	
	public List getAdminUsers() {
		 Iterable<Entity> adminUsers = AdminUser.getAllUsers("User");
		 List list = new LinkedList();
		 for (Entity result : adminUsers) {
			 list.add(result);
		 }
		 return list;
	}
	
	public List getUserType() {
		if(!mUserTypeSet) {
			userType = new LinkedList();
			userType.add(AdminUser.CHAPTERADMIN);
			userType.add(AdminUser.SITEADMIN);
			mUserTypeSet = true;
		}
		return userType;
	}
}
