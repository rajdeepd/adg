package com.android.adg;

import java.util.List;

import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.Query;


public class City {
	public static String CITY = "City";
	
	public static void createCity(String cityName) {
		Entity city = getCity(cityName);
		if (city == null) {
			city = new Entity(CITY, cityName);
			city.setProperty("name", cityName);
			city.setProperty("status","Open");
			Util.persistEntity(city);
		} else {
			throw new RuntimeException("City already exists");
		}
	}

	public static Iterable<Entity> getAllUsers(String kind) {
		return Util.listEntities(kind, null, null);
	}

	public static Entity getCity(String cityName) {
		Key key = KeyFactory.createKey(CITY,cityName);
		return Util.findEntity(key);
	}
	
	public static Entity getCity(Key key) {
		return Util.findEntity(key);
	}

	public static String deleteUser(String cityName){
		Key key = KeyFactory.createKey(CITY,cityName);	   
		Util.deleteEntity(key);
		return "City deleted";
	}
	
	public static List<Entity> getAllCities() {
		return Util.getAllEntities(CITY);
	}
	
	public static void init() {
		createCity("New Delhi");
		createCity("Mumbai");
		createCity("Bengaluru");
		createCity("Hyderabad");
		createCity("Pune");
		createCity("Chennai");
	}
}
