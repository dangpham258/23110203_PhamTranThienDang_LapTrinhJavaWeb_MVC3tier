<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quên mật khẩu</title>
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

.forgot-container {
	background: white;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	width: 100%;
	max-width: 400px;
}

.forgot-header {
	text-align: center;
	margin-bottom: 25px;
}

.forgot-header h2 {
	color: #e63946;
	font-size: 24px;
	margin-bottom: 8px;
}

.alert {
	background: #e8f5e8;
	color: #2d5a2d;
	padding: 10px;
	border-radius: 5px;
	margin-bottom: 15px;
	font-size: 14px;
}

.alert.error {
	background: #fee;
	color: #c33;
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

.reset-btn {
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

.reset-btn:hover {
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
	<div class="forgot-container">
		<div class="forgot-header">
			<h2>Quên mật khẩu</h2>
		</div>
		
		<c:if test="${not empty alert}">
			<div class="alert ${alert.contains('thành công') ? '' : 'error'}">${alert}</div>
		</c:if>
		
		<form action="<c:url value='/forgot'/>" method="post">
			<div class="form-group">
				<label for="username">Username</label>
				<input type="text" id="username" name="username" required>
			</div>
			
			<div class="form-group">
				<label for="newPassword">Mật khẩu mới</label>
				<input type="password" id="newPassword" name="newPassword" required>
			</div>
			
			<button type="submit" class="reset-btn">Đổi mật khẩu</button>
		</form>
		
		<div class="login-link">
			<a href="<c:url value='/login'/>">Quay lại đăng nhập</a>
		</div>
	</div>
</body>
</html>
