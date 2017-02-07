<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>主页</title>
    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/home.css" rel="stylesheet">
    <link href="/css/base.css" rel="stylesheet">
</head>
<body>

<nav>

</nav>

<div class="container">
    <div class="content block">

        <c:if test="${!empty articlePage.pageDatas}">
            <c:forEach items="${articlePage.pageDatas}" var="article">
                <div class="article">
                    <div class="article-category">
                        <p class="category">${article.category}</p>
                        <p class="date">${article.updateTime}</p>

                    </div>
                    <div class="article-content">
                        <div><a class="article-title" href="/article/detail/${article.id}">${article.title}</a></div>
                        <div class="article-param">
                            <div class="create-time f-14-gray">${article.createTime}</div>
                            <div class="comment-count f-14-gray">评论数(${article.commentCount})</div>
                            <div class="read-count f-14-gray">阅读(${article.readCount})</div>

                        </div>

                    </div>

                </div>
            </c:forEach>
        </c:if>
           <div>
               <ul class="pagination">
                   <c:if test="${articlePage.hasPrevious}">
                       <li>
                           <a href="/page/${articlePage.previousPage}">&laquo;上一页</a>
                       </li>
                   </c:if>

                   <c:forEach var="x" begin="${articlePage.pageStart}"
                              end="${articlePage.pageEnd}">

                       <c:if test="${articlePage.currentPage==x}">
                           <li class="active"><a href="javascript:return false;">${x}</a></li>
                       </c:if>
                       <c:if test="${articlePage.currentPage!=x}">
                           <li><a href="/page/${x}">${x}</a></li>
                       </c:if>
                   </c:forEach>


                   <c:if test="${articlePage.hasNext}">
                       <li><a href="/page/${articlePage.nextPage}">下一页&raquo;</a>
                       </li>
                   </c:if>
               </ul>

           </div>



    </div>

    <div class="side">

        <div class="hot block">
            <span class="side-title">热门文章</span>
            <ul class="side-ul">
                <c:if test="${!empty hotArticles}">
                    <c:forEach items="${hotArticles}" var="hotArticle">
                        <li class="side-li"><a href="/article/detail/${hotArticle.id}" class="side-a">${hotArticle.title}</a></li>

                    </c:forEach>
                </c:if>
            </ul>
        </div>
        <div class="hot block">
            <span class="side-title">分类文章</span>
            <ul class="side-ul">
                <c:if test="${!empty categorys}">
                    <c:forEach items="${categorys}" var="category">
                        <li class="side-li"><a href="/article/category/${category.id}" class="side-a">${category.name}(${category.count})</a></li>
                    </c:forEach>
                </c:if>
            </ul>
        </div>
        <div class="hot block">
            <span class="side-title">时间轴</span>
            <ul class="side-ul">
                <c:if test="${!empty months}">
                    <c:forEach items="${months}" var="month">
                        <li class="side-li"><a href="/article/date/${month.singleMonth}" class="side-a">${month.month}(${month.count})</a></li>
                    </c:forEach>
                </c:if>
            </ul>
        </div>


    </div>


</div>
<footer>

    <p>当前在线人数(<span class="f-14-blue">${onLineCount}</span>)</p>
    <p>历史访问人数(<span class="f-14-blue">825275</span>)</p>
    <p>© 2017 KingJA</p>
    <p>由 KingJA 强力驱动 主题 - KingJA.Genesis</p>


</footer>
</body>
</html>