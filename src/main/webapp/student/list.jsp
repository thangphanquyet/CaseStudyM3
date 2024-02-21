<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 20/2/2024
  Time: 11:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>quản lý sinh viên</title>
</head>
<body>
<a href="student?action=create">Thêm mới sinh viên</a>
<div align="center">
    <table border="1" cellpadding="4">
        <tr>
            <th>id</th>
            <th>name</th>
            <th>age</th>
            <th>address</th>
        </tr>
        <c:forEach var="student" items="${list}">
            <tr>
                <td><c:out value="${student.id}"/></td>
                <td><c:out value="${student.name}"/></td>
                <td><c:out value="${student.age}"/></td>
                <td><c:out value="${student.address}"/></td>
            </tr>
        </c:forEach>
        </tr>
    </table>
</div>
</body>
</html>
