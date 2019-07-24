<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<script>
	var Board = {
		
		search	: function(pageNum) {
			var dataObj = {
				page 			: pageNum,
				selectKeyword	: field.selectKeyword
			}
			
			$.ajax({
				url	: "<c:url value= 'searchPage.do' />",
				data : dataObj,
				type : "POST",
				dataType : "html",
				success : function(data) {
					
					$(".pageWrap").empty().append(data);
				}
			})
			
			$.ajax({
				url	: "<c:url value= 'searchList.do' />",
				data : dataObj,
				type : "POST",
				dataType : "html",
				success : function(data) {
					
					$(".boardWrap").empty().append(data);
				}
			})	
		}
	}
	
	var field = {
		selectKeyword 	: ""
	}
	
	function resetList() {
		field.selectKeyword = "";
		
		Board.search("1");
	}
	
	$(function() {
		$("#selectYear").change(function() {
			var years = $(this).val();
			
			if (years === "연도를 선택해주세요") {
				$("#selectMonth").empty().append("<option>월을 선택해주세요</option>");
				
				resetList();
			} else {
				$.ajax({
					url 		: "<c:url value='selectMonth.do' />",
					type 		: "POST",
					dataType 	: "text",
					data		: {"years" : years},
					success 	: function(data) {
						var months 		= JSON.parse(data);
						var optionHTML 	= "<option>월을 선택해주세요</option>";
						
						console.log(months[0].days)
						
						for (var i = 0; i < months.length; i++) {
							optionHTML += "<option data-years=" + years + ">" + months[i].days + "</option>";							
						}
						
						$("#selectMonth").empty().append(optionHTML);
					}
				});
			}
		});
		
		$("#selectMonth").change(function() {
			var selectKeyword = $("#selectMonth option:selected").data("years") + $("#selectMonth option:selected").text();
			
			field.selectKeyword = selectKeyword;
			
			Board.search("1");
		});		
		
		Board.search("1");
	})

</script>

 <div class="row slider-text align-items-center justify-content-center">
      <div class="col-md-10 text-center">
      	<div class="selectbox">
      		<select id="selectYear">
      			<option>연도를 선택해주세요</option>
      			<c:if test="${not empty planYears}">
	      			<c:forEach items="${planYears}" var="planYears">
	      				<option>${planYears.years}</option>
	      			</c:forEach>
	      		</c:if>
	      		<c:if test="${empty planYears}">
	      			<option>없음</option>
	      		</c:if>
			</select>
			<select id="selectMonth">
				<option>월을 선택해주세요</option>
    		</select>
      	</div>
      	
      	<br>
      	
      	<div class="boardWrap">
		    
		</div>

		 <div class="pageWrap text-center">

		</div>
      </div>      
</div>
