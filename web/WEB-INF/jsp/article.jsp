<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="/img/icon.jpg">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>管理员</title>
    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/admin.css" rel="stylesheet">
    <link href="/css/base.css" rel="stylesheet">
</head>
<body>
<jsp:include page="nav.jsp"></jsp:include>

<div class="container">

    <div class="admin-logo">${sessionScope.User.nick}
        <p><a href="/article/edit">发布新文章</a></p>
    </div>
    <div class="control-wrap">
        <div class="control-nav">
            <ul class="control-ul">
                <li><a class="active control-nav-a" href="#">文章管理</a></li>
                <li><a class="control-nav-a" href="#">账号管理</a></li>
                <li><a class="control-nav-a" href="#">评论管理</a></li>
                <li><a class="control-nav-a" href="#">草稿箱</a></li>
            </ul>
        </div>
        <div class="control-display">

            <table cellspacing="0">
                <tr class="th-title">
                    <th class="col-w-6">标题</th>
                    <th class="col-w-1">阅读数</th>
                    <th class="col-w-1">评论数</th>
                    <th class="col-w-2">操作</th>
                </tr>
                <c:if test="${!empty articlePage.pageDatas}">
                    <c:forEach items="${articlePage.pageDatas}" var="article">
                        <tr>
                            <td class="td-title"><a href="#">${article.title}</a><span>(${article.createTime})</span>
                            </td>
                            <td>${article.readCount}</td>
                            <td>${article.commentCount}</td>
                            <td><a href="#">编辑</a>&nbsp;|&nbsp;<a href="#">置顶</a>&nbsp;|&nbsp; <a href="#">删除</a></td>
                        </tr>
                    </c:forEach>
                </c:if>
            </table>
            <ul class="pagination">
                <c:if test="${articlePage.hasPrevious}">
                    <li>
                        <a href="/article/${articlePage.previousPage}">&laquo;上一页</a>
                    </li>
                </c:if>

                <c:forEach var="x" begin="${articlePage.pageStart}"
                           end="${articlePage.pageEnd}">

                    <c:if test="${articlePage.currentPage==x}">
                        <li class="active"><a href="javascript:return false;">${x}</a></li>
                    </c:if>
                    <c:if test="${articlePage.currentPage!=x}">
                        <li><a href="/article/${x}">${x}</a></li>
                    </c:if>
                </c:forEach>


                <c:if test="${articlePage.hasNext}">
                    <li><a href="/article/${articlePage.nextPage}">下一页&raquo;</a>
                    </li>
                </c:if>
            </ul>

        </div>
    </div>

</div>


<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>