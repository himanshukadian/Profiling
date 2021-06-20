function fchart() {

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

                var ip=[];
				var formatError=[];
				var serverFailure=[];
				var non_ExistentDomainName=[];
				var notImplemented=[];
				var queryRefused=[];
				var nameExistsWhenItsShouldNot=[];
				var rrsetExistsWhenItShouldNot=[];
				var rrsetThatShouldExistDoesNot=[];
				var serverNotAuthoritativeForZone=[];
				var nameNotContainedInZone=[];
				console.log(ip)
                $.getJSON('http://13.233.63.248:8094/dns/reports/failureIpWiseReport/'+z+'', function(data) {
                    // Populate series
                    for (i = 0; i < data.length; i++){
						ip.push(data[i].ip);
                      formatError.push(data[i].formatError);
					  serverFailure.push(data[i].serverFailure);
					  non_ExistentDomainName.push(data[i].non_ExistentDomainName);
					  notImplemented.push(data[i].notImplemented);
					  queryRefused.push(data[i].queryRefused);
                      nameExistsWhenItsShouldNot.push(data[i].nameExistsWhenItsShouldNot);
					  rrsetExistsWhenItShouldNot.push(data[i].rrsetExistsWhenItShouldNot);
					  rrsetThatShouldExistDoesNot.push(data[i].rrsetThatShouldExistDoesNot);
					  serverNotAuthoritativeForZone.push(data[i].serverNotAuthoritativeForZone);
					  nameNotContainedInZone.push(data[i].nameNotContainedInZone);
                    }
                 
                    // draw chart
var chart = new Highcharts.Chart({
    chart: {
        renderTo: 'fchart',
        type: 'column',
        options3d: {
            enabled: true,
            alpha: 6,
            beta: -8,
            depth: 20,
            viewDistance:45
        }
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
    plotOptions: {
        column: {
            depth: 25
        }
    },
		
                    series: [
			
					{
	                    name: 'formatError',
                        data: formatError
                    },
					{
					name: 'serverFailure',
					data: serverFailure
					},
					{
					name: 'non_ExistentDomainName',
					data: non_ExistentDomainName
					},
					
					{
	                    name: 'notImplemented',
                        data: notImplemented
                    },
					{
					name: 'queryRefused',
					data: queryRefused
					},
					{
					name: 'nameExistsWhenItsShouldNot',
					data: nameExistsWhenItsShouldNot
					},
					
					{
	                    name: 'rrsetExistsWhenItShouldNot',
                        data: rrsetExistsWhenItShouldNot
                    },
					{
					name: 'rrsetThatShouldExistDoesNot',
					data: rrsetThatShouldExistDoesNot
					},
					{
					name: 'serverNotAuthoritativeForZone',
					data: serverNotAuthoritativeForZone
					},
					
					{
					name: 'nameNotContainedInZone',
					data: nameNotContainedInZone
					}
					
					]
                }); 
            });
			
				$("#modelId").hide();
				$(".modal-backdrop.in").hide();	
				  $("#fchart").css("display","block");
			
        }