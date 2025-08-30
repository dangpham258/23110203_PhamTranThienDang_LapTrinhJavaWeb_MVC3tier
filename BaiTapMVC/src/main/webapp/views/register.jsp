<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng ký</title>
</head>
<body>
	<form action="register" method="post">
		<h2>Tạo tài khoản mới</h2>

		<c:if test="${alert != null}">
			<div class="alert alert-danger" role="alert">${alert}</div>
		</c:if>

		<section>
			<label class="input login-input">
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-user"></i></span> <input
						type="text" name="username" class="form-control"
						placeholder="Tài khoản" required>
				</div>
			</label>
		</section>

		<section>
			<label class="input login-input">
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-lock"></i></span> <input
						type="password" name="password" class="form-control"
						placeholder="Mật khẩu" required>
				</div>
			</label>
		</section>

		<section>
			<label class="input login-input">
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-envelope"></i></span>
					<input type="email" name="email" class="form-control"
						placeholder="Email" required>
				</div>
			</label>
		</section>

		<section>
			<label class="input login-input">
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-id-card"></i></span>
					<input type="text" name="fullname" class="form-control"
						placeholder="Họ và tên" required>
				</div>
			</label>
		</section>

		<section>
			<label class="input login-input">
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-phone"></i></span>
					<input type="tel" name="phone" class="form-control"
						placeholder="Số điện thoại">
				</div>
			</label>
		</section>

		<button type="submit" class="btn btn-primary">Đăng ký</button>
	</form>
</body>
</html>