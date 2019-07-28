<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<script>
	/*
	*	달력 관련 컨텍스트
	*/
	var Calendar = {
			
		// 오늘 날짜
		today : new Date(),
		
		/*
		*	달력을 만들어주는 메서드
		*	======================
		*	# 테이블 안에  today변수를 이용해 달력을 출력합니다.
		*	# <td data-day="{오늘 날짜}">{오늘 날짜}</td> 의 형태 
		*
		*/
		makeCalendar : function() {
			var fstDay          = new Date(this.today.getFullYear(), this.today.getMonth(), 1),
		        lastDay         = new Date(this.today.getFullYear(), this.today.getMonth() + 1, 0),
		        calendarTh      = $("#calendarYM"),
		        calendarTable   = $("#calendar"),
				year			= this.today.getFullYear(),
				month			= this.today.getMonth() + 1;
			 
		    calendarTh.text(year + "년 " + month + "월");

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
		    
		    // year = 출력된 달력의 해당 년도, month = 출력된 달력의 해당 월
		    DateHighLight.getDate(year, month);
		},
		
		// today변수의 값을 저번달로 바꿔줍니다.
		prevCalendar : function() {
			this.today = new Date(this.today.getFullYear(), this.today.getMonth() - 1, this.today.getDate());
			
			this.makeCalendar();
		},
		
		// today변수의 값을 다음달로 바꿔줍니다.
		nextCalendar : function() {
			this.today = new Date(this.today.getFullYear(), this.today.getMonth() + 1, this.today.getDate());
			
			this.makeCalendar();
		}
	};
	
	/*
	*	만들어진 달력에 하이라이트 처리를 하는 컨텍스트
	*	==============================
	*	DB에서 가져온 날짜 데이터(데이트를 했던 날짜)를 이용해
	*	달력에 하이라이트 처리를 해줍니다.
	*/
	var DateHighLight = {
		
		/*
		*	Calendar.makeCalendar에서 호출
		*	전달 받은 값(year, month)로  DB에서 조회
		*	============================
		*	# year 	= 달력에 표시된 해당 년도
		*	# month	= 달력에 표시된 해당 월
		*	ex) 2019년7월의 값으로 만들어 DB에서 LIKE 검색
		*/
		getDate : function(year, month) {
			var dateDay = year + "년" + month + "월";
			
			 $.ajax({
		            url     	: "<c:url value="/getDateList.do"/>",
		            type 		: "POST",
		            dataType 	: "text",
		            data     	: {"dateDay" : dateDay},
		            success 	: function(data) {
		            	
		            	// 조회로 받아온 값을 배열로 만들어 줍니다.
		            	var dateArr = data.split(",");
		            	
		            	console.log(dateArr);
		            	
		            	// 조회 결과가 빈값일 수 있기 때문에 빈값 체크
		            	if (dateArr != "") {
		            		
		            		// 달력에 하이라이트 처리
		            		DateHighLight.addHighLight(dateArr);
		            	}
		            }
		     });
		},
		
		/*
		*	달력에 하이라이트 처리하는 메서드
		*	반복문을 돌려 dataArr의 값과 일치하는 태그를 하이라이트 처리
		*	========================
		*	# dataArr = DB에서 검색을 통해 가져온 배열 
		*	ex) dataArr = [26일, 27일]
		*
		*/
		addHighLight	: function(dateArr) {

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
		
		// 달력에 하이라이트 처리된 부분을 클릭하거나 빈값을 클릭했을 때 동작됨  => 미구현
		$("#calendar").click(function(event) {
			var $clickTarget 	= $(event.target);
			var clickDate 		= Calendar.today.getFullYear() + (Calendar.today.getMonth() + 1) + parseInt($clickTarget.text());
			var day				= new Date();
			var todayDate		= day.getFullYear()	 +  (day.getMonth() + 1) + day.getDate();
			
			if ($clickTarget.hasClass("active")) {
				alert("데이트 완료");
				menuEvent.goMenu("writeBoard");
			}
			
			if (clickDate > todayDate) {
				alert("데이트를 할 날들");
			} else if (clickDate == todayDate) {
				alert("데이트 하는 날!!");
			} else if (clickDate < todayDate && !$clickTarget.hasClass("active")) {
				alert("데이트 못한 날");
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