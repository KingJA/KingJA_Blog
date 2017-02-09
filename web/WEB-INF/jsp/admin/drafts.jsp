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

<div class="container">

    <div class="admin-logo">
        <div class="top_left">
            <img src="/img/head2.jpg" alt="" height="80px" width="80px" class="head_icon">
            <div class="top_left_text">
                <p class="name">KingJA</p>
                <p class="role">software engineer</p>
            </div>
        </div>
        <div class="top_right"></div>
    </div>
    <div class="control-wrap">
        <div class="control-nav">
            <ul class="control-ul">
                <li><a class="control-nav-a" href="/admin/article"><i class="fa fa-file-text"></i>articles</a>
                </li>
                <li><a class="control-nav-a" href="/admin/account"><i class="fa fa-user"></i>account</a></li>
                <li><a class="control-nav-a" href="/admin/category"><i class="fa fa-tags"></i>category</a></li>
                <li><a class="control-nav-a" href="/admin/comment"><i class="fa fa-comments"></i>comment</a></li>
                <li><a class="control-nav-a active" href="/admin/drafts"><i class="fa fa-clipboard"></i>draft</a></li>
            </ul>
        </div>
        <div class="control-display">

            <table cellspacing="0">
                <tr class="th-title">
                    <th class="col-w-5">title</th>
                    <th class="col-w-2">updateTime</th>
                    <th class="col-w-1">read</th>
                    <th class="col-w-1">comment</th>
                    <th class="col-w-1">operation</th>
                </tr>
                <c:if test="${!empty articlePage.pageDatas}">
                    <c:forEach items="${articlePage.pageDatas}" var="article">
                        <tr>
                            <td class="t-left"><a href="#">${article.title}</a><span>(${article.createTime})</span>
                            </td>
                            <td class="f-14-gray">${article.fullUpdateTime}</td>
                            <td class="f-14-gray">${article.readCount}</td>
                            <td class="f-14-gray">${article.commentCount}</td>
                            <td><a href="/article/edit/${article.id}">edit</a>|<a href="javascript:void(0);"
                                                                                            onclick="doDelete(${article.id})">delete</a>
                            </td>
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