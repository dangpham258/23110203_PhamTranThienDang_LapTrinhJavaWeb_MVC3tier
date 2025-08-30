<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="pageTitle" value="Thêm danh mục" />
<jsp:include page="/views/admin/_header.jsp" />

<div class="panel">
	<div class="panel-head">Thêm danh mục</div>
	<div class="panel-body">
		<form class="form" action="<c:url value='/admin/category/add'/>"
			method="post" enctype="multipart/form-data">
			<div class="form-row">
				<label class="form-label">Danh mục:</label> <input
					class="form-input" type="text" name="name"
					placeholder="Nhập tên..." required />
			</div>

			<div class="form-row">
				<label class="form-label">Ảnh đại diện</label> <input
					class="form-input" type="file" name="icon" accept="image/*" />
			</div>

			<div class="form-row">
				<label class="form-label">Preview</label> <img id="preview"
					class="thumb round xl hidden" alt="preview" />
			</div>

			<div class="form-actions">
				<button class="btn-primary" type="submit">Create</button>
				<a class="btn-gray" href="<c:url value='/admin/category/list'/>">Hủy</a>
			</div>
		</form>
	</div>
</div>

<jsp:include page="/views/admin/_footer.jsp" />
