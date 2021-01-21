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
<div class="container" >
    <div class="top row">
        <div class="col-sm row">
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
        <div class="col-sm center">
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
        <div class="col-sm">
			<div class="mid2" align="center"></div>
		</div>
        <div class="col-sm">
        	<div class="mid2" align="right">
        		<button class="btn btn-outline-dark">엑셀로 저장</button>
        		<button class="btn btn-outline-dark">고지서 인쇄</button>
        	</div>
        </div>
    </div>
    <div class="bottom row">
        <div class="col-sm">
        	<div>
        	<table class="table">
			  <tbody>
			    <tr>
			      <th scope="row">당월부과액</th>
			      <td>115,120</td>
			    </tr>
			    <tr>
			      <th scope="row">미납액</th>
			      <td>0</td>
			    </tr>
			    <tr>
			      <th scope="row">연체료</th>
			      <td>0</td>
			    </tr>
			    <tr>
			      <th scope="row">납기내 금액</th>
			      <td>115,120</td>
			    </tr>
			    <tr>
			      <th scope="row">납기후 연체료</th>
			      <td>2,300</td>
			    </tr>
			    <tr>
			      <th scope="row">납기후 금액</th>
			      <td>117,420</td>
			    </tr>
			  </tbody>
			</table>
        	</div>
        </div>
        <div class="col-sm">
        	<div>
        		<button type="button" class="btn btn-outline-dark" data-toggle="modal" data-target="#detail">상세 내역 조회</button>
        		<button type="button" class="btn btn-outline-dark" data-toggle="modal" data-target="#comparison">전월 비교 조회</button>
        		<button type="button" class="btn btn-outline-dark" data-toggle="modal" data-target="#payment">납부 내역 조회</button>
        		
        	</div>
        	<button type="button" class="btn btn-outline-dark btn-block">관리비 납부하기</button>
        </div>
    </div>
    


<!-- Modal -->
<div class="modal fade" id="detail" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">상세 내역</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <table class="table">
			  <tbody>
			    <tr>
			      <th scope="row">당월부과액</th>
			      <td>115,120</td>
			    </tr>
			    <tr>
			      <th scope="row">미납액</th>
			      <td>0</td>
			    </tr>
			    <tr>
			      <th scope="row">연체료</th>
			      <td>0</td>
			    </tr>
			    <tr>
			      <th scope="row">납기내 금액</th>
			      <td>115,120</td>
			    </tr>
			    <tr>
			      <th scope="row">납기후 연체료</th>
			      <td>2,300</td>
			    </tr>
			    <tr>
			      <th scope="row">납기후 금액</th>
			      <td>117,420</td>
			    </tr>
			  </tbody>
			</table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary">Understood</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="comparison" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">전월 비교</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary">Understood</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="payment" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">납부 내역</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary">Understood</button>
      </div>
    </div>
  </div>
</div>
    
</div>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
</html>