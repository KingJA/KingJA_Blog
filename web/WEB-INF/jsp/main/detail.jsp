<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <div class="block">

            <div class="title-wrap">
                <p class="article-title">${article.title}</p>


                <p class="article-info">阅读数(<span class="f-14-blue">${article.readCount}</span>) 评论数(<span
                        class="f-14-blue">${article.commentCount}</span>)
                    ${article.createTime}</p>
                <p class="article-category">
                    <i class="fa fa-category fa-lg"></i>
                    <span>${article.category}</span>
                </p>

            </div>

            <div class="content-wrap" id="article">${article.content}</div>


        </div>
        <div class="left-comment block"><span class="side-title">评论(56)</span></div>
    </div>


    <div class="side">

        <div class="hot block">
            <span class="side-title">热门文章</span>

            <c:if test="${!empty hotArticles}">
                <ul class="side-ul">
                    <c:forEach items="${hotArticles}" var="hotArticle">
                        <li class="side-li"><a href="/article/detail/${hotArticle.id}"
                                               class="side-a">${hotArticle.title}</a></li>

                    </c:forEach>
                </ul>
            </c:if>

        </div>
        <div class="hot block">
            <span class="side-title">分类文章</span>
            <ul class="side-ul">
                <c:if test="${!empty categorys}">
                    <c:forEach items="${categorys}" var="category">
                        <li class="side-li"><a href="#" class="side-a">${category.name}(${category.count})</a></li>
                    </c:forEach>
                </c:if>
            </ul>
        </div>
        <div class="hot block">
            <span class="side-title">时间轴</span>

            <c:if test="${!empty months}">
                <ul class="side-ul">
                    <c:forEach items="${months}" var="month">
                        <li class="side-li"><a href="#" class="side-a">${month.month}(${month.count})</a></li>
                    </c:forEach>
                </ul>
            </c:if>

        </div>


    </div>


</div>
<jsp:include page="../common/footer.jsp"></jsp:include>

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
                    } catch (__) {
                    }
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