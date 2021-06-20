
var i = new Array();
var username = $("body").attr("data-username");
var userType = $("body").attr("data-userType");
var module = $("body").attr("data-module");
var MyDate = new Date();
var currentDate;
MyDate.setDate(MyDate.getDate());
currentDate = (('0' + MyDate.getDate()).slice(1, 3) + '-'
		+ ('0' + (MyDate.getMonth() + 1)).slice(0, 2) + '-' + MyDate
		.getFullYear(6, 10));

var lastDate = new Date();
var finaldate = 7;
lastDate.setDate(MyDate.getDate() - finaldate);
last7days = (('0' + lastDate.getDate()).slice(0, 2) + '-'
		+ ('0' + (lastDate.getMonth() + 1)).slice(0, 2) + '-' + lastDate
		.getFullYear(6, 10));

var e = document.getElementById("ut");
var elem = document.getElementById("selectpicker"),selectedNode = elem.options[elem.selectedIndex].value;
var str;
var str2;
var str1;
var str3;
var str4;
function hit() {

	var json=$('#jsond').val();  

	var jsonInput = json.split(',');
	
	graphId=jsonInput[0];
	
	graphName=jsonInput[1];
	graphType=jsonInput[2];
	if(graphType==='null')
	{
	graphType=  'line';//jsonInput[2];
	// alert(graphType);
	}
	else{
		graphType=jsonInput[2]; 
	}
	yAxisTitle=jsonInput[3];
	
	str1= document.getElementsByClassName("unique")[0].value;
	
	str2= document.getElementsByClassName("unique")[1].value;
	
	str3= document.getElementsByClassName("unique")[2].value;
	
	str4= document.getElementsByClassName("unique")[3].value;
	//var numb = parseInt(str4);//.match(/\d/g);
	// console.log(jsonInput[0]);
	


$.ajax({
	url : 'http://13.233.63.248:8080/analytics-api/graph/getData',
	type : "post",
	contentType : "application/json;charset=utf-8",
	data : JSON.stringify({
		"request" : {
			"user" : {
				"name" : username,
				"type" : userType,
				"module":module

			},
			"graph" : {
				"id" :graphId,
				"order" : 0
			}
		},
		"startDate" : currentDate,
		"endDate" : last7days,
		"filter" : [ "Zone="+str1,"Superviser="+str2,"Meal Provider="+str3, "Train No="+str4]
	}),

	success : function(result, request, response) {
 console.log(result)	
if (graphType == 'pie') {
						setDataForPie(graphId, graphName, graphType,
								yAxisTitle, result);
					} else {
				setData(graphId, graphName, graphType, yAxisTitle,
								result);
					}
					
	//alert("success")
	},
	error : function(xhr, status, error) {
		console.log(error);
	}
});





}
	

function drawGraph(graphId, graphName, graphType, yAxisTitle) {

	$.ajax({
				url : 'http://13.233.63.248:8080/analytics-api/graph/getData',
				type : "post",
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify({
					"request" : {
						"user" : {
							"name" : username,
							"type" : userType,
							"module":module,

						},
						"graph" : {
							"id" : graphId,
							"order" : 0
						}
					},
					"startDate" : currentDate,
					"endDate" : last7days,
					"filter" : [ "", "" ]
				}),

				success : function(result, request, response) {
				
					
					
					if (graphType == 'pie') {
						setDataForPie(graphId, graphName, graphType,
								yAxisTitle, result);
					} else {
						setData(graphId, graphName, graphType, yAxisTitle,
								result);
					}
					
					
					
				},
				error : function(xhr, status, error) {
					console.log(error);
				}
			});
}

function setDataForPie(graphId, graphName, graphType, yAxisTitle, obj,divid) {

	var name;
	var mySeries = new Array();

	for (var i = 0; i < obj.data.length; i++) {
		if (i == 0) {
			name = obj.data[i].split(",");

		} else {
	
			var data = obj.data[i].split(",");

			var dataArray = new Array();
			dataArray.push(data[0]);
			dataArray.push(parseInt(data[1]));

			mySeries.push(dataArray);
		}

	}
	setDataInChart(graphId, graphName, graphType, yAxisTitle, name, mySeries);

}
function setData(graphId, graphName, graphType, yAxisTitle, obj) {
// alert(graphId+""+graphName+""+graphType);
	jQuery('#opt-'+graphId).html('');
	var name;
	var mySeries;
	var optionArray =[];
	if(obj.filters != null){
		for (var x= 0 ; x <(obj.filters).length ; x++){
			 
			var html = '';
			var option = '';
			var optionArray = obj.filters[x];
				var unqiueID =graphId;
				var jsonInput =graphId+','+graphName+','+graphType+','+yAxisTitle;
			  html = "<select class='unique' id='unqiueID'>";
			for ( var y = 0; y < optionArray.length ; y++) {
			//	console.log( 'second array',optionArray[y]);
				option = option+'<option> '+optionArray[y]+'</option>';
			}
			 html = html+option+"</select>";	
			 
			 $('#opt-'+graphId.trim()).append(html);
			
			// document.getElementById("unqiueID").innerHTML = obj.filters[0];
		//	 $("#unqiueID").find("option").get(0).remove();
			 
			 $("#unqiueID").change(function(evt) { //listen to changes of selection
				  var theElement = $(this);
				  if (!theElement.data("selected")) { //check if flag is not set
				    theElement.children("option")[0].remove();
				    theElement.children("option")[0].hide();//remove 1st child
				    theElement.data("selected", true); //set flag, so it doesn't continue removing items for every change
				  }
				});
		}
		  
		 $('#opt-'+graphId.trim()).append("<input type='hidden' id='jsond' value='"+graphId+","+graphName+","+graphType+","+yAxisTitle+"'><input type='button' value='Submit' onclick='hit()'>"); 
		 
	}else
		{
		
		}
	
	
	
	
	
	for (var i = 0; i < obj.data.length; i++) {

		if (i == 0) {
			name = obj.data[i].split(",");
			var subArrayLength = obj.data.length - 1;
			var seriesLength = name.length;
			mySeries = new Array(seriesLength);
			for (var x = 0; x < seriesLength; x++) {
				mySeries[x] = new Array();
			}

		} else {
			var dataCStr = obj.data[i].split(",");
			for (var loc = 0; loc < dataCStr.length; loc++) {
				if (loc == 0)
					mySeries[loc].push(dataCStr[loc]);

				else
					mySeries[loc].push(parseFloat(dataCStr[loc]));
	
			}
		}
	}

	setDataInChart(graphId, graphName, graphType, yAxisTitle, name, mySeries);

}

function setDataInChart(graphId, graphName, graphType, yAxisTitle, name,
		mySeries, response) {

	for (var loc = 0; loc < mySeries[0].length; loc++) {
	

	}

	var container = Highcharts.chart( "g-"+graphId, {
		chart : {
			type : graphType,

		},
		title : {
			text : graphName
		},

		subtitle : {
			text : ''
		},

		yAxis : {
			title : {
				text : yAxisTitle
			}
		},
		legend : {

			align : 'right',

		},

		plotOptions : {
			series : {
				label : {
					connectorAllowed : false
				},
			}
		},
		xAxis : {
			categories : mySeries[0],
		},
		series : [],
		responsive : {
			rules : [ {
				condition : {
					maxWidth : 250

				},

			} ]
		}

	});
	if (graphType == 'pie') {
		container.addSeries({
			name : name[0],
			data : mySeries
		});
	} else {

		for (var series = 1; series < mySeries.length; series++) {
			container.addSeries({
				name : name[series],
				data : mySeries[series]
			});
		
		}
	}
}

function allGraph() {
	$.ajax({
		url : 'http://13.233.63.248:8080/analytics-api/user/dashBoardGraphList',
		type : "post",
		contentType : "application/json;charset=utf-8",

		data : JSON.stringify({
			"user" : {
				"name" : username,
				"type" : userType
			},
			"graph" : {
				"id" : "DWAS"
			}
		}),

		success : function(result, request, response) {

			processResponseData(result);
		//	console.log("-----------------"+result);
		},
		error : function(xhr, status, error) {
			//alert("!Oops")
		}
	});
}

function processResponseData(data) {
	
	for (var loc = 0; loc < data.graph_list.length; loc++) {
		var divArr = [];
		
		
		var iDiv = document.createElement('div');
		var optDiv = document.createElement('div');
		optDiv.id ="opt-"+data.graph_list[loc].id;
		
		var graphDiv = document.createElement('div');
		graphDiv.id ="g-"+data.graph_list[loc].id;
		
		iDiv.appendChild(optDiv);
		iDiv.appendChild(graphDiv);
			
		iDiv.id = data.graph_list[loc].id;
	
		i.push(iDiv.id);
		iDiv.className = 'col-sm-6'
		document.body.appendChild(iDiv);
		
		
		var yAxisTitle = '';
		
		
		for (var a = 0; a < i.length; a++) {
			$("#" + i[a]).draggable();
		}

		// alert("............"+data.graph_list[loc].type);
		
		drawGraph(data.graph_list[loc].id, data.graph_list[loc].name,
				data.graph_list[loc].type, yAxisTitle,iDiv.id);

	}



}

$('#iconFaFa').click(function() {
	for (var a = 0; a < i.length; a++) {
		$("#" + i[a]).hide();
	}
});
