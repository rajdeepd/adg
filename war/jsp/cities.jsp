<%@ page import="com.android.adg.City" %>
<%@ page import="java.util.List" %>
<%
	if (request.getSession().getAttribute("citylist") == null) {
		List listOfCities = City.getAllCities();
		int count = listOfCities.size();
		if (count == 0) {
			City.init();
		}
		listOfCities = City.getAllCities();
		request.getSession().setAttribute("citylist", listOfCities);
	}
%>
