<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<span class="close">×</span>
<span class="reg-dt"><c:out value="${boardDetail.REG_DT}" /></span>
<span class="reg-id"><c:out value="${boardDetail.REG_ID}" /></span>

<div class="main-content">
	<c:out value="${boardDetail.BOARD_CONTENT}" />
</div>