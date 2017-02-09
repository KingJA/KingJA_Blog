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
                <li><a class="control-nav-a active" href="/admin/article"><i class="fa fa-file-text"></i>articles</a>
                </li>
                <li><a class="control-nav-a" href="/admin/account"><i class="fa fa-user"></i>account</a></li>
                <li><a class="control-nav-a" href="/admin/category"><i class="fa fa-tags"></i>category</a></li>
                <li><a class="control-nav-a" href="/admin/comment"><i class="fa fa-comments"></i>comment</a></li>
                <li><a class="control-nav-a" href="/admin/drafts"><i class="fa fa-clipboard"></i>draft</a></li>
            </ul>
        </div>
        <div class="control-display">
            <table cellspacing="0">
                <tr class="th-title">
                    <th class="col-w-6">title</th>
                    <th class="col-w-1">read</th>
                    <th class="col-w-1">comment</th>
                    <th class="col-w-2">operation</th>
                </tr>
                <c:if test="${!empty articlePage.pageDatas}">
                    <c:forEach items="${articlePage.pageDatas}" var="article">
                        <tr>
                            <td class="t-left"><a href="#">${article.title}</a><span>(${article.createTime})</span>
                            </td>
                            <td class="f-14-gray">${article.readCount}</td>
                            <td class="f-14-gray">${article.commentCount}</td>
                            <td><a href="/article/edit/${article.id}">edit</a>
                                <c:if test="${article.top==0}">
                                    <a href="javascript:void(0);" onclick="setTop(${article.id},1)">|top</a>
                                </c:if>

                                <c:if test="${article.top==1}">
                                    <a href="javascript:void(0);" onclick="setTop(${article.id},0)">|unTop</a>
                                </c:if>
                                <a href="javascript:void(0);" onclick="doDelete(${article.id})">|delete</a></td>
                        </tr>
                    </c:forEach>
                </c:if>
            </table>
            <c:if test="${articlePage.hasNext}">
                <div class="pager">
                    <ul class="pager_ul">
                        <c:if test="${articlePage.hasPrevious}">
                            <li>
                                <a href="/admin/article/${articlePage.previousPage}" class="pager_a">&laquo;上一页</a>
                            </li>
                        </c:if>

                        <c:forEach var="x" begin="${articlePage.pageStart}"
                                   end="${articlePage.pageEnd}">

                            <c:if test="${articlePage.currentPage==x}">
                                <li ><a href="javascript:return false;" class="pager_a pager_action">${x}</a></li>
                            </c:if>
                            <c:if test="${articlePage.currentPage!=x}">
                                <li><a href="/admin/article/${x}" class="pager_a">${x}</a></li>
                            </c:if>
                        </c:forEach>


                        <c:if test="${articlePage.hasNext}">
                            <li><a href="/admin/article/${articlePage.nextPage}" class="pager_a">下一页&raquo;</a>
                            </li>
                        </c:if>
                    </ul>

                </div>
            </c:if>

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