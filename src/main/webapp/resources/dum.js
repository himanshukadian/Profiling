
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

		success : function(result,respone) {
alert("Success")
 $('#example').dataTable({
    	   "data": respone,
    	   "columns": [
    	      { "data": "Date" },  
    	      
    	      { "data": "Train No" }
    	     
    	      ]
    });
console.log(result)
		},
		error : function(xhr, status, error) {
		alert(status);
		}

	}); 
	
}
};

