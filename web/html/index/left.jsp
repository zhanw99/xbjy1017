<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <title>Blank Page - Ace Admin</title>
    <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>
</head>

<body>
<%--菜单栏--%>
<script type="text/javascript">
    try {
        ace.settings.loadState('sidebar')
    } catch (e) {
    }

    window.onload = function (ev) {
        $.ajax({
            url: "/left",
            type: "post",
            // 返回数据
            data: {},
            dataType: "json",
            //获取数据
            success: function (data) {
                var html = "";
                for (var i = 0; i < data.length; i++) {
                    if (data[i].pId == -1) {
                        html = html + '        <li class="active open">\n' +
                            '            <a href=' + data[i].url  +' class="dropdown-toggle">\n' +
                            '                <i class="menu-icon fa fa-tag"></i>\n' +
                            '                <span class="menu-text">' + data[i].name + '</span>\n' +
                            '                <b class="arrow fa fa-angle-down"></b>\n' +
                            '            </a>\n' +
                            '            <b class="arrow"></b>\n' +
                            '            <ul class="submenu">\n' +
                            '                <li class="">';
                    }
                    for (var j = 0; j <data.length ; j++) {
                        if (data[i].id==data[j].pId) {
                            html = html +'<a href=' + data[j].url  +'><i class="menu-icon fa fa-caret-right"></i>' + data[j].name  +'</a>'
                        }
                    }
                    html=html+ '</li></ul></li>';

                }
                $("#ul").append(html);
            }
        });

    }
</script>
<div id="sidebar" class="sidebar responsive ace-save-state">
    <ul class="nav nav-list" id="ul"></ul>

</div>
</body>
</html>
