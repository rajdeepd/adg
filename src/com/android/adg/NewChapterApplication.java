package com.android.adg;

import java.util.List;

import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.Query;


public class NewChapterApplication {
	public static String APPLICATION = "application";
	public static String CHAPTERNAME = "chapter_name";
	public static String EMAILID = "emaild";
	public static String FNAME = "first_name";
	public static String LNAME = "last_name";
	public static String PROFILE = "profile";
	public static String PROPOSAL = "proposal";
	public static String ACCEPTED = "accepted";
	public static String REJECTED = "accepted";
	public static String IN_PROCESS = "in_process";
	
	
	
	public static void insertApplication(String chName, String emailid, String firstName, 
			String lastName, String profile, String proposal,String time) {
		Entity chapterApplication = getApplication(chName, emailid);
		if (chapterApplication == null) {
			chapterApplication = new Entity(APPLICATION, chName + ":" + emailid);
			chapterApplication.setProperty(CHAPTERNAME, chName);
			chapterApplication.setProperty(EMAILID, emailid);
			chapterApplication.setProperty(FNAME, firstName);
			chapterApplication.setProperty(LNAME, lastName);
			chapterApplication.setProperty(PROFILE, profile);
			chapterApplication.setProperty(PROPOSAL, profile);
			chapterApplication.setProperty("status", IN_PROCESS);
			chapterApplication.setProperty("time", time);
			Util.persistEntity(chapterApplication);
		} else {
			throw new RuntimeException("Chapter Application already exists");
		}
	}

	public static Iterable<Entity> getAllChapters(String kind) {
		return Util.listEntities(kind, null, null);
	}

	public static Entity getApplication(String chName, String emailid) {
		Key key = KeyFactory.createKey(APPLICATION,chName + ":" + emailid);
		return Util.findEntity(key);
	}

	public static String deleteChapter(String chName){
		Key key = KeyFactory.createKey(APPLICATION,chName);	   
		Util.deleteEntity(key);
		return "Chapter deleted";
	}
	
	public static List<Entity> getApplications(String chName) {
		return (List<Entity>) Util.listEntities(APPLICATION,"", chName);
	}
	
	public static void changeStatus(Key key, String value){
		Entity chapterApplication = Util.findEntity(key);
		chapterApplication.setProperty("status", value);
	}
}
