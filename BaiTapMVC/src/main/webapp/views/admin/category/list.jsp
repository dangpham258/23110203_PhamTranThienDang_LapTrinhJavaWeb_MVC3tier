<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="pageTitle" value="Quản lý danh mục" />
<jsp:include page="/views/admin/_header.jsp" />

<div class="card">
	<div class="card-head">
		<div class="card-title">Danh sách danh mục</div>

		<form class="toolbar" method="get" action="">
			<label class="select"> <select name="size">
					<option>10</option>
					<option>20</option>
					<option>50</option>
			</select> <span>records per page</span>
			</label> <label class="search"> <span>Search:</span> <input
				type="text" name="q" value="${param.q}" placeholder="Nhập tên..." />
			</label> <a class="btn-primary" href="<c:url value='/admin/category/add'/>">+
				Thêm mới</a>
		</form>
	</div>

	<div class="table-wrap">
		<table class="table">
			<thead>
				<tr>
					<th>STT</th>
					<th>Hình ảnh</th>
					<th>Tên danh mục</th>
					<th>Hành động</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${cateList}" var="cate" varStatus="st">
					<tr>
						<td class="center">${st.index + 1}</td>
						<td><c:if test="${not empty cate.icon}">
								<c:url value="/image" var="img">
									<c:param name="fname" value="${cate.icon}" />
								</c:url>
								<img class="thumb round" src="${img}" alt="${cate.name}" />
							</c:if></td>
						<td>${cate.name}</td>
						<td class="actions"><a class="link"
							href="<c:url value='/admin/category/edit?id=${cate.id}'/>">Sửa</a>
							<span class="sep">|</span> <a class="link danger"
							href="<c:url value='/admin/category/delete?id=${cate.id}'/>"
							onclick="return confirm('Xóa danh mục này?');">Xóa</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<jsp:include page="/views/admin/_footer.jsp" />
