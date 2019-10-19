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
                            <form action="/user/list" method="post" class="form-inline">
                                <input type="text" name="account"  class="input-small"  <%--value="${user.account}"--%>
                                       placeholder="按账号查找"
                                       style="width: 150px;"/>
                                <input type="text" name="name"  class="input-small"     <%--value="${user.account}"--%>
                                       placeholder="按姓名查找"
                                       style="width: 150px;"/>
                                <input type="submit" value="查询" class="btn btn-info btn-sm"/>
                            </form>
                            <br/>
                            共有${page.totalRecord}个员工，共${requestScope.page.totalPage }页，当前为${requestScope.page.pageNum}页
                            <br/>
                            <a href="${pageContext.request.contextPath}/user/list?pageNum=1">首页</a>
                            <%--如果当前页为第一页时，就没有上一页这个超链接显示 --%>
                            <c:if test="${requestScope.page.pageNum ==1}">
                                <c:forEach begin="${requestScope.page.start}" end="${requestScope.page.end}" step="1" var="i">
                                    <c:if test="${requestScope.page.pageNum == i}">
                                        ${i}
                                    </c:if>
                                    <c:if test="${requestScope.page.pageNum != i}">
                                        <a href="${pageContext.request.contextPath}/user/list?pageNum=${i}">${i}</a>
                                    </c:if>
                                </c:forEach>
                                <a href="${pageContext.request.contextPath}/user/list?pageNum=${requestScope.page.pageNum+1}">下一页</a>
                            </c:if>

                            <%--如果当前页不是第一页也不是最后一页，则有上一页和下一页这个超链接显示 --%>
                            <c:if test="${requestScope.page.pageNum > 1 && requestScope.page.pageNum < requestScope.page.totalPage}">
                                <a href="${pageContext.request.contextPath}/user/list?pageNum=${requestScope.page.pageNum-1}">上一页</a>
                                <c:forEach begin="${requestScope.page.start}" end="${requestScope.page.end}" step="1" var="i">
                                    <c:if test="${requestScope.page.pageNum == i}">
                                        ${i}
                                    </c:if>
                                    <c:if test="${requestScope.page.pageNum != i}">
                                        <a href="${pageContext.request.contextPath}/user/list?pageNum=${i}">${i}</a>
                                    </c:if>
                                </c:forEach>
                                <a href="${pageContext.request.contextPath}/user/list?pageNum=${requestScope.page.pageNum+1}">下一页</a>
                            </c:if>


                            <%-- 如果当前页是最后一页，则只有上一页这个超链接显示，下一页没有 --%>
                            <c:if test="${requestScope.page.pageNum == requestScope.page.totalPage}">
                                <a href="${pageContext.request.contextPath}/user/list?pageNum=${requestScope.page.pageNum-1}">上一页</a>
                                <c:forEach begin="${requestScope.page.start}" end="${requestScope.page.end}" step="1" var="i">
                                    <c:if test="${requestScope.page.pageNum == i}">
                                        ${i}
                                    </c:if>
                                    <c:if test="${requestScope.page.pageNum != i}">
                                        <a href="${pageContext.request.contextPath}/user/list?pageNum=${i}">${i}</a>
                                    </c:if>
                                </c:forEach>
                            </c:if>

                            <%--尾页 --%>
                            <a href="${pageContext.request.contextPath}/user/list?pageNum=${requestScope.page.totalPage}">尾页</a>
                        </div>
                        <hr style="border-top:1px solid #6fb3e0">
                        <div class="row">
                            <div class="col-xs-12">
                                <table id="simple-table" class="table  table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th class="detail-col">序号</th>
                                        <th>账号</th>
                                        <th>性别</th>
                                        <th>姓名</th>
                                        <th class="hidden-480">年龄</th>
                                        <th>出生日期</th>
                                        <th>创建时间</th>
                                        <th>销毁时间</th>
                                        <th>部门</th>
                                        <th class="hidden-480">加关注</th>
                                        <th class="hidden-480">操作</th>
                                    </tr>

                                    </thead>
                                    <c:forEach items="${requestScope.page.list}" var="user" varStatus="status">
                                        <tr>
                                        <th>${status.index+1}</th>
                                        <th>${user.account}</th>
                                        <th>${user.sex==1?'男':'女'}</th>
                                        <th>${user.name}</th>
                                        <th>${user.age}</th>
                                        <th>${user.birthDate}</th>
                                        <th> <%--${user.createTime}--%>
                                        <%--把日期字符串转换成date类型--%>
                                        <fmt:parseDate var="createTime" value="${user.createTime}"
                                        pattern="yyyy-MM-dd HH:mm:ss"></fmt:parseDate>
                                        <%--把date类型转换成固定格式--%>
                                        <fmt:formatDate value="${createTime}"
                                        pattern="yyyy年MM月dd HH:mm:ss"></fmt:formatDate>
                                        </th>
                                        <th>${status.index+1}</th>
                                        <%--<th>${status.createBy}</th>--%>
                                        <th>${user.deptName}</th>
                                        </tr>
                                    </c:forEach>
                                    <tbody id="content"></tbody>
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


    <jsp:include page="/html/index/footer.jsp"></jsp:include>
</div><!-- /.main-container -->

<%--<script>--%>
<%--$(function () {--%>
<%--load(1);--%>
<%--});--%>

<%--// 分页代码--%>
<%--function load(currPage) {--%>
<%--//查询条件（模糊查询）--%>
<%--var username = $("#username").val();--%>
<%--$.get("${path}/user/findByPage", {currPage: currPage, name: username}, function (data) {--%>
<%--//当前页数据--%>
<%--var currData = data.mapData;--%>
<%--var tbody = $("#content");--%>
<%--var html = "";--%>
<%--for (var val of currData) {--%>
<%--html += "<tr>" +--%>
<%--"<td class='center'>" + val.id + " </td>" +--%>
<%--"<td>" + val.real_name + " </td>" +--%>
<%--"<td>" + val.gender + "</td>" +--%>
<%--"<td>" + val.age + "</td>" +--%>
<%--"<td class='hidden-480'>" + val.desc + "</td>" +--%>
<%--"<td>" +--%>
<%--"<div class='hidden-sm hidden-xs btn-group'>" +--%>
<%--"<span class='label label-info arrowed-in-right arrowed'" +--%>
<%--"onclick=\"location='${path}/user/detailView?userId='+" + val.id + "\" + " +--%>
<%--"style='cursor: pointer'>详细信息</span>" +--%>
<%--"</div>" +--%>
<%--"</td>" +--%>
<%--"<td>" +--%>
<%--"<div class='col-xs-3'>" +--%>
<%--"<label>" +--%>
<%--"<input name='switch-field-1' class='ace ace-switch ace-switch-6' type='checkbox'>" +--%>
<%--"<span class='lbl'></span>" +--%>
<%--"</label>" +--%>
<%--"</div>" +--%>
<%--"</td>" +--%>
<%--"</tr>"--%>
<%--}--%>
<%--tbody.html(html);--%>
<%--var pagination = $("#pagination");--%>
<%--var lis = "<li>\n" +--%>
<%--" <a href=\"#\" aria-label=\"Previous\">\n" +--%>
<%--" <span aria-hidden=\"true\">&laquo;</span>\n" +--%>
<%--"</a>\n" +--%>
<%--"</li>";--%>

<%--for (var i = 1; i <= data.pageCount; i++) {--%>
<%--lis += "<li><a href=\"#\" onclick='load(" + i + ")'>" + i + "</a></li>";--%>
<%--}--%>
<%--lis += "<li>\n" +--%>
<%--" <a href=\"#\" aria-label=\"Next\">\n" +--%>
<%--" <span aria-hidden=\"true\">&raquo;</span>\n" +--%>
<%--" </a>\n" +--%>
<%--" </li>";--%>
<%--pagination.html(lis);--%>
<%--});--%>
<%--}--%>
<%--</script>--%>
<%--<script type="text/javascript">--%>
<%--if ('ontouchstart' in document.documentElement)--%>
<%--document.write("<script src='${path}/assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");--%>
<%--type = "text/javascript" >--%>
<%--try {--%>
<%--ace.settings.loadState('main-container')--%>
<%--} catch (e) {--%>
<%--}--%>
<%--</script>--%>
</body>

</html>
