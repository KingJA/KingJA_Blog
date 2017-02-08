<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/2/8
  Time: 14:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="content block">

    <c:if test="${!empty articlePage.pageDatas}">
        <c:forEach items="${articlePage.pageDatas}" var="article">
            <div class="article">
                <div class="article-category">
                    <p class="category">${article.category}</p>
                    <p class="date">${article.createTime}</p>

                </div>
                <div class="article-content">
                    <div><a class="article-title" href="/article/detail/${article.id}">${article.title}</a></div>
                    <div class="article-param">
                        <div class="create-time f-14-gray">${article.createTime}</div>
                        <div class="comment-count f-14-gray">comment(${article.commentCount})</div>
                        <div class="read-count f-14-gray">read(${article.readCount})</div>

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