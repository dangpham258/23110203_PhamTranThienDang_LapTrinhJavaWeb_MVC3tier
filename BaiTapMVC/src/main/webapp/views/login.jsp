<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
</head>
<body>
	<div class="login-box">
		<h2>Đăng nhập</h2>
		<form action="<c:url value='/login'/>" method="post">
			<div>
				<label for="username">Tài khoản:</label> <input type="text"
					id="username" name="username" required>
			</div>
			<div>
				<label for="password">Mật khẩu:</label> <input type="password"
					id="password" name="password" required>
			</div>
			<div>
				<label><input type="checkbox" name="remember" value="on">
					Nhớ tôi</label>
			</div>
			<p>
				<a href="<c:url value='/forgot'/>">Quên mật khẩu?</a>
			</p>
			<input type="submit" value="Đăng nhập">
		</form>
	</div>
</body>
</html>