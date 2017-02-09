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
                <tr>
                    <td class="f-14-gray">Mike</td>
                    <td class="f-14-gray">管理员</td>
                    <td class="f-14-gray">2016-01-15 10:25:40</td>
                    <td><a href="#">edit</a>&nbsp;|&nbsp;<a href="#">delete</a>&nbsp;|&nbsp; <a href="#">authority</a></td>

                </tr>
            </table>


        </div>
    </div>

</div>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>