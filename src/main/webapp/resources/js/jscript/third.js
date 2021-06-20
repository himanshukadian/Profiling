function thirdchart(){
$("#modelId").hide();
	$(".modal-backdrop.in").hide();	
	  $("#thirdchart").css("display","block");
	  var startdate = document.getElementById("sd").value.split(' ')[0];
		 startdate = [startdate.slice(-4), startdate.slice(0,2),startdate.slice(3,5)].join('');
		
		  var enddate = document.getElementById("ed").value.split(' ')[0];
		 enddate = [enddate.slice(-4), enddate.slice(0,2),enddate.slice(3,5)].join('');

var z=startdate+'/'+enddate;

if(startdate==='' && enddate===''){
	alert("Please provide Start Date and End Date");
}
else if(startdate==='' || enddate===''){
	alert("Start Date or End Date is Missing");
}
else if(enddate<startdate){
	alert("End Date not be less than Start Date");
}
else{
	generate(z);
}
var datetime=[];
var success=[];
var failure=[];
	
    $.getJSON('http://13.233.63.248:8094/dns/reports/performanceReport2/'+z+'/', function(data) {
        // Populate series
        for (i = 0; i < data.length; i++){
        	  datetime.push(data[i].datetime);
			  success.push(data[i].success);
			  failure.push(data[i].failure);
		  
        }
     
        // draw chart
        var chart = new Highcharts.Chart({
            chart: {
                renderTo: 'thirdchart',
                type: 'column',
                options3d: {
                    enabled: true,
                    alpha: 0,
                    beta: -8,
                    viewDistance: 20,
                    depth: 100
                },
             
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
                    categories: datetime,
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
            plotOptions: {
                column: {
                    depth: 25
                }
            },
        		
               series: [
        			
        					{
        	                    name: 'success',
                                data: success
                            },
        					{
        					name: 'failure',
        					data: failure
        					}]

        }); 
       });
          }