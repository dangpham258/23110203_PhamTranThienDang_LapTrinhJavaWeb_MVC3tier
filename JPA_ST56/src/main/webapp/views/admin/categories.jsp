<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Danh mục</title>
</head>
<body>
  <h2>Danh sách Category</h2>

  <c:if test="${empty listcate}">
    <p>Chưa có dữ liệu.</p>
  </c:if>

  <c:if test="${not empty listcate}">
    <table border="1" cellspacing="0" cellpadding="6">
      <thead>
        <tr>
          <th>ID</th>
          <th>Name</th>
          <th>Images</th>
          <th>Status</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="cate" items="${listcate}">
          <tr>
            <td>${cate.id}</td>
            <td>${cate.name}</td>
            <td>${cate.images}</td>
            <td>
              <c:choose>
                <c:when test="${cate.status == 1}">Active</c:when>
                <c:otherwise>Inactive</c:otherwise>
              </c:choose>
            </td>
            <td>
              <a href="${pageContext.request.contextPath}/admin/category/edit?id=${cate.id}">Edit</a>
              |
              <a href="${pageContext.request.contextPath}/admin/category/delete?id=${cate.id}"
                 onclick="return confirm('Xóa category này?')">Delete</a>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </c:if>

  <p><a href="${pageContext.request.contextPath}/admin/category/add">+ Thêm Category</a></p>
</body>
</html>
