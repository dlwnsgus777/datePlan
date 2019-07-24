<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>


	<ul class="pagination"> 
		<c:if test="${planPage.prevPage ne 0}">
			<li><a href="javascript:;" style="cursor:pointer;" onclick="javascript:Board.search('${planPage.prevPage}')"><img src="static/images/common/btn_prev.png" alt="이전"></a></li>
		</c:if>		
		<c:forEach var="page" begin="${planPage.scaleStartPage}"
			end="${planPage.scaleEndPage}" step="1">
			<li><a href="javascript:;" style="cursor:pointer;" onclick="javascript:Board.search('${page}')">${page}</a></li>
		</c:forEach>
		<c:if test="${planPage.scaleEndPage >= planPage.totPage}">
			<li><a href="javascript:;" style="cursor:pointer;" onclick="javascript:Board.search('${planPage.nextPage}')"><img src="static/images/common/btn_next.png" alt="다음"></a></li>
		</c:if>	
	</ul>
