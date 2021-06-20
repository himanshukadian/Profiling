function responseTimeWise() {
	$("#modelId").show();
	$(".modal-backdrop.in").show();
	 var startdate = document.getElementById("sd").value.split(' ')[0];
	 startdate = [startdate.slice(-4), startdate.slice(0,2),startdate.slice(3,5)].join('');
	
	  var enddate = document.getElementById("ed").value.split(' ')[0];
	 enddate = [enddate.slice(-4), enddate.slice(0,2),enddate.slice(3,5)].join('');

var a=startdate+'/'+enddate;
var ip=[];
var ms0_10=[];
var ms10_20=[];
var ms20_30=[];
var ms30_40=[];
var ms40_50=[];
var ms50Above=[];

$.getJSON('http://13.233.63.248:8094/dns/reports/responseTimeIpWiseReport/'+a+'/', function(data) {
 // Populate series
 for (i = 0; i < data.length; i++){
	ip.push(data[i].ip);
   ms0_10.push(data[i].ms0_10);
	  ms10_20.push(data[i].ms10_20);
	  ms20_30.push(data[i].ms20_30);
	  ms30_40.push(data[i].ms30_40);
	  ms40_50.push(data[i].ms40_50);
	  ms50Above.push(data[i].ms50Above);
	  
 }

 // draw chart
 var chart = new Highcharts.Chart({
     chart: {
         renderTo: 'responseTimeWise',
         type: 'column',
         plotAreaWidth: 300,
         plotAreaHeight: 400
        
     },
     title: {
         text: ''
     },
 	xAxis: {
             type: 'category',
             labels: {
                 overflow: 'justify'
             },
             startOnTick: true,
             showFirstLabel: true,
             endOnTick: true,
             showLastLabel: true,
             categories: ip,
             tickInterval: 1,
             labels: {
                 rotation: 0.1,
                 align: 'left',
                 step: 1,
                 enabled: true
             },
             style: {
                 fontSize: '8px'
             },
 			},
     subtitle: {
         text: ''
     },
     
 		
                     series: [
 			
 					{
 	                    name: 'ms0_10',
                         data: ms0_10
                     },
 					{
 					name: 'ms10_20',
 					data: ms10_20
 					},
 					{
 					name: 'ms20_30',
 					data: ms20_30
 					},
 					
 					{
 	                    name: 'ms30_40',
                         data: ms30_40
                     },
 					{
 					name: 'ms40_50',
 					data: ms40_50
 					},
 					{
 					name: 'ms50Above',
 					data: ms50Above
 					}
 					]
                 }); 
         
});
}