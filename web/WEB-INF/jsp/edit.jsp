<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link href="/css/edit.css" rel="stylesheet">
    </link>
</head>
<body>

<div id="top">
    <span>
        <input type="text" placeholder="Please input the title"  id="title" name="title">
        <select id="tag" name="tag">
            <option selected="selected" value="">--Select Tag--</option>
            <option value="Java">Java</option>
            <option value="Android">Android</option>
            <option value="Java">Java Web</option>
            <option value="Html">Html</option>
            <option value="Javascript">Javascript</option>
            <option value="CSS">CSS</option>
            <option value="框架">框架</option>
        </select>
    </span>

    <span id="publish">发 布</span>
</div>

<div id="content_wrap">
    <div class="common_wrap">
        <textarea class="commonInput" id="text-input" oninput="this.editor.update()"></textarea>
    </div>
    <div class="markdown" id="preview">
    </div>
</div>

<script src="/js/markdown.js"></script>
<script src="/js/jquery-3.1.1.js"></script>
<script src="/js/main.js"></script>
<script>
    $(function(){

        $("#publish").click(function () {
            console.log("publish");
            var title = $("#title").val();
            var tag = $("#tag").val();
            var content = $("#text-input").val();
            $.ajax({
                type: "POST",
                url: "/saveArticle/doPublish",
                data: {
                    "authorId": ${sessionScope.User.id},
                    "title": title,
                    "tag": tag,
                    "content": content
                },
                dataType: "json",
                success: function (retult) {
                    if (retult.resultCode === 0) {//登录成功，跳转后台页面
                        window.location.href = "/admin/saveArticle";
                    } else {//登录失败，重新登录
                        alert(retult.resultText);
                    }
                },
                error: function () {
                }
            });
        });

    });








</script>
</body>
</html>