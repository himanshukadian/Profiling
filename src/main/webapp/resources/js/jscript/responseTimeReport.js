function responseTimeCsv() {
	$("#modelId").show();
	$(".modal-backdrop.in").show();
	 var startdate = document.getElementById("sd").value.split(' ')[0];
	 startdate = [startdate.slice(-4), startdate.slice(0,2),startdate.slice(3,5)].join('');
	
	  var enddate = document.getElementById("ed").value.split(' ')[0];
	 enddate = [enddate.slice(-4), enddate.slice(0,2),enddate.slice(3,5)].join('');

var a=startdate+'/'+enddate;
var datetime=[];
var ms0_10=[];
var ms10_20=[];
var ms20_30=[];
var ms30_40=[];
var ms40_50=[];
var ms50Above=[];

console.log(datetime)
$.getJSON('http://13.233.63.248:8094/dns/reports/responseTimeReport/'+a+'', function(data) {
 // Populate series
 for (i = 0; i < data.length; i++){
	datetime.push(data[i].datetime);
   ms0_10.push(data[i].ms0_10);
	  ms10_20.push(data[i].ms10_20);
	  ms20_30.push(data[i].ms20_30);
	  ms30_40.push(data[i].ms30_40);
	  ms40_50.push(data[i].ms40_50);
	  ms50Above.push(data[i].ms50Above);
	  
 }

 // draw chart
Highcharts.chart('responseReport', {
chart: {
type: 'bar',
plotAreaWidth: 300,
plotAreaHeight: 400
},
title: {
text: ''
},
xAxis: {
categories: datetime
},
yAxis: {
min: 0,
title: {
text: ''
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

}]
}); 
});
}