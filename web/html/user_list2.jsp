<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <title>Blank Page - Ace Admin</title>
    <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>
</head>
<body class="skin-1">
<jsp:include page="/html/index/top.jsp"></jsp:include>
<div class="main-container ace-save-state" id="main-container">
    <jsp:include page="/html/index/left.jsp"></jsp:include>

    <div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs ace-save-state" id="breadcrumbs">

                <div class="nav-search" id="nav-search">
                    <form class="form-search">
								<span class="input-icon">
									<input type="text" placeholder="Search ..." class="nav-search-input"
                                           id="nav-search-input" autocomplete="off"/>
									<i class="ace-icon fa fa-search nav-search-icon"></i>
								</span>
                    </form>
                </div><!-- /.nav-search -->
            </div>

            <div class="page-content">

                <div class="row">
                    <div class="col-xs-12">

                        <!-- PAGE CONTENT BEGINS -->
                        <div class="row" style="padding-left: 20px;">
                            <form action="/user/listUser" method="post" class="form-inline">
                                <input type="text" name="account" value="${user.account}" class="input-small"
                                       placeholder="按账号查找"
                                       style="width: 150px;"/>
                                <input type="text" name="name" value="${user.name}" class="input-small"
                                       placeholder="按姓名查找"
                                       style="width: 150px;"/>
                                <input type="submit" value="查询" class="btn btn-info btn-sm"/>
                            </form>
                            <a href="/user/listUser?page=${page.pageCurrent-1}&&account=${user.account}&&name=${user.name}">上一页</a>
                            当前页：${page.pageCurrent}
                            <a href="/user/listUser?page=${page.pageCurrent+1}&&account=${user.account}&&name=${user.name}">下一页</a>
                            总共页数：${page.pageCount}
                            总共记录数：${page.count}

                        </div>
                        <hr style="border-top:1px solid #6fb3e0">
                        <div class="row">
                            <div class="col-xs-12">
                                <table id="simple-table" class="table  table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>序号</th>
                                        <th>部门</th>
                                        <th>账号</th>
                                        <th>姓名</th>
                                        <th>年龄</th>
                                        <th>性别</th>
                                        <th>出生日期</th>
                                        <th>创建时间</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody id="content">
                                    <c:forEach items="${list}" var="user" varStatus="status">
                                        <tr>
                                            <td>${status.index+1}</td>
                                            <td>${user.deptName}</td>
                                            <td>${user.account}</td>
                                            <td>${user.name}</td>
                                            <td>${user.age}</td>
                                            <td>
                                                    <%--${user.sex==1?'男':'女'}--%>
                                                <c:if test="${user.sex==1}">男</c:if>
                                                <c:if test="${user.sex==0}">女</c:if>
                                            </td>
                                            <td>${user.birthDate}</td>
                                            <td>
                                                    <%--把日期字符串转换成date类型--%>
                                                <fmt:parseDate var="createTime" value="${user.createTime}"
                                                               pattern="yyyy-MM-dd HH:mm:ss"></fmt:parseDate>
                                                    <%--把date类型转换成固定格式--%>
                                                <fmt:formatDate value="${createTime}"
                                                                pattern="yyyy年MM月dd HH:mm:ss"></fmt:formatDate>
                                            </td>
                                            <td></td>
                                        </tr>
                                    </c:forEach>

                                    </tbody>
                                </table>
                            </div><!-- /.span -->
                        </div><!-- /.row -->

                        <%--分页按钮--%>
                        <nav aria-label="Page navigation" style="position: fixed;right: 100px;bottom: 10px;">
                            <ul class="pagination" id="pagination"></ul>
                        </nav>

                        <!-- PAGE CONTENT ENDS -->
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->

    <jsp:include page="/html/common/common_footer.jsp"></jsp:include>
</div><!-- /.main-container -->

<script>

</script>
<script type="text/javascript">
    if ('ontouchstart' in document.documentElement)
        document.write("<script src='${path}/assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
</script>
<script type="text/javascript">
    try {
        ace.settings.loadState('main-container')
    } catch (e) {
    }
</script>
</body>
</html>
