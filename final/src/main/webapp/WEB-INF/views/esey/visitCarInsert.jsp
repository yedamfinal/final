<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form>
  <fieldset >
    <legend>방문자 차량등록</legend>
    <div class="form-group row">
      <label for="staticEmail" class="">동</label>
        <input type="text" class="form-control-plaintext" id="staticEmail" placeholder="Ex)101">
      </div>
      <div>
    <label for="staticEmail" class="">호수</label>
        <input type="text" class="form-control-plaintext" id="staticEmail" placeholder="Ex)1015">
      </div> 
   
    <div class="form-group">
      <label for="exampleInputEmail1">차량번호</label>
      <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Ex)24거 2567">
      <small id="emailHelp" class="form-text text-muted">차량번호를 정확히 등록하세요 ! </small>
    </div>
    <div class="form-group">
      <label for="exampleSelect1">방문차량수</label>
      <select class="form-control" id="exampleSelect1">
        <option>1</option>
        <option>2</option>
        <option>3</option>
        <option>4</option>      
      </select>
    </div>
    <div class="form-group">
      <label for="exampleTextarea">방문목적</label>
      <div>
      <textarea class="form-control" id="exampleTextarea" cols="100" rows="3"></textarea>
      </div>
    </div>
    </fieldset>
</form>
</body>
</html>