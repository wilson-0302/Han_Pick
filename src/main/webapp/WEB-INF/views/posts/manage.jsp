<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>내 게시글 관리</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 8px 12px;
            text-align: left;
        }
        th {
            background: #f5f5f5;
        }
    </style>
</head>
<body>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<h1>내 게시글 관리</h1>

<c:if test="${empty posts}">
    <p>작성한 게시글이 없습니다.</p>
</c:if>

<c:if test="${not empty posts}">
    <table>
        <thead>
        <tr>
            <th>제목</th>
            <th>카테고리</th>
            <th>상태</th>
            <th>조회수</th>
            <th>액션</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="post" items="${posts}">
            <tr>
                <td><a href="${ctx}/posts/detail?id=${post.id}"><c:out value="${post.title}"/></a></td>
                <td><c:out value="${post.category}"/></td>
                <td><c:out value="${post.status}"/></td>
                <td><c:out value="${post.viewCount}"/></td>
                <td>
                    <form action="${ctx}/posts/delete" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="${post.id}">
                        <button type="submit">삭제</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>
</body>
</html>
