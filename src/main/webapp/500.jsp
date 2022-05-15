<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>500</title>
    <%@ include file="/WEB-INF/jsp/common/common_css.jsp" %>

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <%@ include file="/WEB-INF/jsp/common/common_left.jsp" %>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <%@ include file="/WEB-INF/jsp/common/common_top.jsp" %>

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- 404 Error Text -->
                <div class="text-center">
                    <div class="error mx-auto" data-text="500">500</div>
                    <p class="lead text-gray-800 mb-5">服务器内部错误</p>
                    <p class="text-gray-500 mb-0">请检查日志信息...</p>
                    <a href="${pageContext.request.contextPath}/user_index">&larr; 返回首页</a>
                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <%@ include file="/WEB-INF/jsp/common/common_footer.jsp" %>

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<%@ include file="/WEB-INF/jsp/common/common_logout.jsp" %>
<%@ include file="/WEB-INF/jsp/common/common_js.jsp" %>

</body>

</html>

