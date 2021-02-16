<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
function makeChart(){
	
	//clist.id = i.name
	
	var candidate= [
	    ['task', 'hours per day']
	  ];
	var voteName;
	var max=0;
	var winner;
	var picture;
	var num;
	  for(var i of App.resultList){
		  for(u of ${json}){
			  if(u.id == i.name){
				 voteName= u.name;
				 if(max<i.voteCount){
					  max = i.voteCount;
				  	  winner=u.name;
				  	  picture=u.picture;
				  	  num=i.id;
				  }
			  }
		  }
		  candidate.push([i.id+"번 "+ voteName, Number(i.voteCount)])
		  /* if(max<i.voteCount){
			  max = i.voteCount;
		  	  winner=u.name;
		  	  picture=u.picture;
		  	  num=i.id;
		  } */
	  }
	  $('#voteResultInput').html(winner);	
	  $('#votePicture').attr("src", "resources/img/candidate/"+picture);
	  console.log(App.resultList);
	  $('#candiNum').html(num+"번");
	google.charts.load("current", {packages:["corechart"]});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
	  var data = google.visualization.arrayToDataTable(candidate);

	  var options = {
	    title: '투표 결과',
	    is3D: true,
	    width: 800,
	    height: 500,
	    legend: {position: 'bottom'}
	  };

	  var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
	  chart.draw(data, options);
	}
}
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div id="piechart_3d" class="col-lg-8 col-md-8"></div>

			<div class="col-lg-4 col-md-4" >
				<div class="single_ihotel_list" style="padding-top: 150px;">
					<h1>당선을 축하합니다</h1>
					<img id="votePicture">
					<div class="hover_text"></div>
					<div class="hotel_text_iner">
						<h3>
							<p id="candiNum"></p>
							<p id="voteResultInput"></p>
						</h3>

					</div>
				</div>
			</div>
		</div>
	</div>

	<div align="right">
		<button type="button" class="btn btn-outline-secondary"
			onclick="location.href='voteStart.do'">목록보기</button>
	</div>


</body>
<script
	src="https://cdn.jsdelivr.net/gh/ethereum/web3.js@1.0.0-beta.37/dist/web3.min.js"></script>
<script src="resources/js/vote/abi.js"></script>
<script src="resources/js/vote/index.js"></script>
<script>
let result = '${vo.seq}';
App.init();

</script>
</html>