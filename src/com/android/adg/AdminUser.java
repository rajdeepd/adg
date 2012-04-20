package com.android.adg;

import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.Query;
import java.util.List;

/**
 * This class handles all the CRUD operations related to
 * Product entity.
 *
 */
public class AdminUser {
	public static String SITEADMIN = "SiteAdmin";
	public static String CHAPTERADMIN = "ChapterAdmin";
	public static String TYPE = "type";
  public static void createOrUpdateUser(String email, String type) {
    Entity user = getUser(email);
  	if (user == null) {
  	  user = new Entity("User", email);
  	  user.setProperty("email", email);
  	  //type -- SiterAdmin or ChapterAdmin
  	  user.setProperty("type", type);
  	} else {
  	  user.setProperty("email", email);
  	}
  	Util.persistEntity(user);
  }

  public static Iterable<Entity> getAllUsers(String kind) {
    return Util.listEntities(kind, null, null);
  }

  public static Entity getUser(String emailid) {
  	Key key = KeyFactory.createKey("User",emailid);
  	return Util.findEntity(key);
  }

  public static String deleteUser(String email){
	  Key key = KeyFactory.createKey("User",email);	   
	  Util.deleteEntity(key);
	  return "User deleted successfully";
  }
}
