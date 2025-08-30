<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>Đăng ký</title>
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
	font: 16px/1.45 system-ui, Segoe UI, Roboto, Helvetica, Arial;
	color: #e5e7eb;
}

.card {
	width: min(520px, 94vw);
	background: var(--card);
	padding: 28px 26px;
	border-radius: 18px;
	box-shadow: 0 20px 40px rgba(0, 0, 0, .45), inset 0 0 0 1px
		rgba(255, 255, 255, .04);
}

h2 {
	margin: 0 0 18px;
	font-size: 22px;
	font-weight: 700;
	letter-spacing: .2px
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

.alert {
	background: #7f1d1d;
	color: #fecaca;
	padding: 10px 12px;
	border-radius: 10px;
	margin: 10px 0
}

.mt16 {
	margin-top: 16px
}

.link {
	color: #93c5fd;
	text-decoration: none
}

.link:hover {
	text-decoration: underline
}
</style>
</head>
<body>
	<div class="card">
		<h2>Tạo tài khoản mới</h2>

		<!-- Hiển thị thông báo nếu controller đặt request.setAttribute("alert", "...") -->
		<%
		String alert = (String) request.getAttribute("alert");
		if (alert != null) {
		%>
		<div class="alert"><%=alert%></div>
		<%
		}
		%>

		<!-- MỞ TRỰC TIẾP: topbar href="register.jsp" vẫn vào được -->
		<!-- SUBMIT: luôn post tuyệt đối về /register (servlet) -->
		<form method="post" action="<%=request.getContextPath()%>/register">
			<div class="form-group">
				<label for="username">Tài khoản</label> <input class="input"
					type="text" id="username" name="username" required
					autocomplete="username">
			</div>

			<div class="form-group">
				<label for="password">Mật khẩu</label> <input class="input"
					type="password" id="password" name="password" required
					autocomplete="new-password">
			</div>

			<div class="form-group">
				<label for="email">Email</label> <input class="input" type="email"
					id="email" name="email" required autocomplete="email">
			</div>

			<div class="form-group">
				<label for="fullname">Họ và tên</label> <input class="input"
					type="text" id="fullname" name="fullname" required>
			</div>

			<div class="form-group">
				<label for="phone">Số điện thoại</label> <input class="input"
					type="tel" id="phone" name="phone" pattern="[0-9]{9,11}">
			</div>

			<div class="mt16">
				<button type="submit" class="btn">Đăng ký</button>
				<a class="link" style="margin-left: 12px"
					href="<%=request.getContextPath()%>/login">Đã có tài khoản?
					Đăng nhập</a>
			</div>
		</form>
	</div>
</body>
</html>