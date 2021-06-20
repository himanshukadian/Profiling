function findClick(){
	$( "td" ).click(function() {
	    var train=($(this).text());
	    alert(train)
	});
}
$.ajax({
    url: 'http://localhost:8080/heierarchy/',
    type: "get",
    dataType: "json",
   
    success: function(result) {
    	OnSuccess(result);
    },
    error: function (xhr, status, error) 
    {
        console.log(error);
    }
});
function OnSuccess(response) {

var headers;
var tab = document.getElementById('example');

//$('#tabular')
var thead;
thead = document.createElement("thead");

var tbody = document.createElement("tbody");

for (var i = 0; i < response.length; i++) {

	var tr = document.createElement("tr");
	for (var k = 0; k < response[i].length; k++) {
		var th;

		if (i == 0) {
			th = document.createElement("th");

		} else {
			th = document.createElement("td");
			
			/* newlink = document.createElement('a'); 
			newlink.setAttribute('class', 'signature');*/
			th.setAttribute('onClick', 'b();');
			/*  th.appendChild(newlink);  */
		}

	var txt = document
				.createTextNode(response[i][k]);
		th.appendChild(txt);
		tr.appendChild(th);

	}
	if (i == 0)
		thead.appendChild(tr);
	else {
		tbody.appendChild(tr);
	}

}

tab.appendChild(thead);
tab.appendChild(tbody);
showTable();

}
function showTable(){
	$('#example thead tr').clone(true).appendTo(
	'#example thead');
$('#example thead tr:eq(1) th')
	.each(
			function(i) {
				var title = $(this).text();
				$(this)
						.html(
								'<input type="text" id="search" placeholder="Search '+title+'" />');

				$('input', this)
						.on(
								'keyup change',
								function() {
									if (tab
											.column(
													i)
											.search() !== this.value) {
										tab
												.column(
														i)
												.search(
														this.value)
												.draw();
									}
								});
			});



	var tab = $('#example').DataTable({
		orderCellsTop : true,
		fixedHeader : false
	});
}
function b(){
	 location.href = "./mealPro";
	 
}
function a(){

 	var table = document.getElementsByTagName("table")[0];
	var tbody = table.getElementsByTagName("tbody")[0];
	   var data = [];
	tbody.onclick = function (e) {
	    e = e || window.event;
	 
	    var target = e.srcElement || e.target;
	    while (target && target.nodeName !== "TR") {
	        target = target.parentNode;
	    }
	    if (target) {
	        var cells = target.getElementsByTagName("td");
	     
	        for (var i = 0; i < cells.length; i++) {
	        	/* console.log(cells[i]) */
	            data.push(cells[i].innerHTML);
	        }
	    }
	    var d=data[0];
	    var train=data[2];
	
	var search = {
      "date" : d,
      "train":train
     
   }
	$.ajax({
		url : 'http://localhost:8080/heierarchy/schedule',
		type : "post",
		contentType : "application/json;charset=utf-8",
		data : JSON.stringify(search),

		success : function(result) {
alert("Success")

showTable();
console.log(result)
		},
		error : function(xhr, status, error) {
		alert(status);
		}

	}); 
	
}
}; 	
