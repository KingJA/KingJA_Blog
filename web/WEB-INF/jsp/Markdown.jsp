<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Markdown编辑器</title>
    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/markdown.css" rel="stylesheet">
    </link>
</head>
<body>

<div id="top">
    <p class="title">使用Markdown编辑</p>
    <a class="publish" href="#">发 布</a>
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
    function Editor(input, preview) {
        this.update = function () {
            preview.innerHTML = markdown.toHTML(input.value);
        };
        input.editor = this;
        this.update();
    }
    var $ = function (id) { return document.getElementById(id); };
    new Editor($("text-input"), $("preview"));
</script>
</body>
</html>