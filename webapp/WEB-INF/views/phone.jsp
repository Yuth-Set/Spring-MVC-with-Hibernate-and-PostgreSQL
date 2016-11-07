<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<% 
	String keyword = request.getParameter("key");
	if (keyword == "null" || keyword == null) {
		keyword = "";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Phone -Home</title>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
</head>
<body>
<div class="container">
<h3>
    <a href="${pageContext.request.contextPath}/" style="text-decoration: none;">PHONE-STORE</a>
</h3>
<hr>
	<div class="row">
		<div class="col-sm-12 col-md-12">
			<form role="search" action="${pageContext.request.contextPath}/search">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="Enter keywork here..." name="key" value="<%= keyword %>">

					<div class="input-group-btn">
						<button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<br>
	<c:url var="addAction" value="/phone/add" ></c:url>
    <div class="row">
        <div class="col-sm-12 col-md-12">
        	<div class="panel panel-default">
	            <div class="panel-body">
	                <div class="row">
	                	<div class="col-sm-12 col-md-12">
	                		<form:form action="${addAction}" commandName="phone" class="form">
								    <c:if test="${!empty phone.name}">
								    	<div class="form-group">
								    		<form:label path="id">
				                            	<spring:message text="ID:"/>
				                            </form:label>
				                            <form:input path="id" class="form-control" readonly="true" size="8"  disabled="true" />
				                            <form:hidden path="id" />
				                        </div>
								    </c:if>
								    <div class="form-group">
			                            <form:label path="name">
			                            	<spring:message text="Name:"/>
			                            </form:label>
			                            <form:input path="name" class="form-control" required="true" />
			                        </div>
								   <div class="form-group">
								   		<form:label path="review">
			                            	<spring:message text="Review:"/>
			                            </form:label>
			                            <form:input path="review" class="form-control" required="true" />
			                        </div>
						            <c:if test="${!empty phone.name}">
						            	<div class="form-group">
						            		<input type="submit" class="btn btn-primary" value="<spring:message text="Update Phone"/>" />		                        	                   	                        
				                            <a href="<c:url value='/phones' />"  class="btn btn-info">Back</a>		                   
				                        </div>
						            </c:if>
						            <c:if test="${empty phone.name}">
						            	<div class="form-group">		                        
				                            <input type="submit" class="btn btn-primary" value="<spring:message text="Add Phone"/>" />		                   
				                        </div>
						            </c:if>  
								</form:form>
	                	</div>
	                </div>
	            </div>
	       </div>
	   </div>
	</div>
	<table class="table table-bordered">
		<tr>
			<th class="text-center" width="5%">ID</th>
			<th class="text-center" width="40%">Name</th>
			<th class="text-center" width="40%">Review</th>
			<th class="text-center" width="15%">Action</th>
		</tr>
		<c:forEach items="${listPhones}" var="phone">
	        <tr>
	            <td>${phone.id}</td>
	            <td>${phone.name}</td>
	            <td>${phone.review}</td>
	            <td class="text-center">
					<a href="<c:url value='/edit/${phone.id}' />"  class="btn btn-sm btn-primary">Update</a>
            		<a href="<c:url value='/remove/${phone.id}' />"  class="btn btn-sm btn-danger">Delete</a>
				</td>
	        </tr>
	    </c:forEach>
	</table>
</div>
</body>
</html>