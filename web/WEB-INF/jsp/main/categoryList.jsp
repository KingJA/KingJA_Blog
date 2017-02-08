<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${categoryName} | KingJA</title>
    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/home.css" rel="stylesheet">
    <link href="/css/base.css" rel="stylesheet">
</head>
<body>

<nav>

</nav>

<div class="container">
    <jsp:include page="../common/article_list.jsp"/>
    <jsp:include page="../common/right_side.jsp"/>
</div>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>