<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<table class="table table-bordered table-hover">
	  <colgroup>
         <col width="auto%;">
      </colgroup>
	<thead>
		<tr>
			<th>날짜</th>
			<th style="width:15%;">작성자</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${planBoard }" var="planBoard">
			<tr>
				<%-- <td><c:out value="${planBoard.BOARD_NO}"></c:out></td> --%>
				<td><a href="javascript:;" style="color:black;" onclick="modalEvent.makeModal('${planBoard.BOARD_NO}')"><c:out value="${planBoard.REG_DT}"></c:out></a></td>
				<td><c:out value="${planBoard.REG_ID}"></c:out></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
