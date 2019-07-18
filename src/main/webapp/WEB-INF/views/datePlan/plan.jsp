<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<script>
$(function(){
	
	// 화면에 달력 그려주기.
    $('#dateRangePicker').datepicker({

        calendarWeeks	: false,
        todayHighlight	: true,
        autoclose		: true,
        format			: "yyyy/mm/dd",
        language		: "kr",

    });
	
    $(".datepicker-months").on(" td[data-day=5]").addClass("active");

});
</script>
<style>
.datepicker {
	margin : 0 auto;
	width : 300px;
}
.table-condensed {
	margin : 0 auto;
	width : 300px;
	height: 400px;
	boader
}

</style>
 <div class="row slider-text align-items-center justify-content-center">
      <div class="col-md-10 text-center">
      	<div class="input-group input-append date" id="dateRangePicker" > </div>
      		<table id="calendar" boarder="3" align="center">
				<thead>
				    <tr>
				        <th><label><</label></th>
				        <th colspan="5" align="center" id="calendarYM">yyyy년 m월</th>
				        <th><label></label></th>
				    </tr>
				</thead>
				<tbody>
				    <tr>
				        <td align="center">일</td>
				        <td align="center">월</td>
				        <td align="center">화</td>
				        <td align="center">수</td>
				        <td align="center">목</td>
				        <td align="center">금</td>
				        <td align="center">토</td>
				   </tr>
				</tbody>
 
			</table>
      </div>
</div>