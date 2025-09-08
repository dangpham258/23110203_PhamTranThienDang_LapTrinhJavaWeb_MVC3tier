<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard - Admin</title>
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
</style>
</head>
<body>
	<div class="layout">
		<!-- Sidebar -->
		<div class="sidebar">
			<div class="brand">Admin</div>
			<a class="active" href="<c:url value='/admin/home'/>">Quản lý
				Danh mục</a> <a href="<c:url value='/admin/category/add'/>">Thêm
				danh mục mới</a>
		</div>

		<!-- Content -->
		<div class="content">
			<div class="topbar">
				<span>Xin chào ${sessionScope.auth.fullName} (Admin)</span> <a
					href="<c:url value='/logout'/>">Đăng xuất</a>
			</div>

			<div class="container">
				<h2>Tất cả danh mục</h2>
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
								<td>${i.index+1}</td>
								<td><c:if test="${not empty c.image}">
										<img class="img"
											src="<c:url value='/image?fname=${c.image}'/>" />
									</c:if></td>
								<td>${c.name}</td>
								<td>${c.user.fullName}</td>
								<td class="actions"><a
									href="<c:url value='/admin/category/edit?id=${c.id}'/>">Sửa</a>
									<a href="<c:url value='/admin/category/delete?id=${c.id}'/>"
									onclick="return confirm('Xoá danh mục này?')">Xoá</a></td>
							</tr>
						</c:forEach>
					</table>

					<div style="margin-top: 12px">
						<a class="btn" href="<c:url value='/admin/category/add'/>">+
							Thêm danh mục</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
