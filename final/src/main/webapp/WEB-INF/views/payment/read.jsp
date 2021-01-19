<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        height: 100px;
    }
    .bottom{
        height: 400px;
        background-color: beige;
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
</style>
</head>
<body>
<div class="container" >
    <div class="top row">
        <div class="col row">
        	<div class="col-4 center">
        		<span class="border border-primary rounded-circle mon center">
        			07
        		</span>
        	</div>
        	<div class="col-8 center">
                납부마감일 ㄴㅁㅇㄻㄴㅇㄹ<br>
                납부마감일을 넘길시 연체료가 부과됩니다.
            </div>
        </div>
        <div class="col center">
        	<div class="card-group">
                <div class="card">
                    <div class="card-header" >
                        납기내
                    </div>
                    <div class="card-body">
                        115,120원
                    </div>
                </div>
                <div class="card">
                    <div class="card-header" >
                        납기후
                    </div>
                    <div class="card-body">
                       117,420원
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="mid row">
        <div class="col">a</div>
        <div class="col">b</div>
    </div>
    <div class="bottom row">
        <div class="col">a</div>
        <div class="col">b</div>
    </div>
</div>
</body>
</html>