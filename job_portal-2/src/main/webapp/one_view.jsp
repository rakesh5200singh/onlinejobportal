<%@page import="com.dao.JobDAo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.jobs"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>User: Signle Jobs</title>
<%@include file="all_component/all_css.jsp"%>

</head>

<body style="background-color: #f0f1f2;">

	<c:if test="${empty userobj }">

		<c:redirect url="login.jsp" />

	</c:if>

	<%@include file="all_component/navbar.jsp"%>

	<div class="container">
		<div class="row">

			<div class="col-md-12">

				<%
				int id = Integer.parseInt(request.getParameter("id"));
				JobDAo dao = new JobDAo(DBConnect.getConn());
				jobs j = dao.getJobById(id);
				%>
				<div class="card mt-5">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-2x"></i>
						</div>
						<h6><%=j.getTitle()%></h6>
						<p><%=j.getDescription()%>.
						</p>
						<br>
						<div class="form-row">
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Location: <%=j.getLocation()%>"  readonly>
							</div>
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Category: <%=j.getCategory()%>" readonly>
							</div>
						</div>
						<h6>
							Publish Date:
							<%=j.getPdate().toString()%></h6>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
