<%--
  Created by IntelliJ IDEA.
  User: FTKJ
  Date: 2019/10/17
  Time: 15:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>会员登录</title>
  </head >
  <body class="skin-1">
  <div style="width: 100%;height: 1000px">
    <div style="height: 4.5%;width: 100%;">
      <jsp:include page="html/index/top.jsp"></jsp:include>
    </div>
    <div style="height: 95.5%;width: 100%;">
      <div style="height: 100%;width: 10%;float: left " class="main-container ace-save-state" id="main-container">">
        <jsp:include page="html/index/left.jsp"></jsp:include>
      </div>
      <div style="height: 90%;width: 90%;float: right">
        <jsp:include page="html/index/right.jsp"></jsp:include>
      </div>
      <div style="height: 10%;width: 90%;background: #ffffff;float:right">
        <jsp:include page="html/index/footer.jsp"></jsp:include>
      </div>
    </div>
  </div>

  </body>
</html>
