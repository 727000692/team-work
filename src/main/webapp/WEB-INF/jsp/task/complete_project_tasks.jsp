<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 2021/12/25
  Time: 10:02 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Team-Work</title>
    <%@ include file="/WEB-INF/jsp/common/common_css.jsp" %>

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <%@ include file="/WEB-INF/jsp/common/common_left.jsp" %>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <%@ include file="/WEB-INF/jsp/common/common_top.jsp" %>

            <!-- 页面内容 -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <h1 class="h3 mb-2 text-gray-800">项目任务</h1>


                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">该项目已完成的任务</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%"
                                   cellspacing="0">
                                <thead>
                                <tr>
                                    <th>任务名</th>
                                    <th>创始人</th>
                                    <th>完成人</th>
                                    <th>发布时间</th>
                                    <th>完成时间</th>
                                    <th>操作</th>
                                </tr>
                                </thead>

                                <tbody>
                                <c:forEach var="t" items="${complete}">
                                    <tr>
                                        <td>${t.task_name}</td>
                                        <td>${t.create_by}</td>
                                        <td>${t.distribution_by}</td>
                                        <td>${t.create_time}</td>
                                        <td>${t.finish_time}</td>
                                        <td>
                                            <a class="btn btn-sm btn-primary shadow-sm"
                                               data-target="#myModal${t.task_id}"
                                               data-toggle="modal">查看</a>
                                        </td>
                                    </tr>
                                    <!--fade 淡入淡出-->
                                    <div class="modal fade" id="myModal${t.task_id}"
                                         aria-labelledby="myModelled" aria-hidden="true" tabindex="-1">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">任务信息</h5>
                                                    <button class="close" type="button" data-dismiss="modal"
                                                            aria-hidden="true">&times;
                                                    </button>
                                                </div>
                                                <div class="card position-relative">
                                                    <div class="card-body">
                                                        <div class=" navbar">
                                                            <label>任务名：</label>
                                                            <label class="navbar-nav ml-auto">${t.task_name}</label>
                                                        </div>
                                                        <div class="navbar">
                                                            <label>任务创始人：</label>
                                                            <label class="navbar-nav ml-auto">${t.create_by}</label>
                                                        </div>
                                                        <div class="navbar   ">
                                                            <label>任务领取人：</label>
                                                            <label class="navbar-nav ml-auto">${t.distribution_by}</label>
                                                        </div>

                                                        <div class="navbar ">
                                                            <label>任务发布时间：</label>
                                                            <label class="navbar-nav ml-auto">${t.create_time}</label>
                                                        </div>
                                                        <div class="navbar ">
                                                            <label>任务完成时间：</label>
                                                            <label class="navbar-nav ml-auto">${t.finish_time}</label>
                                                        </div>
                                                        <div class="navbar ">
                                                            <label>任务介绍：</label>
                                                            <label class="navbar-nav ml-auto">${t.intro}</label>
                                                        </div>
                                                        <div class="navbar ">
                                                            <label>任务提交信息：</label>
                                                            <label class="navbar-nav ml-auto">${t.info}</label>
                                                        </div>

                                                        <div class="navbar ">
                                                            <label>任务提交附件：</label>
                                                            <label class="navbar-nav ml-auto">
                                                                <a href="${pageContext.request.contextPath}/upload/${t.file_path}"
                                                                   download="${t.file_name}"
                                                                   class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                                                        class="fas fa-download fa-sm text-white-50"></i>点击下载</a>
                                                            </label>
                                                        </div>

                                                    </div>
                                                </div>


                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>


            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <%@ include file="/WEB-INF/jsp/common/common_footer.jsp" %>

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<%@ include file="/WEB-INF/jsp/common/common_logout.jsp" %>
<%@ include file="/WEB-INF/jsp/common/common_js.jsp" %>
<!-- Page level plugins -->
<script src="${pageContext.request.contextPath}/static/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/static/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="${pageContext.request.contextPath}/static/js/demo/datatables-demo.js"></script>


</body>

</html>
