<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="/img/icon.jpg">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Markdown编辑器</title>
    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/plug/highlight/default.css" rel="stylesheet">
    <link href="/css/edit.css?v=2" rel="stylesheet">
    </link>
</head>
<body>

<div id="top">
    <span>
        <input type="text" placeholder="Please input the title" id="title" name="title">

        <select id="category" name="category">
            <option selected="selected" value="999" name="categoryId">--Select Tag--</option>
              <c:if test="${!empty categorys}">
                  <c:forEach items="${categorys}" var="category">
                      <option value="${category.id}" name="categoryId">${category.name}</option>
                  </c:forEach>
              </c:if>

        </select>
    </span>

    <span id="publish" class="button">发 布</span>  <span id="save" class="button">保 存</span>
</div>

<div id="content_wrap">
    <div class="common_wrap">
        <textarea class="commonInput" id="text-input" oninput="this.editor.update()"></textarea>
    </div>
    <div class="markdown" id="preview">
    </div>
</div>

<script src="/js/markdown2.js"></script>
<script src="/js/jquery-3.1.1.js"></script>
<script src="/js/markdown-it.js"></script>
<script src="/plug/highlight/highlight.pack.js"></script>
<script src="/js/main.js"></script>
<script>
    $(function () {

        $("#publish").bind("click",function () {
            doArticle(1);
        });
        $("#save").bind("click",function () {
            doArticle(0);
        });


        function doArticle(display) {
            console.log("publish");
            var title = $("#title").val();
            var category = $("#category").val();
            var content = $("#text-input").val();
            $.ajax({
                type: "POST",
                url: "/article/doPublish",
                data: {
                    "authorId": ${sessionScope.User.id},
                    "title": title,
                    "categoryId": category,
                    "content": content,
                    "display": display
                },
                dataType: "json",
                success: function (retult) {
                    if (retult.resultCode === 0) {
                        window.location.href = "/admin/article";
                    } else {
                        alert(retult.resultText);
                    }
                },
                error: function () {
                }
            });
        }

    });


</script>
</body>
</html>