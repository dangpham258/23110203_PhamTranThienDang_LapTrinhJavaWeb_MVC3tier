<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Admin</title>
<link rel="stylesheet" href="<c:url value='/assets/css/admin.css'/>" />
</head>
<body>
	<div class="admin-layout">
		<!-- SIDEBAR -->
		<aside class="admin-sidebar">
			<div class="admin-brand">
				<div class="brand-title">Dashboard</div>
			</div>

			<div class="admin-profile">
				<c:set var="avatarUrl"
					value="${empty sessionScope.account.avatar ? '/assets/img/avatar.png' : sessionScope.account.avatar}" />
				<img class="avatar" src="<c:url value='${avatarUrl}'/>" alt="avatar" />
				<div class="role">Bạn là Admin</div>
				<div class="hello">
					<c:if test="${not empty sessionScope.account}">
          Xin chào ${sessionScope.account.fullName}
        </c:if>
				</div>
				<p style="margin-top: 8px;">
					<a class="btn-logout" href="<c:url value='/logout'/>">Đăng xuất</a>
				</p>
			</div>

			<c:set var="uri" value="${pageContext.request.requestURI}" />
			<nav class="admin-menu">
				<a class="item ${fn:contains(uri,'/admin/home') ? 'active' : ''}"
					href="<c:url value='/admin/home'/>">⏱ Dashboard</a>

				<div class="group-title">Quản lý Danh mục</div>
				<a
					class="item ${fn:contains(uri,'/admin/category/add') ? 'active' : ''}"
					href="<c:url value='/admin/category/add'/>">📁 Thêm danh mục
					mới</a> <a
					class="item ${(fn:contains(uri,'/admin/category/list') or fn:contains(uri,'/admin/category/edit')) ? 'active' : ''}"
					href="<c:url value='/admin/category/list'/>">📋 Danh sách danh
					mục</a>

				<div class="group-title">Khác</div>
				<a class="item" href="javascript:void(0)">🛒 Quản lý sản phẩm</a> <a
					class="item" href="javascript:void(0)">👤 Quản lý tài khoản</a>
			</nav>
		</aside>

		<!-- MAIN -->
		<main class="admin-main">
			<div class="admin-topbar">
				<div class="page-title">
					<c:out
						value="${pageTitle != null ? pageTitle : 'Quản lý danh mục'}" />
				</div>
				<div class="page-right">
					<c:if test="${not empty sessionScope.account}">
          Xin chào ${sessionScope.account.fullName}
        </c:if>
				</div>
			</div>

			<div class="admin-content">