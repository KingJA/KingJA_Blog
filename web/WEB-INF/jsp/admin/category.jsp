<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>管理员</title>
    <link href="/font-awesome-4.7.0/css/font-awesome.css" rel="stylesheet">
    <link href="/css/admin.css" rel="stylesheet">
    <link href="/css/base.css" rel="stylesheet">
</head>
<body>
<nav></nav>

<div class="container">

    <div class="admin-logo"></div>
    <div class="control-wrap">
        <div class="control-nav">
            <ul>
                <li><a class="control-nav-a" href="/admin/article">文章管理</a></li>
                <li><a class="control-nav-a" href="/admin/account">账号管理</a></li>
                <li><a class="control-nav-a active" href="/admin/category">分类管理</a></li>
                <li><a class="control-nav-a" href="/admin/comment">评论管理</a></li>
                <li><a class="control-nav-a" href="/admin/drafts">草稿箱</a></li>
            </ul>
        </div>
        <div class="control-display">

            <table cellspacing="0">
                <tr class="th-title">
                    <th class="col-w-33">类别</th>
                    <th class="col-w-33">文章</th>
                    <th class="col-w-33">操作</th>
                </tr>
                <c:if test="${!empty categorys}">
                    <c:forEach items="${categorys}" var="category">
                        <tr>
                            <td class="t-left">
                                <span id="name-${category.id}">${category.name}</span>
                                <span id="edit-${category.id}" style="display: none">
                                    <input id="input-${category.id}" type="text" maxlength="20"
                                           value="${category.name}">&nbsp;
                                    <a href="javascript:void(0)" class="none-line-a" onclick="saveEdit(${category.id})">保存&nbsp;</a>
                                    <a href="javascript:void(0)" class="none-line-a"
                                       onclick="cancleEdit(${category.id})">取消</a>
                                </span>
                            </td>
                            <td><a href="#">${category.count}</a></td>
                            <td><a href="#" onclick="javascript:editCategory(${category.id});return false;">编辑</a>|<a
                                    href="javascript:void(0)" onclick="deleteCategory(${category.id})">删除</a></td>
                        </tr>
                    </c:forEach>
                </c:if>
            </table>

            <div>
                <input type="text" name="name" id="category-name"><a href="javascript:void(0);" class="none-line-a"
                                                                     onclick="addCategory()">添加分类</a>

            </div>


        </div>
    </div>

</div>


<footer>

    <p>当前在线人数(<span class="f-14-blue">1228</span>)</p>
    <p>历史访问人数(<span class="f-14-blue">825275</span>)</p>
    <p>© 2017 KingJA</p>
    <p>由 KingJA 强力驱动 主题 - KingJA.Genesis</p>


</footer>
<script src="/js/jquery-3.1.1.js"></script>
<script>
    function saveEdit(id) {
        var name = $("#input-" + id).val();
        $("#name-" + id).show();
        $("#edit-" + id).hide();
        $("#name-" + id).text(name);

        $.ajax({
            url:"/admin/editCategory",
            type:"POST",
            data:{
                id:id,
                name:name
            },
            dataType:"json",
            success:function (result) {
                if (result.resultCode === 0) {
                } else {
                    alert(result.resultText);
                }
            },
             error:function () {

            },


        });
    }
    function cancleEdit(id) {
        $("#name-" + id).show();
        $("#edit-" + id).hide();
    }

    function editCategory(id) {
        $("#name-" + id).hide();
        $("#input-" + id).val($("#name-" + id).text());
        $("#edit-" + id).show();
    }
    function addCategory() {
        var name = $("#category-name").val();
        $.ajax({
            type: "POST",
            url: "/admin/addCategory",
            data: {
                name: name
            },
            dataType: "json",
            success: function (result) {
                if (result.resultCode === 0) {
                    window.location.reload();
                } else {
                    alert(result.resultText);
                }
            },
            error: function () {
            }
        });
    }

    function deleteCategory(id) {
        $.ajax({
            type: "POST",
            url: "/admin/deleteCategory",
            data: {
                id: id
            },
            dataType: "json",
            success: function (result) {
                if (result.resultCode === 0) {
                    window.location.reload();
                } else {
                    alert(result.resultText);
                }
            },
            error: function () {

            }
        })

    }
</script>
</body>
</html>