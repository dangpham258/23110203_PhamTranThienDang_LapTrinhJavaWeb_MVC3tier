<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${empty item ? 'Thêm danh mục' : 'Chỉnh sửa danh mục'}</title>
<style>
body {
	margin: 0;
	font-family: Arial, sans-serif;
	background: #f5f7fb
}

.layout {
	display: flex;
	min-height: 100vh
}

.sidebar {
	width: 220px;
	background: #0b77ff;
	color: #fff
}

.sidebar .brand {
	padding: 18px;
	font-size: 22px;
	font-weight: 700
}

.sidebar a {
	display: block;
	color: #fff;
	text-decoration: none;
	padding: 12px 18px
}

.sidebar a:hover, .sidebar a.active {
	background: #084fb3
}

.content {
	flex: 1
}

.topbar {
	background: #fff;
	box-shadow: 0 2px 6px rgba(0, 0, 0, .06);
	padding: 12px 20px;
	display: flex;
	justify-content: flex-end;
	gap: 16px
}

.container {
	padding: 22px
}

h2 {
	color: #e63946;
	margin: 8px 0 18px
}

.card {
	background: #fff;
	border-radius: 10px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, .06);
	padding: 18px;
	max-width: 760px
}

.row {
	margin: 12px 0
}

.row label {
	display: block;
	margin-bottom: 6px;
	font-weight: 600
}

.input {
	width: 100%;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 8px
}

.actions {
	display: flex;
	gap: 10px;
	margin-top: 16px
}

.btn {
	background: #0b77ff;
	border: none;
	color: #fff;
	padding: 10px 14px;
	border-radius: 8px;
	cursor: pointer;
	text-decoration: none;
	display: inline-block
}

.btn.secondary {
	background: #6b7280
}

img.preview {
	width: 100px;
	height: 100px;
	border-radius: 50%;
	object-fit: cover;
	background: #f2f2f2
}
</style>
</head>
<body>

	<%-- ============ TÍNH postUrl KHÔNG LẶP CONTEXT-PATH ============ --%>
	<c:set var="ctx" value="${pageContext.request.contextPath}" />
	<c:set var="fwd"
		value="${requestScope['jakarta.servlet.forward.request_uri']}" />
	<c:choose>
		<c:when test="${not empty fwd}">
			<c:set var="postPath" value="${fn:substringAfter(fwd, ctx)}" />
		</c:when>
		<c:otherwise>
			<c:set var="uriNow" value="${pageContext.request.requestURI}" />
			<c:set var="postPath" value="${fn:substringAfter(uriNow, ctx)}" />
		</c:otherwise>
	</c:choose>
	<c:url var="postUrl" value="${postPath}" />
	<%-- ============================================================= --%>

	<div class="layout">
		<!-- Sidebar -->
		<div class="sidebar">
			<div class="brand">Dashboard</div>
			<c:choose>
				<c:when
					test="${fn:contains(pageContext.request.requestURI, '/user/')}">
					<a class="active" href="<c:url value='/user/home'/>">Quản lý
						Danh mục</a>
				</c:when>
				<c:when
					test="${fn:contains(pageContext.request.requestURI, '/manager/')}">
					<a class="active" href="<c:url value='/manager/home'/>">Quản lý
						Danh mục</a>
				</c:when>
				<c:otherwise>
					<a class="active" href="<c:url value='/admin/home'/>">Quản lý
						Danh mục</a>
				</c:otherwise>
			</c:choose>
		</div>

		<!-- Content -->
		<div class="content">
			<div class="topbar">
				<span>Xin chào ${sessionScope.auth.fullName}</span> <a
					href="<c:url value='/logout'/>">Đăng xuất</a>
			</div>

			<div class="container">
				<h2>${empty item ? 'Thêm danh mục' : 'Chỉnh sửa danh mục'}</h2>
				<div class="card">
					<form method="post" enctype="multipart/form-data" accept-charset="UTF-8"
						action="${postUrl}">
						<c:if test="${not empty item}">
							<input type="hidden" name="id" value="${item.id}" />
						</c:if>

						<div class="row">
							<label for="name">Tên danh mục</label> <input id="name"
								name="name" class="input" value="${empty item ? '' : item.name}"
								required />
						</div>

						<div class="row">
							<label>Ảnh đại diện</label>
							<c:if test="${not empty item.image}">
								<img class="preview"
									src="<c:url value='/image?fname=${item.image}'/>" alt="preview" />
							</c:if>
							<input type="file" name="image" style="margin-top: 8px" />
						</div>

						<div class="actions">
							<button type="submit" class="btn">${empty item ? 'Thêm mới' : 'Cập nhật'}</button>
							<button type="reset" class="btn secondary">Reset</button>

							<c:choose>
								<c:when
									test="${fn:contains(pageContext.request.requestURI, '/user/')}">
									<a class="btn secondary" href="<c:url value='/user/home'/>">Huỷ</a>
								</c:when>
								<c:when
									test="${fn:contains(pageContext.request.requestURI, '/manager/')}">
									<a class="btn secondary" href="<c:url value='/manager/home'/>">Huỷ</a>
								</c:when>
								<c:otherwise>
									<a class="btn secondary" href="<c:url value='/admin/home'/>">Huỷ</a>
								</c:otherwise>
							</c:choose>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
