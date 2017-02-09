<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="/img/icon.jpg">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>管理员</title>
    <link href="/font-awesome-4.7.0/css/font-awesome.css" rel="stylesheet">
    <link href="/css/admin.css?v=1" rel="stylesheet">
    <link href="/css/base.css?v=1" rel="stylesheet">
</head>
<body>

<div class="container_shadow">

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
                <li><a class="control-nav-a active" href="/admin/comment"><i class="fa fa-comments"></i>comment</a></li>
                <li><a class="control-nav-a" href="/admin/drafts"><i class="fa fa-clipboard"></i>drafts</a></li>
            </ul>
        </div>
        <div class="control-display">

            <table cellspacing="0">
                <tr class="th-title">
                    <th class="col-w-3">title</th>
                    <th class="col-w-3">comment</th>
                    <th class="col-w-1">commenter</th>
                    <th class="col-w-2">date</th>
                    <th class="col-w-1">operation</th>
                </tr>

                <c:if test="${!empty commentPage.pageDatas}">
                    <c:forEach items="${commentPage.pageDatas}" var="comment">
                        <tr>
                            <td class="t-left f-14-gray">${comment.title}</td>
                            <td class="t-left f-14-gray">${comment.content}</td>
                            <td class="f-14-gray">${comment.name}</td>
                            <td class="f-14-gray">${comment.createTime}</td>
                            <td><a href="javascript:void(0);" onclick="doDelete(${comment.id})">delete</a></td>
                        </tr>
                    </c:forEach>
                </c:if>

            </table>
            <div class="pager">
                <ul class="pager_ul">
                    <c:if test="${commentPage.hasPrevious}">
                        <li>
                            <a href="/admin/comment/${commentPage.previousPage}" class="pager_a">&laquo;上一页</a>
                        </li>
                    </c:if>

                    <c:forEach var="x" begin="${commentPage.pageStart}"
                               end="${commentPage.pageEnd}">

                        <c:if test="${commentPage.currentPage==x}">
                            <li><a href="javascript:(0);" class="pager_action">${x}</a></li>
                        </c:if>
                        <c:if test="${commentPage.currentPage!=x}">
                            <li><a href="/admin/comment/${x}" class="pager_a">${x}</a></li>
                        </c:if>
                    </c:forEach>


                    <c:if test="${commentPage.hasNext}">
                        <li><a href="/admin/comment/${commentPage.nextPage}" class="pager_a">下一页&raquo;</a>
                        </li>
                    </c:if>
                </ul>

            </div>

        </div>
    </div>

</div>
<jsp:include page="../common/footer.jsp"></jsp:include>
<script src="/js/jquery-3.1.1.js"></script>
<script>
    function doDelete(id) {
        $.ajax({
                    type: "POST",
                    url: "/admin/comment/doDelete",
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