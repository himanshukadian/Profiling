<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
</head>
<body> 
 <c:set var="context" value="${pageContext.request.contextPath}" />
<div class="container">
  <div class="panel panel-primary col-sm-3">
    <div class="panel-head" style="color:red"><h4><strong>Total Live Campaign</strong></h4> <span style="color:green">${Dashboard.totalLiveCampaign}</span></div>
  </div>
  <div class="panel panel-primary col-sm-3">
    <div class="panel-head" style="color:red"><h4><strong>Total Publishers</strong></h4> <span style="color:green;text-align:center">${Dashboard.totalPublisher}</span></div>
  </div>
  <div class="panel panel-primary col-sm-3">
    <div class="panel-head" style="color:red"><h4><strong>Total Client</strong></h4> <span style="color:green">${Dashboard.totalClient}</span></div>
  </div>
 <div class="dropdown col-sm-3">
    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Select Campaign
    <span class="caret"></span></button>
    <ul class="dropdown-menu">
    <c:if test="${!empty Dashboard.campaignList}">
      <c:forEach items="${Dashboard.campaignList}" var="campaign">
      <li><a type="button" class="btn" onclick="getCampaignChart(${campaign.id});"><span>${campaign.id}:</span> ${campaign.description}</a></li>
      </c:forEach>
      </c:if>
    </ul>
  </div>
</div>
<hr>
<div class="col-sm-6" id="chart1" style="min-width: 310px; max-width: 800px; height: 400px; margin: 0 auto"></div>
<div class="col-sm-6" id="chart2" style="min-width: 310px; max-width: 800px; height: 400px; margin: 0 auto"></div>
<div class="container">
 <a id="exportBtn" class="btn btn-primary btn-green" href="19">
   Export Data <i class="fa fa-angle-down"></i>
 </a>
</div>
<script>
function getCampaignChart(campaignId){
	document.getElementById("exportBtn").href="http://localhost:8088/Profiling/ExportCampaignData/campaigndata_"+campaignId+".csv";
	  $.getJSON('${context}/getCampaignChart?campaignId='+campaignId, function(data) {
		  //alert(data.categories);
		  var cat=[];
		  var ser=[];
		  var campaign=data.campaign;
		  cat=data.categories;
		  ser=data.series;
		  
		//  console.log(cat);
		  //console.log(ser[0]);
		  Highcharts.chart('chart1', {
			    chart: {
			        type: 'bar'
			    },
			    title: {
			        text: campaign
			    },
			    xAxis: {
			        categories: cat
			    },
			    yAxis: {
			        min: 0,
			        title: {
			            text: 'Campaign Details'
			        }
			    },
			    tooltip: {
			        pointFormat: '<span style="color:{series.color}">{series.name}</span>: <b>{point.y}</b> ({point.percentage:.0f}%)<br/>',
			        shared: true
			    },
			    plotOptions: {
			        series: {
			            stacking: 'percent'
			        }
			    },
			    series: [
			    	{
				        name: 'Total',
				        data: ser[1]
				    },
			    	{
				        name: 'Hits',
				        data: ser[0]
				    }
			    ]
			});
});
	  $.getJSON('${context}/getQuestionChart?campaignId='+campaignId, function(data) { 
		  var cat=[];
		  var ser=[];
		  cat=data.categories;
		  ser=data.series;
		  console.log(cat);
		  console.log(ser);
	  Highcharts.chart('chart2', {
		    chart: {
		        type: 'bar'
		    },
		    title: {
		        text: 'Question Chart'
		    },
		    xAxis: {
		        categories: cat
		    },
		    yAxis: {
		        min: 0,
		        title: {
		            text: 'Campaign Question Details'
		        }
		    },
		    legend: {
		        reversed: true
		    },
		    plotOptions: {
		        series: {
		            stacking: 'normal'
		        }
		    },
		    
		    series:ser
		});	  
	  }); 
}
</script>
</body>
</html>
