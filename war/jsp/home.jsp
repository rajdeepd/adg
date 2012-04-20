<!DOCTYPE html>
<html>
     <%
      response.setHeader("Cache-Control","public");
      %>
<%@include file='head.html'%>
<body class="gc-documentation">
    <%! String pagename="home";
    %>
	<jsp:include page="/jsp/header.jsp">
	    <jsp:param name="pagename" value="home" />
	</jsp:include>
	<div id="mainBodyFixed">
		<div id="mainBodyLeft">

			<h1>What is an ADG ?</h1>

			<p>Android Developer Groups (ADG) are developer groups for
				developers who are interested in Android Platform. These groups are
				run by Professional Android Developers with assistance from Android
				Developer Relations team at Google. The aim of these groups are to
				provide developers a platform to interact with experts in the field
				and get to learn latest developments about the Platform</p>

			<p>An ADG can take many forms — from just a few android
				developers getting together to watch our latest video, to large
				gatherings with demos and lectures, to events like code sprints and
				hackathons.</p>

			<p>This initiative is currently being rolled out "only" in India</p>

		</div>
		<!-- end mainBodyLeft -->

		<div id="mainBodyRight"></div>
	</div>
	<%@include file='footer.html'%>

	</div>
	<!-- end doc-content -->

	</div>
	<!-- end body-content -->

</body>
</html>



