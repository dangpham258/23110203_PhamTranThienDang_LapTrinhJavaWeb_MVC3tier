<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="pageTitle" value="Chỉnh sửa danh mục" />
<jsp:include page="/views/admin/_header.jsp" />

<div class="panel">
	<div class="panel-head">Chỉnh sửa danh mục</div>
	<div class="panel-body">
		<form class="form" action="<c:url value='/admin/category/edit'/>"
			method="post" enctype="multipart/form-data">
			<input type="hidden" name="id" value="${category.id}" />

			<div class="form-row">
				<label class="form-label">Danh mục:</label> <input
					class="form-input" type="text" name="name" value="${category.name}"
					required />
			</div>

			<div class="form-row">
				<label class="form-label">Ảnh hiện tại</label>
				<c:url value="/image" var="img">
					<c:param name="fname" value="${category.icon}" />
				</c:url>
				<img id="preview" class="thumb round xl" src="${img}"
					alt="${category.name}" />
			</div>

			<div class="form-row">
				<label class="form-label">Ảnh đại diện</label> <input
					class="form-input" type="file" name="icon" accept="image/*" />
			</div>

			<div class="form-actions">
				<button class="btn-primary" type="submit">Edit</button>
				<button class="btn-gray" type="reset">Reset</button>
			</div>
		</form>
	</div>
</div>

<jsp:include page="/views/admin/_footer.jsp" />
