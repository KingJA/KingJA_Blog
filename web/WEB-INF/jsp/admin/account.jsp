<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>管理员</title>
    <link href="/font-awesome-4.7.0/css/font-awesome.css" rel="stylesheet">
    <link href="/css/admin.css?v=2" rel="stylesheet">
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
                <li><a class="control-nav-a active" href="/admin/account"><i class="fa fa-user"></i>account</a></li>
                <li><a class="control-nav-a" href="/admin/category"><i class="fa fa-tags"></i>category</a></li>
                <li><a class="control-nav-a" href="/admin/comment"><i class="fa fa-comments"></i>comment</a></li>
                <li><a class="control-nav-a" href="/admin/drafts"><i class="fa fa-clipboard"></i>draft</a></li>
            </ul>
        </div>
        <div class="control-display">

            <table cellspacing="0">
                <tr class="th-title">
                    <th class="col-w-2_5">name</th>
                    <th class="col-w-2_5">role</th>
                    <th class="col-w-2_5">createTime</th>
                    <th class="col-w-2_5">opertaion</th>
                </tr>
                <c:if test="${!empty accountPage.pageDatas}">
                    <c:forEach items="${accountPage.pageDatas}" var="account">
                        <tr>
                            <td class="f-14-gray">${account.name}</td>
                            <td class="f-14-gray">${account.role}</td>
                            <td class="f-14-gray">${account.createTime}</td>
                            <td><a href="#">edit</a>&nbsp;|&nbsp;<a href="#">delete</a>&nbsp;|&nbsp; <a href="#">authority</a></td>

                        </tr>
                    </c:forEach>
                </c:if>


            </table>

            <div class="pager">
                <ul class="pager_ul">
                    <c:if test="${accountPage.hasPrevious}">
                        <li>
                            <a href="/admin/account/${accountPage.previousPage}" class="pager_a">&laquo;上一页</a>
                        </li>
                    </c:if>

                    <c:forEach var="x" begin="${accountPage.pageStart}"
                               end="${accountPage.pageEnd}">

                        <c:if test="${accountPage.currentPage==x}">
                            <li ><a href="javascript:return false;" class="pager_a pager_action">${x}</a></li>
                        </c:if>
                        <c:if test="${accountPage.currentPage!=x}">
                            <li><a href="/admin/account/${x}" class="pager_a">${x}</a></li>
                        </c:if>
                    </c:forEach>


                    <c:if test="${accountPage.hasNext}">
                        <li><a href="/admin/account/${accountPage.nextPage}" class="pager_a">下一页&raquo;</a>
                        </li>
                    </c:if>
                </ul>

            </div>
        </div>
    </div>

</div>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>