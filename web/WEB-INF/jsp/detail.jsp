<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>主页</title>
    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/saveArticle.css" rel="stylesheet">
    <link href="/css/base.css" rel="stylesheet">
    <link href="/font-awesome-4.7.0/css/font-awesome.css" rel="stylesheet">
</head>
<body>

<nav>

</nav>

<div class="container">
    <div class="left-wrap ">
        <div class="content block">

            <div class="title-wrap">
                <p class="saveArticle-title">如何读懂并写出装逼的函数式代码</p>


                <p class="saveArticle-info">阅读数(<span class="f-14-blue">2654</span>) 评论数(<span class="f-14-blue">54</span>)
                    2016-10-12 12:22</p>
                <p class="saveArticle-tag">
                    <i class="fa fa-tag fa-lg"></i>
                    <span>Android</span>
                    <span>Java</span>
                    <span>性能优化</span>
                </p>

            </div>
            <div class="content-wrap" id="saveArticle">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid, quisquam.
            </div>


        </div>
        <div class="left-comment block"> 评论区</div>
    </div>


    <div class="side">

        <div class="hot block">
            <span class="side-title">热门文章</span>
            <ul class="side-ul">
                <li class="side-li"><a href="#" class="side-a">如何读懂并写出装逼的函数式代码</a></li>
                <li class="side-li"><a href="#" class="side-a">让我们来谈谈分工</a></li>
                <li class="side-li"><a href="#" class="side-a">CUCKOO FILTER：设计与实现</a></li>
                <li class="side-li"><a href="#" class="side-a">性能测试应该怎么做？</a></li>
                <li class="side-li"><a href="#" class="side-a">为什么我不在微信公众号上写文章</a></li>
            </ul>
        </div>
        <div class="hot block">
            <span class="side-title">分类文章</span>
            <ul class="side-ul">
                <li class="side-li"><a href="#" class="side-a">Java(5)</a></li>
                <li class="side-li"><a href="#" class="side-a">Android(5)</a></li>
                <li class="side-li"><a href="#" class="side-a">Html(8)</a></li>
                <li class="side-li"><a href="#" class="side-a">Javascript(5)</a></li>
                <li class="side-li"><a href="#" class="side-a">数据库(5)</a></li>
            </ul>
        </div>
        <div class="hot block">
            <span class="side-title">时间轴</span>
            <ul class="side-ul">
                <li class="side-li"><a href="#" class="side-a">2017年一月(5)</a></li>
                <li class="side-li"><a href="#" class="side-a">2017年一月(5)</a></li>
                <li class="side-li"><a href="#" class="side-a">2017年一月(5)</a></li>
                <li class="side-li"><a href="#" class="side-a">2017年一月(5)</a></li>
                <li class="side-li"><a href="#" class="side-a">2017年一月(5)</a></li>
            </ul>
        </div>


    </div>


</div>
<jsp:include page="footer.jsp"></jsp:include>

<script src="/js/jquery-3.1.1.js"></script>
<script src="/js/markdown.js"></script>
<script>
    $(function () {
        $.ajax({
            url: "temp.md", success: function (result) {
                $("#saveArticle").html(markdown.toHTML(result));
            }
        });

    });
</script>
</body>
</html>