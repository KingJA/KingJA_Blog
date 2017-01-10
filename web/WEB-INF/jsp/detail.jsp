<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>主页</title>
    <link href="/plug/highlight/default.css" rel="stylesheet">
    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/article.css" rel="stylesheet">
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
                <p class="article-title">${article.title}</p>


                <p class="article-info">阅读数(<span class="f-14-blue">${article.readCount}</span>) 评论数(<span class="f-14-blue">${article.commentCount}</span>)
                    ${article.updateTime}</p>
                <p class="article-tag">
                    <i class="fa fa-tag fa-lg"></i>
                    <span>${article.tag}</span>
                </p>

            </div>
            <div class="content-wrap" id="article">
                ${article.content}
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
<script src="/js/markdown-it.js"></script>
<script src="/plug/highlight/highlight.pack.js"></script>
<script>
    $(function () {
        hljs.initHighlightingOnLoad();
        var md = window.markdownit({
            highlight: function (str, lang) {
                if (lang && hljs.getLanguage(lang)) {
                    try {
                        return hljs.highlight(lang, str).value;
                    } catch (__) {}
                }

                return ''; // use external default escaping
            }
        });
        var content = $("#article").text();
        $("#article").html(md.render(content));
    });
</script>
</body>
</html>