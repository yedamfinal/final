<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<style>
    .top{
        height: 200px;
    }
    .mid{
        height: 50px;
    	background-color: rgba(128, 128, 128, 0.26);
    }
    .bottom{
        height: 400px;
    }
    .center{
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .mon{
        width: 80px;
        height: 80px;
    }
    .card-group{
        width: 90%;
    }
    .mid2{
    	height: 80px;
    }
    
    
</style>
</head>
<body>
${pay[0] }<br>
${pay[1] }<br>
${pay[2] }

<c:set var="total" value="0" />
<c:forEach var="i" items="${pay }" >
    <c:set var="total" value="${total + i.cost}" /> 
    <c:set var="total" value="${total + i.delayTax}" /> 
</c:forEach>

${total }
</body>

</html>