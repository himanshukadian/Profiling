function secondchart(){
	$("#modelId").hide();
		$(".modal-backdrop.in").hide();	
		  $("#secondchart").css("display","block");
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
				var ms0_10=[];
				var ms10_20=[];
				var ms20_30=[];
				var ms30_40=[];
				var ms40_50=[];
				var ms50Above=[];
				
				console.log(datetime)
                $.getJSON('http://13.233.63.248:8094/dns/reports/responseTimeReport/'+z+'', function(data) {
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
                   Highcharts.chart('secondchart', {
    chart: {
        type: 'bar',
        options3d: {
            enabled: true,
            alpha: 0,
            beta: -8,
            viewDistance: 20,
            depth: 100
        }
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