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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <h3 class="nab">Student</h3>
    <div class="container-fluid">
        <a class="navbar-brand" href="#"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page"></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"></a>
                </li>
            </ul>
            <form class="d-flex" role="search">
                <input type="text"  name="searchQuery" placeholder="tìm kiếm" width="200px">
                <button type="submit" class="btn btn-primary">search</button>
            </form>
        </div>
    </div>
</nav>
<div>
    <ul>
            <li><a href="#"><button type="button" class="btn btn-secondary btn-lg"><a href="student?action=create">add new</a></button></a></li>
    </ul>
</div>
<div align="center">
    <form action="student" method="get">
<%--        <input type="text"  name="searchQuery" placeholder="tìm kiếm" width="200px">--%>
<%--        <button type="submit" class="btn btn-primary">Tìm Kiếm</button>--%>
        <button type="submit" class="btn btn-primary">show list</button>
    </form>
    <table border="1" cellpadding="4" class="table table-striped">
        <tr>
            <th>id</th>
            <th>name</th>
            <th>age</th>
            <th>address</th>
            <th>action</th>
        </tr>
        <c:forEach var="student" items="${list}">
            <tr>
                <td><c:out value="${student.id}"/></td>
                <td><c:out value="${student.name}"/></td>
                <td><c:out value="${student.age}"/></td>
                <td><c:out value="${student.address}"/></td>
                <td><a href="?action=delete&id=${student.id}">Delete</a></td>
            </tr>
        </c:forEach>
        </tr>
    </table>
<%--    <button type="button" class="btn btn-primary">Primary Button</button>--%>
</div>
<script src="resources/bootstrap/bootstrap.min.js"></script>
</body>
</html>
