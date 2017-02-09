<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>管理员</title>
    <link href="/font-awesome-4.7.0/css/font-awesome.css" rel="stylesheet">
    <link href="/css/admin.css?v=2" rel="stylesheet">
    <link href="/css/base.css?v=1" rel="stylesheet">
</head>
<body>

<div class="container_shadow">

    <div class="admin-logo">
        <div class="top_left">
            <img src="/img/head2.jpg" alt="" height="80px" width="80px" class="head_icon">
            <div class="top_left_text">
                <p class="name">KingJA</p>
                <p class="role">software engineer</p>
            </div>
        </div>
        <div class="top_right"></div>
    </div>
    <div class="control-wrap">
        <div class="control-nav">
            <ul class="control-ul">
                <li><a class="control-nav-a" href="/admin/article"><i class="fa fa-file-text"></i>articles</a>
                </li>
                <li><a class="control-nav-a" href="/admin/account"><i class="fa fa-account"></i>account</a></li>
                <li><a class="control-nav-a active" href="/admin/category"><i class="fa fa-tags"></i>category</a></li>
                <li><a class="control-nav-a" href="/admin/comment"><i class="fa fa-comments"></i>comment</a></li>
                <li><a class="control-nav-a" href="/admin/drafts"><i class="fa fa-clipboard"></i>drafts</a></li>
            </ul>
        </div>
        <div class="control-display">

            <table cellspacing="0">
                <tr class="th-title">
                    <th class="col-w-33">category</th>
                    <th class="col-w-33">count</th>
                    <th class="col-w-33">operation</th>
                </tr>
                <c:if test="${!empty categorys}">
                    <c:forEach items="${categorys}" var="category">
                        <tr>
                            <td class="t-left">
                                <span id="name-${category.id}">${category.name}</span>
                                <span id="edit-${category.id}" style="display: none">
                                    <input id="input-${category.id}" type="text" maxlength="20"
                                           value="${category.name}">&nbsp;
                                    <a href="javascript:void(0)" class="none-line-a" onclick="saveEdit(${category.id})">save&nbsp;</a>
                                    <a href="javascript:void(0)" class="none-line-a"
                                       onclick="cancleEdit(${category.id})">cancle</a>
                                </span>
                            </td>
                            <td><a href="#">${category.count}</a></td>
                            <td><a href="#" onclick="javascript:editCategory(${category.id});return false;">edit</a>|<a
                                    href="javascript:void(0)" onclick="deleteCategory(${category.id})">delete</a></td>
                        </tr>
                    </c:forEach>
                </c:if>
            </table>

            <div>
                <p class="align-center">
                    <input type="text" name="name" id="category-name"><a href="javascript:void(0);" class="none-line-a"
                                                                         onclick="addCategory()">add category</a></p>

            </div>


        </div>
    </div>

</div>


<jsp:include page="../common/footer.jsp"></jsp:include>
<script src="/js/jquery-3.1.1.js"></script>
<script>
    function saveEdit(id) {
        var name = $("#input-" + id).val();
        $("#name-" + id).show();
        $("#edit-" + id).hide();
        $("#name-" + id).text(name);

        $.ajax({
            url: "/admin/editCategory",
            type: "POST",
            data: {
                id: id,
                name: name
            },
            dataType: "json",
            success: function (result) {
                if (result.resultCode === 0) {
                } else {
                    alert(result.resultText);
                }
            },
            error: function () {

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