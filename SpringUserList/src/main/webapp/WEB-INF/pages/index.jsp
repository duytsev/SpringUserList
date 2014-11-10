<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/jquery-ui.min.css" />"
	rel="stylesheet">
<script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>
<script src="<c:url value="/resources/js/jquery-ui.min.js" />"></script>
<title>User List</title>
<script>
	$(function() {
		$("#addPopup").dialog({
			autoOpen : false,
			draggable : false,
			modal : true,
			resizable : false,
			dialogClass : "dlg-teal",
			width : 430,
			position: { my: "center", at: "center", of: window }
		});
	});
</script>
</head>
<body>
	<center>

		<div style="color: teal; font-size: 30px; padding: 0px 0px 10px;">User
			List</div>

		<div id="addPopup" title="Add new user" class="dlg-teal">
			<c:url var="addAction" value="register" />
			<form:form commandName="user" method="post" action="register">
				<table width="400px" height="150px">
					<tr>
						<td><form:label path="name">Name</form:label></td>
						<td><form:input path="name" /></td>
					</tr>
					<tr>
						<td><form:label path="email">Email</form:label></td>
						<td><form:input path="email" /></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="Register"
							onclick="$('#addPopup').dialog('close')" class="btn-teal" /></td>
					</tr>
				</table>
			</form:form>
		</div>

		<c:if test="${!empty userList}">
			<table border="0.5" bgcolor="black" width="600px">
				<tr
					style="background-color: #993333; color: white; text-align: center;"
					height="40px">

					<th>ID</th>
					<th>Name</th>
					<th>Email</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
				<c:forEach items="${userList}" var="user">
					<tr
						style="background-color: white; color: black; text-align: center;"
						height="30px">
						<td><c:out value="${user.id}" /></td>
						<td><c:out value="${user.name}" /></td>
						<td><c:out value="${user.email}" /></td>
						<td><a href="edit?id=${user.id}"
							onclick="$('#editPopup').dialog('open')" class="link">Edit</a></td>
						<td><a href="delete?id=${user.id}" class="link">Delete</a></td>
					</tr>
				</c:forEach>
			</table>
		</c:if>

		<table>
			<tr>
				<td><input type="submit" value="Add" class="btn-teal"
					onclick="$('#addPopup').dialog('open')" /></td>

				<td><c:url var="logoutUrl" value="/j_spring_security_logout" />
					<form action="${logoutUrl}" method="post">
						<input class="btn-teal" type="submit" value="Logout" /> <input
							type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
					</form></td>
			</tr>
		</table>

	</center>
</body>
</html>



