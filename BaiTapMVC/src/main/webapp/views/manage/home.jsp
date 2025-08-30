<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manager</title>
</head>
<body>
	<nav>
		<a href="<c:url value='/manager/home'/>">Trang chủ</a> | <a
			href="<c:url value='/admin/category/list'/>">Quản lý Category</a> | <a
			href="<c:url value='/logout'/>">Đăng xuất</a>
	</nav>
	<hr />
	<h2>Manager Home</h2>
	<p>Chọn menu để thao tác.</p>
</body>
</html>
