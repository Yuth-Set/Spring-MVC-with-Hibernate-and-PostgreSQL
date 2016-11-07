<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Home -Phone</title>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<style type="text/css">
    .jumbotron{
    	margin-top: 15px;
    }
</style>
</head>
<body>
<div class="container">
	<div class="row">
    	<div class="col-xs-12">
        	<div class="jumbotron">
                <h1>Welcome to Phone-Store</h1>
            	<p>In today's world internet is the most popular way of connecting with the people</p>
            	<p><a href="${pageContext.request.contextPath}/phones" class="btn btn-primary btn-lg">Click here to see Phone list</a></p>
            </div>
        </div>
    </div>
</div>
</body>
</html>