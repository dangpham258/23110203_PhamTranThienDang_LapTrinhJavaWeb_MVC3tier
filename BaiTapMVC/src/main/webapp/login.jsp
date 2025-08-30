<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
:root {
	--bg: #0f172a;
	--card: #111827;
	--muted: #9ca3af;
	--accent: #2563eb;
}

* {
	box-sizing: border-box
}

body {
	margin: 0;
	min-height: 100vh;
	display: grid;
	place-items: center;
	background: linear-gradient(135deg, #0b1021, #111827);
	font: 16px/1.4 system-ui, Segoe UI, Roboto, Helvetica, Arial;
	color: #e5e7eb;
}

.login-card {
	width: min(420px, 92vw);
	background: var(--card);
	padding: 28px 26px;
	border-radius: 18px;
	box-shadow: 0 20px 40px rgba(0, 0, 0, .45), inset 0 0 0 1px
		rgba(255, 255, 255, .04);
}

.login-title {
	margin: 0 0 18px;
	font-weight: 700;
	letter-spacing: .2px;
	font-size: 22px
}

.form-group {
	margin: 14px 0
}

label {
	display: block;
	margin: 0 0 6px;
	color: var(--muted);
	font-size: 14px
}

.input {
	width: 100%;
	padding: 12px 14px;
	border-radius: 12px;
	background: #0b1021;
	color: #e5e7eb;
	border: 1px solid rgba(255, 255, 255, .08);
	outline: none;
	transition: border-color .2s, box-shadow .2s;
}

.input:focus {
	border-color: var(--accent);
	box-shadow: 0 0 0 3px rgba(37, 99, 235, .25)
}

.remember {
	display: flex;
	align-items: center;
	gap: 8px;
	margin: 10px 0 4px;
	color: #cbd5e1;
	font-size: 14px
}

.actions {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-top: 16px
}

.link {
	color: #93c5fd;
	text-decoration: none
}

.link:hover {
	text-decoration: underline
}

.btn {
	appearance: none;
	border: 0;
	padding: 12px 18px;
	border-radius: 12px;
	cursor: pointer;
	background: var(--accent);
	color: #fff;
	font-weight: 600;
	letter-spacing: .2px;
	box-shadow: 0 10px 24px rgba(37, 99, 235, .35);
	transition: transform .05s ease;
}

.btn:active {
	transform: translateY(1px)
}
</style>
</head>
<body>
	<div class="login-card">
		<h2 class="login-title">Đăng nhập</h2>

		<form method="post" action="${pageContext.request.contextPath}/login">
			<div class="form-group">
				<label for="username">Tài khoản</label> <input class="input"
					type="text" id="username" name="username" required
					autocomplete="username">
			</div>

			<div class="form-group">
				<label for="password">Mật khẩu</label> <input class="input"
					type="password" id="password" name="password" required
					autocomplete="current-password">
			</div>

			<label class="remember"> <input type="checkbox"
				name="remember" value="on"> Nhớ tôi
			</label>

			<div class="actions">
				<a class="link" href="${pageContext.request.contextPath}/forgot">Quên
					mật khẩu?</a> <input class="btn" type="submit" value="Đăng nhập">
			</div>
		</form>
	</div>
</body>
</html>