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
	  for(var i of App.resultList){
		  for(u of ${json}){
			  if(u.id == i.name){
				 voteName= u.name;
				 if(max<i.voteCount){
					  max = i.voteCount;
				  	  winner=u.name;
				  }
			  }
		  }
		  candidate.push([i.id+"번 "+ voteName, Number(i.voteCount)])
		  if(max<i.voteCount){
			  max = i.voteCount;
		  	  winner=u.name;
		  }
	  }
	  $('#voteResultInput').html(winner);	
	  
	  console.log(App.resultList);
	  
	google.charts.load("current", {packages:["corechart"]});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
	  var data = google.visualization.arrayToDataTable(candidate);

	  var options = {
	    title: '투표 결과',
	    is3D: true,
	  };

	  var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
	  chart.draw(data, options);
	}
	}
</script>
</head>
<body>
	<div id="piechart_3d" style="width: 900px; height: 500px;"></div>
	당선자:
	<span id="voteResultInput"></span>


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