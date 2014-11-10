<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">
<title>Edit User</title>
</head>
<body>
	<center>
		<div style="color: teal; font-size: 30px; padding: 0px 0px 10px;">Edit
			User</div>
		<c:url var="editAction" value="update" />
		<div class="box">
			<form:form commandName="user" method="post" action="update">
				<table width="400px" height="150px">
					<tr>
						<td colspan="2"><form:hidden path="id" value="${user.id}"></form:hidden></td>
					</tr>
					<tr>
						<td><form:label path="name">Name</form:label></td>
						<td><form:input path="name" value="${user.name}" /></td>
					</tr>
					<tr>
						<td><form:label path="email">Email</form:label></td>
						<td><form:input path="email" value="${user.email}" /></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;"><input
							type="submit" value="Update"
							onclick="$('#addPopup').dialog('close')" class="btn-teal" /></td>
					</tr>
				</table>
			</form:form>
		</div>
	</center>
</body>
</html>