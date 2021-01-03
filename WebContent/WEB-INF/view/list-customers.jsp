<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>IYoYoe</title>
<link type="text/css"
	rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css"/>
</head>
<body>
<h1>Hello World ! Controlelr work</h1>
<div id="wrapper">
	<div id="header">
		<h2>CRM - CUstomer Relationship Manager</h2>
	</div>
</div>
	
<div id="container">
		<div id="content">
		<!-- Add the button to add customer -->
		<input type="button" value="Add Customer" onclick="window.location.href='showFormForAdd';return false;"
		class="add-button"/>
		<!--  add our html table here -->
			<table>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Action</th>
				</tr>
				<!--  loop over the cutomers from the model -->
				<c:forEach var="tempCustomer" items="${customers }">
					<!--  Note how he made the params url here -->
					<c:url var="updateLink" value="/customer/showFormForUpdate">
						<c:param name="customerId" value="${tempCustomer.id }"/>
					</c:url>
					<c:url var="deleteLink" value="/customer/delete">
						<c:param name="customerId" value="${tempCustomer.id }"/>
					</c:url>
					<tr>
						<td>${tempCustomer.firstName}</td>
						<td>${tempCustomer.lastName}</td>
						<td>${tempCustomer.email}</td>
						<td>
						<!-- If crash, change into a link -->
						<!--<a href="${updateLink }">Update</a>   -->
						<input type="button" value="Update" onclick="window.location.href='${updateLink}';return false;"
		class="add-button"/>  
						<input type="button" value="Delete" onclick="window.location.href='${deleteLink}';return false;"
		class="add-button"/> 
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
</div>
</body>
</html>