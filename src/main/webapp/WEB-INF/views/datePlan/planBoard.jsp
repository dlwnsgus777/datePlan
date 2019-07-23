<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<script>
	$(function() {
		$("#selectYear").change(function() {
			var years = $(this).val();
			
			if (years === "연도를 선택해주세요") {
				$("#selectMonth").empty().append("<option>월을 선택해주세요</option>");
			} else {
				$.ajax({
					url 		: "<c:url value='selectMonth.do' />",
					dataType 	: "text",
					data		: {"years" : years},
					success 	: function(data) {
						var months 		= JSON.parse(data);
						var optionHTML 	= "<option>월을 선택해주세요</option>";
						
						console.log(months[0].days)
						
						for (var i = 0; i < months.length; i++) {
							optionHTML += "<option>" + months[i].days + "</option>";							
						}
						
						$("#selectMonth").empty().append(optionHTML);
					}
				});
			}
		});
		
		$("#selectMonth").change(function() {
			alert($(this).val())
		});
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
		    <table class="table table-bordered table-hover">
		      <thead>
		        <tr>
		          <th>번호</th>
		          <th>날짜</th>
		          <th>작성자</th>
		        </tr>
		      </thead>
		      <tbody>
		      	<c:forEach items="${planBoard }" var="planBoard">
		      		 <tr class="boardCol">
			          <td><c:out value="${planBoard.BOARD_NO}"></c:out></td>
			          <td><c:out value="${planBoard.REG_DT}"></c:out></td>
			          <td><c:out value="${planBoard.REG_ID}"></c:out></td>
		        	</tr>
		      	</c:forEach>
		      </tbody>
		    </table>
		</div>
<!-- 		  <a class="btn btn-default pull-right"><span>글쓰기</span></a> -->
		 <div class="pageWrap text-center">
			<ul class="pagination"> 
				<li><a href="#"><img src="static/images/common/btn_prev.png" alt="이전"></a></li>
				
				<c:forEach var="page" begin="${planPage.scaleStartPage}"
					end="${planPage.scaleEndPage}" step="1">
					<li><a href="#">${page}</a></li>
				</c:forEach>
				
				<li><a href="#"><img src="static/images/common/btn_next.png" alt="다음"></a></li>
			</ul>
		</div>
      </div>      
</div>
