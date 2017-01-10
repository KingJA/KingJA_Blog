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
    <link href="font-awesome-4.7.0/css/font-awesome.css" rel="stylesheet">
    <link href="/css/admin.css" rel="stylesheet">
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
                <li><a class="control-nav-a active" href="/admin/comment">评论管理</a></li>
                <li><a class="control-nav-a" href="/admin/drafts">草稿箱</a></li>
            </ul>
        </div>
        <div class="control-display">

            <table cellspacing="0">
                <tr class="th-title">
                    <th class="col-w-3">评论文章</th>
                    <th class="col-w-3">评论内容</th>
                    <th class="col-w-1">评论人</th>
                    <th class="col-w-2">评论时间</th>
                    <th class="col-w-1">操作</th>
                </tr>
                <tr>
                    <td class="t-left">性能测试应该怎么做？</td>
                    <td class="t-left">感谢分享</td>
                    <td>Mike</td>
                    <td>2016-01-15 10:25:40</td>
                    <td><a href="#">删除</a></td>

                </tr>
                <tr>
                    <td class="t-left">性能测试应该怎么做？</td>
                    <td class="t-left">感谢分享</td>
                    <td>Lili</td>
                    <td>2016-01-15 10:25:40</td>
                    <td><a href="#">删除</a></td>

                </tr>
            </table>


        </div>
    </div>

</div>
<!--
<div class="list-group">
    <a class="list-group-item" href="#"><i class="fa fa-home fa-fw"></i>&nbsp; Home</a>
    <a class="list-group-item" href="#"><i class="fa fa-book fa-fw"></i>&nbsp; Library</a>
    <a class="list-group-item" href="#"><i class="fa fa-pencil fa-fw"></i>&nbsp; Applications</a>
    <a class="list-group-item" href="#"><i class="fa fa-cog fa-fw"></i>&nbsp; Settings</a>
</div>
-->


<footer>

    <p>当前在线人数(<span class="f-14-blue">1228</span>)</p>
    <p>历史访问人数(<span class="f-14-blue">825275</span>)</p>
    <p>© 2017 KingJA</p>
    <p>由 KingJA 强力驱动 主题 - KingJA.Genesis</p>


</footer>
</body>
</html>