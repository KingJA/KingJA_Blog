<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>主页</title>
    <link href="/plug/highlight/default.css" rel="stylesheet">
    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/article.css?v=1" rel="stylesheet">
    <link href="/css/base.css?v=2" rel="stylesheet">
    <link href="/font-awesome-4.7.0/css/font-awesome.css" rel="stylesheet">
    <script src="/js/jquery-3.1.1.js"></script>
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
            <div class="content-wrap" id="article"></div>
            <input type="hidden" id="preContent" value="${article.content}">
        </div>
        <div class="left-comment-display block"><span class="side-title">评论(${fn:length(comments)})</span>

            <div class="root-comment">
                <c:if test="${!empty comments}">
                    <c:forEach items="${comments}" var="comment">
                        <div class="wrap-comment">
                            <p class="f-12-3">${comment.name}:</p>
                            <p class="f-6-9 comment-content">${comment.content}</p>
                            <p class="align-right">
                                <span class="margin-right-1">${comment.createTime}</span><a href="#">回复</a>
                            </p>
                        </div>
                    </c:forEach>
                    </ul>
                </c:if>
            </div>
        </div>
        <div class="left-comment block">
            <p class="smart-title">我想说几句</p>
            <form method="post" id="form-comment" onsubmit="return false;">
                <div class="wrap-post-comment">
                    <input type="hidden" name="articleId" value="${article.id}">
                    <input class="common-input" type="text" name="name" id="name" value="姓名(必填)"
                           aria-required="true" default="姓名(必填)">
                    <input class="common-input" type="text" name="email" id="email" value="Email(选填)"
                           aria-required="true" default="Email(选填)">
                    <input class="common-input" type="text" name="site" id="site" value="网站(选填)" aria-required="true"
                           default="网站(选填)">

                    <textarea cols="100%" rows="10" class="common-input comment-textarea" value="说点什么吧" default="说点什么吧"
                              name="content" id="content"
                    ></textarea>
                    <div class="wrap-submit"><input type="submit" value="提交" class="btn_submit right"
                                                    onclick="postComment()"></div>

                </div>


            </form>

        </div>
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
                        <li class="side-li"><a href="/article/date/${month.singleMonth}" class="side-a">${month.month}(${month.count})</a></li>
                    </c:forEach>
                </ul>
            </c:if>
        </div>
    </div>


</div>
<jsp:include page="../common/footer.jsp"></jsp:include>


<script src="/js/markdown-it.js"></script>
<script src="/plug/highlight/highlight.pack.js"></script>
<script>
    function postComment() {
        if ($("#name").val() === $("#name").attr("default") || $("#name").val() === "") {
            alert("大侠，好歹留个名吧");
            return
        }

        $.ajax({
            type: "POST",
            url: "/article/postComment",
            data: $("#form-comment").serialize(),
            dataType: "json",
            success: function (retult) {
                if (retult.resultCode === 0) {//登录成功，跳转后台页面
                    window.location.reload();
                } else {//登录失败，重新登录
                    alert(retult.resultText);
                }
            },
            error: function () {
            }
        });
        true;
    }
    $(function () {
        $("#article").hide();
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

        var content = $("#preContent").val();
        $("#article").html(md.render(content));

        $("#article").show();


        $("input[type=text]").focus(function () {
            if (jQuery(this).attr("value") == jQuery(this).attr("default")) {
                jQuery(this).attr("value", "");
            }

        });
        $("input[type=text]").blur(function () {
            if (jQuery(this).attr("value") == "") {
                jQuery(this).attr("value", jQuery(this).attr("default"));
            }

        });
    });
</script>
</body>
</html>