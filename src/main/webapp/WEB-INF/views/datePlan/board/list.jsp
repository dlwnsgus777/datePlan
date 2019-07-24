<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

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
			<tr>
				<td><c:out value="${planBoard.BOARD_NO}"></c:out></td>
				<td onclick="javascript:alert('asd');"><c:out value="${planBoard.REG_DT}"></c:out></td>
				<td><c:out value="${planBoard.REG_ID}"></c:out></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
