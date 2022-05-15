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

    <%@ include file="/WEB-INF/jsp/common/common_left.jsp" %>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <%@ include file="/WEB-INF/jsp/common/common_top.jsp" %>

            <!-- 页面内容 -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">团队项目</h1>
                    <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" data-target="#myModal"
                       data-toggle="modal">新建项目</a>
                </div>


                <!--fade 淡入淡出-->
                <div class="modal fade" id="myModal" aria-labelledby="myModallabel" aria-hidden="true"
                     tabindex="-1">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="myModallabel">新建项目</h5>
                                <button class="close" type="button" data-dismiss="modal"
                                        aria-hidden="true">&times;
                                </button>
                            </div>
                            <div class="card-body">
                                <div>
                                    <form id="project" enctype="multipart/form-data" method="post">
                                        <div class="form-group">
                                            <label>项目名：&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                            <label>
                                                <input type="text" name="project_name" style="width: 370px;">
                                            </label>
                                        </div>
                                        <div class="form-group">
                                            <label>项目介绍：</label>
                                            <label>
                                                <textarea name="intro" style="width: 370px;height: 200px"></textarea>
                                            </label>
                                        </div>
                                        <div class="form-group">
                                            <label>上传附件：</label>
                                            <input type="file" name="file">
                                        </div>

                                        <hr>
                                        <input type="submit" onclick="new_project(${project.project_id})" value="创建"
                                               class="btn btn-primary ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="reset" value="取消" class="btn btn-primary ">


                                    </form>
                                </div>


                            </div>


                        </div>
                    </div>
                </div>


                <!--fade 淡入淡出-->
                <div class="modal fade" id="Modal" aria-labelledby="Modallabel" aria-hidden="true"
                     tabindex="-1">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="Modallabel">修改信息</h5>
                                <button class="close" type="button" data-dismiss="modal"
                                        aria-hidden="true">&times;
                                </button>
                            </div>
                            <div class="card-body">
                                <div>
                                    <form action="${pageContext.request.contextPath}/project/update"
                                          enctype="multipart/form-data" method="post">
                                        <input type="hidden" name="project_id" value="${project.project_id}">
                                        <div class="form-group">
                                            <label>项目名：&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                            <label>
                                                <input type="text" name="project_name" style="width: 370px;"
                                                       value="${project.project_name}">
                                            </label>
                                        </div>
                                        <div class="form-group">
                                            <label>项目介绍：</label>
                                            <label>
                                                <textarea name="intro"
                                                          style="width: 370px;height: 200px">${project.intro}</textarea>
                                            </label>
                                        </div>
                                        <div class="form-group">
                                            <label>上传附件：</label>
                                            <input type="file" name="file">
                                        </div>

                                        <hr>
                                        <input type="submit" value="修改" class="btn btn-primary ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="reset" value="取消" class="btn btn-primary ">


                                    </form>
                                </div>


                            </div>


                        </div>
                    </div>
                </div>


                <div class="row">

                    <div class="col-lg-6">


                        <!-- Dropdown Card Example -->
                        <div class="card shadow mb-4">
                            <!-- Card Header - Dropdown -->
                            <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">进行中的项目</h6>
                                <div class="dropdown no-arrow">
                                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                         aria-labelledby="dropdownMenuLink">
                                        <div class="dropdown-header">操作：</div>
                                        <a class="dropdown-item" data-target="#Modal" data-toggle="modal">编辑项目信息</a>
                                        <a class="dropdown-item"
                                           onclick="finishProject('${process}',${project.project_id})">标记为已完成</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item"
                                           href="${pageContext.request.contextPath}/task/project_task">项目任务</a>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">


                                <!-- Tasks Card Example -->


                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                            项目完成进度
                                        </div>
                                        <div class="row no-gutters align-items-center">
                                            <div class="col-auto">
                                                <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${process}%
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="progress progress-sm mr-2">
                                                    <div class="progress-bar bg-info" role="progressbar"
                                                         style="width: ${process}%" aria-valuenow="${process}"
                                                         aria-valuemin="0"
                                                         aria-valuemax="100"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                                <hr>


                                <div class=" navbar">
                                    <label>项目名：</label>
                                    <label class="navbar-nav ml-auto">${project.project_name}</label>
                                </div>

                                <div class="navbar">
                                    <label>项目创始人：</label>
                                    <label class="navbar-nav ml-auto">${project.create_by}</label>
                                </div>
                                <div class="navbar   ">
                                    <label>项目发布时间：</label>
                                    <label class="navbar-nav ml-auto">${project.create_time}</label>
                                </div>

                                <div class="navbar ">
                                    <label>项目任务数：</label>
                                    <label class="navbar-nav ml-auto">${num}</label>
                                </div>

                                <div class="navbar ">
                                    <label>项目附件：</label>
                                    <label class="navbar-nav ml-auto">
                                        <a href="${pageContext.request.contextPath}/upload/${project.file_path}"
                                           download="${project.file_name}"
                                           class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                                class="fas fa-download fa-sm text-white-50"></i>点击下载</a>
                                    </label>
                                </div>

                            </div>
                        </div>

                        <!-- Collapsable Card Example -->
                        <div class="card shadow mb-4">
                            <!-- Card Header - Accordion -->
                            <a href="#collapseCardExample" class="d-block card-header py-3" data-toggle="collapse"
                               role="button" aria-expanded="true" aria-controls="collapseCardExample">
                                <h6 class="m-0 font-weight-bold text-primary">已完成的项目</h6>
                            </a>
                            <!-- Card Content - Collapse -->
                            <div class="collapse show" id="collapseCardExample">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="dataTable" width="100%"
                                               cellspacing="0">
                                            <thead>
                                            <tr>
                                                <th>项目名</th>
                                                <th>发布时间</th>
                                                <th>完成时间</th>
                                                <th>附件</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            <c:forEach var="p" items="${projects}">
                                                <tr>
                                                    <td>
                                                        <a href="${pageContext.request.contextPath}/project/complete?project_id=${p.project_id}">
                                                                ${p.project_name}
                                                        </a>

                                                    </td>
                                                    <td>${p.create_time}</td>
                                                    <td>${p.finish_time}</td>
                                                    <td>
                                                        <a href="${pageContext.request.contextPath}/upload/${p.file_path}"
                                                           download="${p.file_name}">下载</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>

                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="col-lg-6">


                        <!-- Basic Card Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">项目介绍</h6>
                            </div>
                            <div class="card-body">
                                ${project.intro}
                            </div>
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
<script type="text/javascript">
    function new_project(project) {
        if (project == null) {
            let formData = new FormData($("#project")[0]);
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/project/new",
                data: formData,
                dataType: 'json',
                async: false,
                contentType: false,
                processData: false,
                success: function (data) {
                    alert("创建成功！");
                    window.location.href = "${pageContext.request.contextPath}/project/team_project";

                },
                error: function () {
                    alert("新建错误，请检查你的网络！");
                }

            });
        } else {
            alert("当前存在一个未完成的项目！请完成后再新建！")
        }

    }

    function finishProject(process, project_id) {
        if (process === "100") {
            //项目未完成
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/project/finish",
                data: {'project_id': project_id},
                dataType: 'json',
                async: false,
                success: function (data) {
                    window.location.href = "${pageContext.request.contextPath}/project/team_project";
                },
                error: function () {
                    alert("新建错误，请检查你的网络！");
                }

            });
        } else {
            alert("当前项目还存在未完成的任务！请完成所有任务后再标记为已完成！")
        }

    }
</script>
</body>

</html>
