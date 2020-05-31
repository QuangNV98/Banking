<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
#side-menu {
	font-size: 17px;
	color: black;
}

* {
  font-family: "Times New Roman", Times, serif;
}
</style>

<div class="navbar-default sidebar" role="navigation">
	<div class="sidebar-nav navbar-collapse">

		<ul class="nav" id="side-menu">
			
			<c:url value="/dashboard" var="dashboard"></c:url>
			<li><a href="${dashboard}" class="active"><i
					class="fa fa-home fa-fw"></i> HOME</a></li>
			<c:url value="/admin/list-user" var="user"></c:url>
			<li><a href="${user}" class="active"><i
					class="fa fa-user fa-fw"></i> USER</a></li>
			<c:url value="/admin/list-rate" var="rate"></c:url>
			<li><a href="${rate}" class="active"><i
					class="fa fa-credit-card-alt fa-fw"></i> INTERESRT RATE</a></li>
			<c:url value="/admin/list-saving" var="saving"></c:url>
			<li><a href="${saving}" class="active"><i
					class="fa fa-cloud fa-fw"></i> SAVING</a></li>
					
		</ul>

	</div>
</div>