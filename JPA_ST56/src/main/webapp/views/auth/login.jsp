<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
<style>
body {
	margin: 0;
	font-family: Arial;
	background: #f5f7fb;
	display: flex;
	align-items: center;
	justify-content: center;
	min-height: 100vh;
}

.login-container {
	background: white;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	width: 100%;
	max-width: 400px;
}

.login-header {
	text-align: center;
	margin-bottom: 25px;
}

.login-header h2 {
	color: #e63946;
	font-size: 24px;
	margin-bottom: 8px;
}

.alert {
	background: #fee;
	color: #c33;
	padding: 10px;
	border-radius: 5px;
	margin-bottom: 15px;
	font-size: 14px;
}

.form-group {
	margin-bottom: 15px;
}

.form-group label {
	display: block;
	margin-bottom: 5px;
	color: #333;
	font-weight: 600;
}

.form-group input {
	width: 100%;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
	font-size: 14px;
}

.role-selection {
	margin: 15px 0;
}

.role-selection label {
	display: inline-block;
	margin-right: 15px;
	cursor: pointer;
	font-size: 14px;
}

.role-selection input[type="radio"] {
	width: auto;
	margin-right: 5px;
}

.login-btn {
	width: 100%;
	background: #0b77ff;
	color: white;
	padding: 10px;
	border: none;
	border-radius: 5px;
	font-size: 16px;
	cursor: pointer;
	margin-bottom: 15px;
}

.login-btn:hover {
	background: #084fb3;
}

.links {
	text-align: center;
}

.links a {
	color: #0b77ff;
	text-decoration: none;
	margin: 0 10px;
	font-size: 14px;
}

.links a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<div class="login-container">
		<div class="login-header">
			<h2>Đăng nhập</h2>
		</div>
		
		<c:if test="${not empty alert}">
			<div class="alert">${alert}</div>
		</c:if>
		
		<form action="<c:url value='/login'/>" method="post">
			<div class="form-group">
				<label for="username">Tài khoản</label>
				<input type="text" id="username" name="username" required>
			</div>
			
			<div class="form-group">
				<label for="password">Mật khẩu</label>
				<input type="password" id="password" name="password" required>
			</div>
			
			<div class="role-selection">
				<label>
					<input type="radio" name="role" value="1" checked>
					User
				</label>
				<label>
					<input type="radio" name="role" value="2">
					Manager
				</label>
				<label>
					<input type="radio" name="role" value="3">
					Admin
				</label>
			</div>
			
			<button type="submit" class="login-btn">Đăng nhập</button>
		</form>
		
		<div class="links">
			<a href="<c:url value='/forgot'/>">Quên mật khẩu?</a>
			<a href="<c:url value='/register'/>">Đăng ký</a>
		</div>
	</div>
</body>
</html>
