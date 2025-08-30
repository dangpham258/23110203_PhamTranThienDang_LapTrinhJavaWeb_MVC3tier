<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="pageTitle" value="Admin Home" />
<jsp:include page="/views/admin/_header.jsp" />

<div class="card">
	<div class="card-head">
		<div class="card-title">Trang chủ quản trị</div>
	</div>
	<div class="card-body" style="padding: 16px;">Chọn menu bên trái
		để quản lý.</div>
</div>

<jsp:include page="/views/admin/_footer.jsp" />
