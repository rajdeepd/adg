package com.android.adg;

import java.util.List;

import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.Query;


public class Chapter {
	public static String CHAPTER = "Chapter";
	public static String ACTIVE = "Active";
	public static String INACTIVE = "Inactive";
	public static String NOT_STARTED = "Not Started";
	public static String DELISTED = "Delisted";
	public static String ORGANIZER = "organizer";
	public static String CO_ORGANIZER_1 = "co_organizer_1";
	public static String CO_ORGANIZER_2 = "co_organizer_2";
	public static String CO_ORGANIZER_3 = "co_organizer_3";
	public static String EXT_WEBSITE = "external_website";
	
	public static void createChapter(String chName, String cityName, String status) {
		Entity chapter = getChapter(chName);
		if (chapter == null) {
			chapter = new Entity(CHAPTER, chName);
			chapter.setProperty("city", City.getCity(cityName).getKey());
			chapter.setProperty("status",status);
			
			Util.persistEntity(chapter);
		} else {
			throw new RuntimeException("Chapter already exists");
		}
	}

	public static Iterable<Entity> getAllChapters(String kind) {
		return Util.listEntities(kind, null, null);
	}

	public static Entity getChapter(String chName) {
		if(chName !=null){
		Key key = KeyFactory.createKey(CHAPTER,chName);
		return Util.findEntity(key);
		}else{
			return null;
		}
	}

	public static String deleteChapter(String chName){
		Key key = KeyFactory.createKey(CHAPTER,chName);	   
		Util.deleteEntity(key);
		return "Chapter deleted";
	}
	
	public static void changeStatus(String chName, String status){
		Entity chapter = getChapter(chName);
		chapter.setProperty("status", status);
		Util.persistEntity(chapter);
	}
	
	public static void updateProperty(String chName, String propertyName, String value){
		Entity chapter = getChapter(chName);
		chapter.setProperty(propertyName, value);
		Util.persistEntity(chapter);
	}
	
	public static List<Entity> getAllChapters() {
		return Util.getAllEntities(CHAPTER);
	}
}
