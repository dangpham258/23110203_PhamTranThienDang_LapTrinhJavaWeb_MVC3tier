<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard - Manager</title>
<style>
body {
	margin: 0;
	font-family: Arial;
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
	padding: 18px
}

table {
	width: 100%;
	border-collapse: collapse
}

th, td {
	padding: 10px 12px;
	border-bottom: 1px solid #eee;
	text-align: left
}

th {
	background: #f7f9fe;
	font-weight: 700
}

.img {
	width: 60px;
	height: 60px;
	border-radius: 10px;
	object-fit: cover;
	background: #f1f1f1
}

.actions a {
	color: #0b77ff;
	text-decoration: none;
	margin-right: 8px
}

.btn {
	display: inline-block;
	background: #0b77ff;
	color: #fff;
	padding: 8px 12px;
	border-radius: 8px;
	text-decoration: none
}

.filter {
	margin-bottom: 14px;
	display: flex;
	gap: 8px;
	align-items: center
}

.filter input {
	padding: 8px;
	border: 1px solid #ddd;
	border-radius: 8px;
	width: 140px
}

.muted {
	color: #6b7280;
	font-size: 13px;
	margin-left: 8px
}
</style>
</head>
<body>
	<div class="layout">
		<!-- Sidebar -->
		<div class="sidebar">
			<div class="brand">Manager</div>
			<a class="active" href="<c:url value='/manager/home'/>">Quản lý
				Danh mục</a> <a href="<c:url value='/manager/category/add'/>">Thêm
				danh mục mới</a>
		</div>

		<!-- Content -->
		<div class="content">
			<div class="topbar">
				<span>Xin chào ${sessionScope.auth.fullName} (Manager)</span> <a
					href="<c:url value='/logout'/>">Đăng xuất</a>
			</div>

			<div class="container">
				<h2>Danh mục theo người dùng</h2>

				<!-- Bộ lọc userId -->
				<form class="filter" method="get"
					action="<c:url value='/manager/home'/>">
					<label for="uid">Xem danh mục của userId:</label> <input id="uid"
						name="uid" type="number" value="${uid}" min="1" />
					<button class="btn" type="submit">Lọc</button>
					<span class="muted">Để trống = xem của chính bạn</span>
				</form>

				<div class="card">
					<table>
						<tr>
							<th>STT</th>
							<th>Hình ảnh</th>
							<th>Tên danh mục</th>
							<th>Chủ sở hữu</th>
							<th>Hành động</th>
						</tr>
						<c:forEach var="c" items="${items}" varStatus="i">
							<tr>
								<td>${i.index + 1}</td>
								<td><c:if test="${not empty c.image}">
										<img class="img"
											src="<c:url value='/image?fname=${c.image}'/>" alt="img" />
									</c:if></td>
								<td>${c.name}</td>
								<td>${c.user.fullName}(id=${c.user.id})</td>
								<td class="actions">
									<c:if test="${c.user.id == sessionScope.auth.id}">
										<a href="<c:url value='/manager/category/edit?id=${c.id}'/>">Sửa</a>
										<a href="<c:url value='/manager/category/delete?id=${c.id}'/>"
											onclick="return confirm('Xoá danh mục này?')">Xoá</a>
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</table>

					<div style="margin-top: 12px">
						<a class="btn" href="<c:url value='/manager/category/add'/>">+
							Thêm danh mục</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
