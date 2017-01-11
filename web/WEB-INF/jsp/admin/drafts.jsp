<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>管理员</title>
    <link href="/font-awesome-4.7.0/css/font-awesome.css" rel="stylesheet">
    <link href="/css/admin.css?v=1" rel="stylesheet">
    <link href="/css/base.css" rel="stylesheet">
</head>
<body>
<nav></nav>

<div class="container">

    <div class="admin-logo"></div>
    <div class="control-wrap">
        <div class="control-nav">
            <ul>
                <li><a class="control-nav-a" href="/admin/article">文章管理</a></li>
                <li><a class="control-nav-a" href="/admin/account">账号管理</a></li>
                <li><a class="control-nav-a" href="/admin/category">分类管理</a></li>
                <li><a class="control-nav-a" href="/admin/comment">评论管理</a></li>
                <li><a class="control-nav-a active" href="/admin/drafts">草稿箱</a></li>
            </ul>
        </div>
        <div class="control-display">

            <table cellspacing="0">
                <tr class="th-title">
                    <th class="col-w-5">标题</th>
                    <th class="col-w-2">修改时间</th>
                    <th class="col-w-1">阅读数</th>
                    <th class="col-w-1">评论数</th>
                    <th class="col-w-1">操作</th>
                </tr>
                <c:if test="${!empty articlePage.pageDatas}">
                    <c:forEach items="${articlePage.pageDatas}" var="article">
                        <tr>
                            <td class="t-left"><a href="#">${article.title}</a><span>(${article.createTime})</span>
                            </td>
                            <td>${article.fullUpdateTime}</td>
                            <td>${article.readCount}</td>
                            <td>${article.commentCount}</td>
                            <td><a href="/article/edit/${article.id}">编辑</a>|<a href="javascript:void(0);"
                                                                                            onclick="doDelete(${article.id})">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
            </table>


        </div>
    </div>

</div>

<footer>

    <p>当前在线人数(<span class="f-14-blue">1228</span>)</p>
    <p>历史访问人数(<span class="f-14-blue">825275</span>)</p>
    <p>© 2017 KingJA</p>
    <p>由 KingJA 强力驱动 主题 - KingJA.Genesis</p>


</footer>
<script src="/js/jquery-3.1.1.js"></script>
<script>
    function doDelete(id) {
        $.ajax({
                    type: "POST",
                    url: "/article/doDelete/",
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
</script>
</body>
</html>