<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng ký</title>
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

.register-container {
	background: white;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	width: 100%;
	max-width: 400px;
}

.register-header {
	text-align: center;
	margin-bottom: 25px;
}

.register-header h2 {
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

.register-btn {
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

.register-btn:hover {
	background: #084fb3;
}

.login-link {
	text-align: center;
}

.login-link a {
	color: #0b77ff;
	text-decoration: none;
	font-size: 14px;
}

.login-link a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<div class="register-container">
		<div class="register-header">
			<h2>Đăng ký</h2>
		</div>
		
		<c:if test="${not empty alert}">
			<div class="alert">${alert}</div>
		</c:if>
		
		<form action="<c:url value='/register'/>" method="post">
			<div class="form-group">
				<label for="fullName">Họ tên</label>
				<input type="text" id="fullName" name="fullName" required>
			</div>
			
			<div class="form-group">
				<label for="email">Email</label>
				<input type="email" id="email" name="email">
			</div>
			
			<div class="form-group">
				<label for="username">Username</label>
				<input type="text" id="username" name="username" required>
			</div>
			
			<div class="form-group">
				<label for="password">Password</label>
				<input type="password" id="password" name="password" required>
			</div>
			
			<button type="submit" class="register-btn">Tạo tài khoản</button>
		</form>
		
		<div class="login-link">
			<a href="<c:url value='/login'/>">Đã có tài khoản? Đăng nhập</a>
		</div>
	</div>
</body>
</html>
