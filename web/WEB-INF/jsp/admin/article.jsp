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
    <link href="/css/admin.css?v=1" rel="stylesheet">
    <link href="/css/base.css" rel="stylesheet">
    <link href="/font-awesome-4.7.0/css/font-awesome.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../common/nav.jsp"></jsp:include>

<div class="container">

    <div class="admin-logo">
        <div class="top_left">

            <img src="/img/head.jpg" alt="" height="60" width="60" >



        </div>
        <div class="top_right"></div>


    </div>
    <div class="control-wrap">
        <div class="control-nav">
            <ul class="control-ul">
                <li><a class="control-nav-a active" href="/admin/article"><i class="fa fa-bookmark-o"></i>articles</a>
                </li>
                <li><a class="control-nav-a" href="/admin/account"><i class="fa fa-bookmark-o"></i>account</a></li>
                <li><a class="control-nav-a" href="/admin/category"><i class="fa fa-bookmark-o"></i>category</a></li>
                <li><a class="control-nav-a" href="/admin/comment"><i class="fa fa-bookmark-o"></i>comment</a></li>
                <li><a class="control-nav-a" href="/admin/drafts"><i class="fa fa-bookmark-o"></i>draft</a></li>
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
                            <td class="t-left"><a href="#">${article.title}</a><span>(${article.createTime})</span>
                            </td>
                            <td>${article.readCount}</td>
                            <td>${article.commentCount}</td>
                            <td><a href="/article/edit/${article.id}">编辑</a>
                                <c:if test="${article.top==0}">
                                    <a href="javascript:void(0);" onclick="setTop(${article.id},1)">|置顶</a>
                                </c:if>

                                <c:if test="${article.top==1}">
                                    <a href="javascript:void(0);" onclick="setTop(${article.id},0)">|取消置顶</a>
                                </c:if>
                                <a href="javascript:void(0);" onclick="doDelete(${article.id})">|删除</a></td>
                        </tr>
                    </c:forEach>
                </c:if>
            </table>

        </div>
    </div>

</div>


<jsp:include page="../common/footer.jsp"></jsp:include>
<script src="/js/jquery-3.1.1.js"></script>
<script>
    function doDelete(id) {
        $.ajax({
                    type: "POST",
                    url: "/article/doDelete",
                    dataType: "json",
                    data: {
                        id: id
                    },
                    success: function (result) {
                        if (result.resultCode === 0) {
                            window.location.reload();
                        } else {
                            alert(result.resultText);
                        }
                    },
                    error: function () {

                    }
                }
        )
    }

    function setTop(id, ifTop) {
        $.ajax({
                    type: "POST",
                    url: "/article/setTop",
                    dataType: "json",
                    data: {
                        id: id,
                        top: ifTop
                    },
                    success: function (result) {
                        if (result.resultCode === 0) {
                            window.location.reload();
                        } else {
                            alert(result.resultText);
                        }
                    },
                    error: function () {

                    }
                }
        )
    }
</script>
</body>
</html>