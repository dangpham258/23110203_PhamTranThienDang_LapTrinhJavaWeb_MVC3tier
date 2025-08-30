<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<title>Quên mật khẩu</title>
</head>
<body>
	<h2>Quên mật khẩu</h2>
	<c:if test="${alert != null}">
		<div style="color: red">${alert}</div>
	</c:if>
	<form method="post" action="${pageContext.request.contextPath}/forgot">
		<label>Username:</label> <input type="text" name="username"><br />

		<label>Email:</label> <input type="email" name="email"><br />

		<label>Mật khẩu mới:</label> <input type="password" name="newPassword"><br />

		<label>Nhập lại mật khẩu:</label> <input type="password"
			name="confirmPassword"><br />

		<button type="submit">Đặt lại mật khẩu</button>
	</form>

	<button type="button" class="btn btn-secondary"
		onclick="window.location.href='${pageContext.request.contextPath}/login'">Quay
		về đăng nhập</button>
</body>
</html>