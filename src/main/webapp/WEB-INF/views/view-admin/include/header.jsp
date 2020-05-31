<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
	
<style>
#nav-bar-handle {
	background-color: #2F4F4F;
}
</style>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" id="nav-bar-handle">
			<div class="navbar-header">
				<a class="navbar-brand" href="#" style="color:white;font-size:20px;"><i class="fa fa-university fa-fw" style="margin-right:10px;"></i>BANKING</a>
			</div>

			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>

			<!-- Top Navigation: Left Menu -->
			<!-- <ul class="nav navbar-nav navbar-left navbar-top-links">
				<li><a href="#"><i class="fa fa-home fa-fw"></i> Website</a></li>
			</ul> -->

			<!-- Top Navigation: Right Menu -->
			<%-- <ul class="nav navbar-right navbar-top-links">
				<li class="dropdown navbar-inverse"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-bell fa-fw"></i>
						<b class="caret"></b>
				</a>
					<ul class="dropdown-menu dropdown-alerts">
						<li><a href="#">
								<div>
									<i class="fa fa-comment fa-fw"></i> New Comment <span
										class="pull-right text-muted small">4 minutes ago</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a class="text-center" href="#"> <strong>See
									All Alerts</strong> <i class="fa fa-angle-right"></i>
						</a></li>
					</ul></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
						Menu <b class="caret"></b>
				</a>
					<ul class="dropdown-menu dropdown-user">
							<security:authorize access="isAuthenticated()">
								<security:authentication property="principal" var="user" />
								<p align="center">Username : ${user.username} </p>
								<a href="<c:url value='/dang-xuat' />"><i
									class="fa fa-sign-out fa-fw"></i> Logout</a>
							</security:authorize>
					</ul></li>
			</ul> --%>

		</nav>