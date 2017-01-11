<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/1/6
  Time: 9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="/img/icon.jpg">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" href="/css/base.css">
    <link rel="stylesheet" href="/css/login.css">
</head>
<body>

<div class="login-wrap">
    <p class="login-title">Sign in</p>
    <form id="loginForm" onsubmit="return false">
        <p>  <input type="text" class="input" placeholder="username" name="name"></p>
        <p>  <input type="password" class="input" placeholder="password" name="password"></p>
        <p>  <input type="submit" value="Sign in" class="button" onclick="doLogin()"></p>

    </form>

</div>


<footer>
    <p>© 2017 KingJA</p>
    <p>由 KingJA 强力驱动 主题 - KingJA.Genesis</p>
</footer>

<script src="/js/jquery-3.1.1.js"></script>
<script src="/js/login.js?v=1"></script>

</body>
</html>
