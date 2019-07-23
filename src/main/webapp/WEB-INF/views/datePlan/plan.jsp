<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<script>

	var Calendar = {
		today : new Date(),
			
		makeCalendar : function() {
			 var fstDay         = new Date(this.today.getFullYear(), this.today.getMonth(), 1),
		        lastDay         = new Date(this.today.getFullYear(), this.today.getMonth() + 1, 0),
		        calendarTh      = $("#calendarYM"),
		        calendarTable   = $("#calendar"),
				year			= this.today.getFullYear(),
				month			= this.today.getMonth() + 1;
			 
		    calendarTh.text(year + "년   " + month + "월");

		    $("tbody > tr").each(function() {
		    	
		    	if (!$(this).hasClass("yoil")) {
		    		$(this).remove();
		    	} 
		    })

		    var trTag   = "<tr>", 
		        cnt     = 0;
		    
		    for (i = 0; i < fstDay.getDay(); i++) {

		        if (fstDay.getDay() === i) {
		            trTag += "<td data-day=" + i + ">" + i + "</td>";
		        } else {
		            trTag += "<td></td>";
		        }
		        
		        cnt  = cnt + 1;

		        if (cnt % 7 === 0) {
		            trTag   += "</tr>";
		            cnt     = 0;
		        }      
		    }
		    
		    for (i = 1; i <= lastDay.getDate(); i++) { 
		        trTag += "<td data-day=" + i + ">" + i + "</td>";

		        cnt = cnt + 1;

		        if (cnt % 7 == 0) {
		            trTag   += "</tr>";
		        }
		    }

		    $("tbody").append(trTag);
		    
		    DateHighLight.getDate(year, month);
		},
	
		prevCalendar : function() {
			this.today = new Date(this.today.getFullYear(), this.today.getMonth() - 1, this.today.getDate());
			
			this.makeCalendar();
		},
		
		nextCalendar : function() {
			this.today = new Date(this.today.getFullYear(), this.today.getMonth() + 1, this.today.getDate());
			
			this.makeCalendar();
		}
	};
	
	var DateHighLight = {
		
		getDate : function(year, month) {
			var dateDay = year + "년" + month + "월";
			
			 $.ajax({
		            url     : "<c:url value="/getDateList.do"/>",
		            dataType : "text",
		            data     : {"dateDay" : dateDay},
		            success : function(data) {
		            	
		            	var dateArr = data.split(",");
		            	
		            	console.log(dateArr);
		            	
		            	if (dateArr != "") {
		            		DateHighLight.addHighLight(dateArr);
		            	}
		            }
		     });
		},
		
		addHighLight	: function(dateArr) {
			console.log(typeof(dateArr));
			$("#calendar td").each(function() {
				var $td	= $(this);
				
				for (var i = 0; i < dateArr.length; i++) {
					
					if ($td.data("day") == dateArr[i]) {
						$td.addClass("active");
					}
				}
			})
		}
	};
	
	$(function(){
		$("#calendar").on("td").click(function() {
			alert("vbb");
			
			if ($(this).hasClass("active")) {
				alert("Asd");	
			}
			
		})
		
		Calendar.makeCalendar.call(Calendar);
	});
</script>

 <div class="row slider-text align-items-center justify-content-center">
      <div class="col-md-10 text-center">
      	<div class="input-group input-append date" id="dateRangePicker" > </div>
      		<table id="calendar" boarder="3" align="center">
				<thead>
				    <tr>
				        <th onclick="javascript:Calendar.prevCalendar()"><label><</label></th>
				        <th colspan="5" align="center" id="calendarYM">yyyy년 m월</th>
				        <th onclick="javascript:Calendar.nextCalendar()"><label>></label></th>
				    </tr>
				</thead>
				<tbody>
				    <tr class="yoil">
				        <td align="center" style="color:red">일</td>
				        <td align="center">월</td>
				        <td align="center">화</td>
				        <td align="center">수</td>
				        <td align="center">목</td>
				        <td align="center">금</td>
				        <td align="center" style="color:blue">토</td>
				   </tr>
				</tbody>
 
			</table>
      </div>
</div>