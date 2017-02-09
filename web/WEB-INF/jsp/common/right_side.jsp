<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  Account: Administrator
  Date: 2017/2/8
  Time: 14:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="side">
    <div class="hot block">
        <span class="side-title">Hot article</span>
        <ul class="side-ul">
            <c:if test="${!empty hotArticles}">
                <c:forEach items="${hotArticles}" var="hotArticle">
                    <li class="side-li"><a href="/article/detail/${hotArticle.id}" class="side-a">${hotArticle.title}</a></li>

                </c:forEach>
            </c:if>
        </ul>
    </div>
    <div class="hot block">
        <span class="side-title">Category</span>
        <ul class="side-ul">
            <c:if test="${!empty categorys}">
                <c:forEach items="${categorys}" var="category">
                    <li class="side-li"><a href="/article/category/${category.id}" class="side-a">${category.name}(${category.count})</a></li>
                </c:forEach>
            </c:if>
        </ul>
    </div>
    <div class="hot block">
        <span class="side-title">Date</span>
        <ul class="side-ul">
            <c:if test="${!empty months}">
                <c:forEach items="${months}" var="month">
                    <li class="side-li"><a href="/article/date/${month.singleMonth}" class="side-a">${month.month}(${month.count})</a></li>
                </c:forEach>
            </c:if>
        </ul>
    </div>


</div>