package com.android.adg;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
 
@Controller
public class MainController {
 
    @RequestMapping("/hello")
    public ModelAndView helloWorld() {
 
        String message = "Hello World, Spring 3.0!";
        return new ModelAndView("hello", "message", message);
    }
    
    @RequestMapping("/home")
    public ModelAndView getHomeView() {
        String message = "";
        return new ModelAndView("home", "message", message);
    }
    @RequestMapping("/active-chapters")
    public ModelAndView getActiveChapters() {
        String message = "";
        return new ModelAndView("active-chapters", "message", message);
    }
    
    @RequestMapping("/faq")
    public ModelAndView getFaqView() {
        String message = "";
        return new ModelAndView("faq", "message", message);
    }
    
    @RequestMapping("/adminuser")
    public ModelAndView getAdminUserView() {
        String message = "";
        return new ModelAndView("adminuser", "message", message);
    }
    
    @RequestMapping("/adminchapter")
    public ModelAndView getAdminChapterView() {
        String message = "";
        return new ModelAndView("adminchapter", "message", message);
    }
    
    @RequestMapping("/newchapter")
    public ModelAndView getNewChapterView() {
        String message = "";
        return new ModelAndView("newchapter", "message", message);
    }
    
    @RequestMapping("/chapter")
    public ModelAndView getChapterView() {
        String message = "";
        return new ModelAndView("chapter", "message", message);
    }
    
    
    @RequestMapping("/newchapterapply")
    public ModelAndView getNewChapterApplyView() {
        String message = "";
        return new ModelAndView("newchapterapply", "message", message);
    }
}
/*<!--     <servlet> -->
<!-- 	 <servlet-name>homejsp</servlet-name> -->
<!-- 	 <jsp-file>/jsp/home.jsp</jsp-file> -->
<!-- 	</servlet> -->
<!-- 	<servlet-mapping> -->
<!-- 	 <servlet-name>homejsp</servlet-name> -->
<!-- 	 <url-pattern>/home</url-pattern> -->
<!-- 	</servlet-mapping> -->
	
<!-- 	<servlet> -->
<!-- 	 <servlet-name>activechapters</servlet-name> -->
<!-- 	 <jsp-file>/jsp/active-chapters.jsp</jsp-file> -->
<!-- 	</servlet> -->
<!-- 	<servlet-mapping> -->
<!-- 	 <servlet-name>activechapters</servlet-name> -->
<!-- 	 <url-pattern>/activechapters</url-pattern> -->
<!-- 	</servlet-mapping> -->
	
<!-- 	<servlet> -->
<!-- 	 <servlet-name>faq</servlet-name> -->
<!-- 	 <jsp-file>/jsp/faq.jsp</jsp-file> -->
<!-- 	</servlet> -->
<!-- 	<servlet-mapping> -->
<!-- 	 <servlet-name>faq</servlet-name> -->
<!-- 	 <url-pattern>/faq</url-pattern> -->
<!-- 	</servlet-mapping> -->
	
<!-- 	<servlet> -->
<!-- 	 <servlet-name>newchapter</servlet-name> -->
<!-- 	 <jsp-file>/jsp/newchapter.jsp</jsp-file> -->
<!-- 	</servlet> -->
<!-- 	<servlet-mapping> -->
<!-- 	 <servlet-name>newchapter</servlet-name> -->
<!-- 	 <url-pattern>/newchapter</url-pattern> -->
<!-- 	</servlet-mapping> -->
	
	
<!-- 	<servlet> -->
<!-- 	 <servlet-name>admin</servlet-name> -->
<!-- 	 <jsp-file>/jsp/adminuser.jsp</jsp-file> -->
<!-- 	</servlet> -->
<!-- 	<servlet-mapping> -->
<!-- 	 <servlet-name>admin</servlet-name> -->
<!-- 	 <url-pattern>/admin</url-pattern> -->
<!-- 	</servlet-mapping> -->
	
<!-- 	<servlet> -->
<!-- 	 <servlet-name>adminchapter</servlet-name> -->
<!-- 	 <jsp-file>/jsp/adminchapter.jsp</jsp-file> -->
<!-- 	</servlet> -->
<!-- 	<servlet-mapping> -->
<!-- 	 <servlet-name>adminchapter</servlet-name> -->
<!-- 	 <url-pattern>/adminchapter</url-pattern> -->
<!-- 	</servlet-mapping> -->
	
<!-- 	<servlet> -->
<!-- 	 <servlet-name>chapter</servlet-name> -->
<!-- 	 <jsp-file>/jsp/chapter.jsp</jsp-file> -->
<!-- 	</servlet> -->
<!-- 	<servlet-mapping> -->
<!-- 	 <servlet-name>chapter</servlet-name> -->
<!-- 	 <url-pattern>/chapter</url-pattern> -->
<!-- 	</servlet-mapping> -->
	*/