<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>


<script>


</script>

 
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
