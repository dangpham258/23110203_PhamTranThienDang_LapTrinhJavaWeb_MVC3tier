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
        <form action="login" method="post">
            <div class="form-group">
                <label for="username">Tài khoản:</label>
                <input type="text" id="username" name="username" required>
            </div>

            <div class="form-group">
                <label for="password">Mật khẩu:</label>
                <input type="password" id="password" name="password" required>
            </div>

            <div class="form-remember">
                <label>
                    <input type="checkbox" name="remember" value="on"> Nhớ tôi
                </label>
            </div>

            <input type="submit" value="Đăng nhập">
        </form>
    </div>
</body>
</html>