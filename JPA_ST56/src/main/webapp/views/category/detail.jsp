<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết danh mục</title>
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
	max-width: 600px
}

.detail-row {
	margin: 16px 0;
	padding: 12px;
	border: 1px solid #eee;
	border-radius: 8px;
	background: #f9f9f9
}

.detail-row label {
	font-weight: 600;
	color: #333;
	display: block;
	margin-bottom: 4px
}

.detail-row .value {
	color: #666;
	font-size: 16px
}

.img-detail {
	width: 200px;
	height: 200px;
	border-radius: 10px;
	object-fit: cover;
	background: #f1f1f1;
	margin: 8px 0
}

.btn {
	background: #0b77ff;
	border: none;
	color: #fff;
	padding: 10px 14px;
	border-radius: 8px;
	cursor: pointer;
	text-decoration: none;
	display: inline-block;
	margin-right: 8px
}

.btn.secondary {
	background: #6b7280
}
</style>
</head>
<body>
	<div class="layout">
		<!-- Sidebar -->
		<div class="sidebar">
			<div class="brand">Dashboard</div>
			<c:choose>
				<c:when test="${fn:contains(pageContext.request.requestURI, '/user/')}">
					<a href="<c:url value='/user/home'/>">Quản lý Danh mục</a>
					<a class="active" href="<c:url value='/user/category/add'/>">Thêm danh mục mới</a>
				</c:when>
				<c:when test="${fn:contains(pageContext.request.requestURI, '/manager/')}">
					<a href="<c:url value='/manager/home'/>">Quản lý Danh mục</a>
					<a class="active" href="<c:url value='/manager/category/add'/>">Thêm danh mục mới</a>
				</c:when>
				<c:otherwise>
					<a href="<c:url value='/admin/home'/>">Quản lý Danh mục</a>
					<a class="active" href="<c:url value='/admin/category/add'/>">Thêm danh mục mới</a>
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
				<h2>Chi tiết danh mục</h2>
				<div class="card">
					<c:if test="${not empty item}">
						<div class="detail-row">
							<label>ID:</label>
							<div class="value">${item.id}</div>
						</div>
						
						<div class="detail-row">
							<label>Tên danh mục:</label>
							<div class="value">${item.name}</div>
						</div>
						
						<div class="detail-row">
							<label>Chủ sở hữu:</label>
							<div class="value">${item.user.fullName} (${item.user.username})</div>
						</div>
						
						<c:if test="${not empty item.image}">
							<div class="detail-row">
								<label>Hình ảnh:</label>
								<img class="img-detail" src="<c:url value='/image?fname=${item.image}'/>" alt="Category Image" />
							</div>
						</c:if>
						
						<div style="margin-top: 20px;">
							<c:choose>
								<c:when test="${fn:contains(pageContext.request.requestURI, '/user/')}">
									<a class="btn" href="<c:url value='/user/home'/>">Quay lại</a>
									<c:if test="${item.user.id == sessionScope.auth.id}">
										<a class="btn secondary" href="<c:url value='/user/category/edit?id=${item.id}'/>">Chỉnh sửa</a>
									</c:if>
								</c:when>
								<c:when test="${fn:contains(pageContext.request.requestURI, '/manager/')}">
									<a class="btn" href="<c:url value='/manager/home'/>">Quay lại</a>
									<c:if test="${item.user.id == sessionScope.auth.id}">
										<a class="btn secondary" href="<c:url value='/manager/category/edit?id=${item.id}'/>">Chỉnh sửa</a>
									</c:if>
								</c:when>
								<c:otherwise>
									<a class="btn" href="<c:url value='/admin/home'/>">Quay lại</a>
									<a class="btn secondary" href="<c:url value='/admin/category/edit?id=${item.id}'/>">Chỉnh sửa</a>
								</c:otherwise>
							</c:choose>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
