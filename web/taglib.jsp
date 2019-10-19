<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script src="assets/js/jquery-2.1.4.min.js"></script>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="${path}/assets/css/bootstrap.min.css"/>
<link rel="stylesheet" href="${path}/assets/font-awesome/4.5.0/css/font-awesome.min.css"/>
<!-- text fonts -->
<link rel="stylesheet" href="${path}/assets/css/fonts.googleapis.com.css"/>
<!-- ace styles -->
<link rel="stylesheet" href="${path}/assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style"/>
<link rel="stylesheet" href="${path}/assets/css/ace-part2.min.css" class="ace-main-stylesheet"/>
<link rel="stylesheet" href="${path}/assets/css/ace-skins.min.css"/>
<link rel="stylesheet" href="${path}/assets/css/ace-rtl.min.css"/>
<link rel="stylesheet" href="${path}/assets/css/ace-ie.min.css"/>
<!-- ace settings handler -->
<script src="${path}/assets/js/ace-extra.min.js"></script>
<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->
<script src="${path}/assets/js/html5shiv.min.js"></script>
<script src="${path}/assets/js/respond.min.js"></script>
<script src="${path}/assets/js/jquery-2.1.4.min.js"></script>
<script src="${path}/assets/js/jquery-1.11.3.min.js"></script>
<script src="${path}/assets/js/bootstrap.min.js"></script>
<!-- ace scripts -->
<script src="${path}/assets/js/ace-elements.min.js"></script>
<script src="${path}/assets/js/ace.min.js"></script>
<input type="hidden" value="${path}" id="contextPath">