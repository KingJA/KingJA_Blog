<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no"/>
    <title>主页</title>
    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/base.css" rel="stylesheet">
    <link href="/css/home.css?v=1" rel="stylesheet">
</head>
<body>
<jsp:include page="../common/nav.jsp"/>
<div class="container_index">
  <jsp:include page="../common/article_list.jsp"/>
  <jsp:include page="../common/right_side.jsp"/>
</div>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>