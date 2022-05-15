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


                <!--fade 淡入淡出-->
                <div class="modal fade" id="myModal" aria-labelledby="myModallabel" aria-hidden="true"
                     tabindex="-1">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="myModallabel">新建任务</h5>
                                <button class="close" type="button" data-dismiss="modal"
                                        aria-hidden="true">&times;
                                </button>
                            </div>
                            <div class="card-body">
                                <div>
                                    <form action="${pageContext.request.contextPath}/task/new_task" method="post">
                                        <div class="form-group">
                                            <label>任务名：&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                            <label>
                                                <input type="text" name="task_name" style="width: 370px;">
                                            </label>
                                        </div>
                                        <div class="form-group">
                                            <label>任务介绍：</label>
                                            <label>
                                                <textarea name="intro" style="width: 370px;height: 200px"></textarea>
                                            </label>
                                        </div>
                                        <div class="form-group">
                                            <label>任务指派：</label>
                                            <label>
                                                <select name="distribution_by">
                                                    <option value="未分配">暂不分配</option>
                                                    <c:forEach var="u" items="${team_user}">
                                                        <option value="${u.login_name}">${u.user_name}</option>
                                                    </c:forEach>
                                                </select>
                                            </label>
                                        </div>

                                        <hr>
                                        <input type="submit" value="创建" class="btn btn-primary ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="reset" value="取消" class="btn btn-primary ">


                                    </form>
                                </div>


                            </div>


                        </div>
                    </div>
                </div>


                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">项目任务</h1>
                    <a  class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" data-target="#myModal"
                       data-toggle="modal">新建任务</a>
                </div>


                <div class="row">

                    <div class="col-lg-6">
                        <c:forEach var="t" items="${tasks}">

                            <!--fade 淡入淡出-->
                            <div class="modal fade" id="Modal${t.task_id}" aria-labelledby="Modelled" aria-hidden="true"
                                 tabindex="-1">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="Modelled">修改信息</h5>
                                            <button class="close" type="button" data-dismiss="modal"
                                                    aria-hidden="true">&times;
                                            </button>
                                        </div>
                                        <div class="card-body">
                                            <div>
                                                <form action="${pageContext.request.contextPath}/task/update" method="post">
                                                    <input type="hidden" name="task_id" value="${t.task_id}">
                                                    <div class="form-group">
                                                        <label>任务名：&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                        <label>
                                                            <input type="text" name="task_name" style="width: 370px;"
                                                                   value="${t.task_name}">
                                                        </label>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>任务介绍：</label>
                                                        <label>
                                                            <textarea name="intro"
                                                                      style="width: 370px;height: 200px">${t.intro}</textarea>
                                                        </label>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>任务指派：</label>
                                                        <label>
                                                            <select name="distribution_by">
                                                                <option value="未分配">暂不分配</option>
                                                                <c:forEach var="u" items="${team_user}">
                                                                <option <c:if test="${t.distribution_by == u.login_name }">selected</c:if> value="${u.login_name}">${u.user_name}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </label>
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

                            <!-- Basic Card Example -->
                            <div class="card shadow mb-4">

                                <div
                                        class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">可领取的任务</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink1"
                                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                             aria-labelledby="dropdownMenuLink1">
                                            <div class="dropdown-header">操作：</div>
                                            <a class="dropdown-item" data-target="#Modal${t.task_id}"
                                               data-toggle="modal">编辑任务信息</a>
                                            <a class="dropdown-item" onclick="del('${t.task_id}')">删除该任务</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item"
                                               href="${pageContext.request.contextPath}/task/receive?task_id=${t.task_id}">领取</a>
                                        </div>
                                    </div>
                                </div>

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
                                        <label>任务发布时间：</label>
                                        <label class="navbar-nav ml-auto">${t.create_time}</label>
                                    </div>
                                    <div class="navbar ">
                                        <label>任务介绍：</label>
                                        <label class="navbar-nav ml-auto">${t.intro}</label>
                                    </div>


                                </div>
                            </div>
                        </c:forEach>


                        <c:forEach var="t" items="${receiveTasks}">

                            <!--fade 淡入淡出-->
                            <div class="modal fade" id="Modal${t.task_id}" aria-labelledby="Modelled" aria-hidden="true"
                                 tabindex="-1">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">修改信息</h5>
                                            <button class="close" type="button" data-dismiss="modal"
                                                    aria-hidden="true">&times;
                                            </button>
                                        </div>
                                        <div class="card-body">
                                            <div>
                                                <form action="${pageContext.request.contextPath}/task/update" method="post">
                                                    <input type="hidden" name="task_id" value="${t.task_id}">
                                                    <div class="form-group">
                                                        <label>任务名：&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                        <label>
                                                            <input type="text" name="task_name" style="width: 370px;"
                                                                   value="${t.task_name}">
                                                        </label>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>任务介绍：</label>
                                                        <label>
                                                            <textarea name="intro"
                                                                      style="width: 370px;height: 200px">${t.intro}</textarea>
                                                        </label>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>任务指派：</label>
                                                        <label>
                                                            <select name="distribution_by">
                                                                <option value="未分配">暂不分配</option>
                                                                <c:forEach var="u" items="${team_user}">
                                                                    <option <c:if test="${t.distribution_by == u.login_name }">selected</c:if> value="${u.login_name}">${u.user_name}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </label>
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

                            <!-- Basic Card Example -->
                            <div class="card shadow mb-4">

                                <div
                                        class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">已分配的任务</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                             aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">操作：</div>
                                            <a class="dropdown-item" data-target="#Modal${t.task_id}"
                                               data-toggle="modal">编辑任务信息</a>
                                            <a class="dropdown-item" onclick="del('${t.task_id}')">删除该任务</a>
                                        </div>
                                    </div>
                                </div>

                                <div class="card-body">
                                    <div class=" navbar">
                                        <label>任务名：</label>
                                        <label class="navbar-nav ml-auto">${t.task_name}</label>
                                    </div>
                                    <div class="navbar">
                                        <label>任务创始人：</label>
                                        <label class="navbar-nav ml-auto">${t.create_by}</label>
                                    </div>
                                    <div class="navbar">
                                        <label>任务领取人：</label>
                                        <label class="navbar-nav ml-auto">${t.distribution_by}</label>
                                    </div>
                                    <div class="navbar   ">
                                        <label>任务发布时间：</label>
                                        <label class="navbar-nav ml-auto">${t.create_time}</label>
                                    </div>
                                    <div class="navbar ">
                                        <label>任务介绍：</label>
                                        <label class="navbar-nav ml-auto">${t.intro}</label>
                                    </div>

                                </div>
                            </div>
                        </c:forEach>


                    </div>

                    <div class="col-lg-6">
                        <!-- Collapsable Card Example -->
                        <div class="card shadow mb-4">
                            <!-- Card Header - Accordion -->
                            <a href="#collapseCardExample" class="d-block card-header py-3" data-toggle="collapse"
                               role="button" aria-expanded="true" aria-controls="collapseCardExample">
                                <h6 class="m-0 font-weight-bold text-primary">已完成的任务</h6>
                            </a>
                            <!-- Card Content - Collapse -->
                            <div class="collapse show" id="collapseCardExample">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="dataTable" width="100%"
                                               cellspacing="0">
                                            <thead>
                                            <tr>
                                                <th>任务名</th>
                                                <th>发布时间</th>
                                                <th>完成时间</th>
                                                <th>完成人</th>
                                                <th>操作</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            <c:forEach var="t" items="${completeTasks}">
                                                <tr>
                                                    <td>${t.task_name}</td>
                                                    <td>${t.create_time}</td>
                                                    <td>${t.finish_time}</td>
                                                    <td>${t.distribution_by}</td>
                                                    <td>
                                                        <a class="btn btn-sm btn-primary shadow-sm" data-target="#myModal${t.task_id}"
                                                           data-toggle="modal">查看</a>
                                                    </td>
                                                </tr>
                                                <!--fade 淡入淡出-->
                                                <div class="modal fade" id="myModal${t.task_id}" aria-labelledby="myModelled" aria-hidden="true" tabindex="-1">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title">任务信息</h5>
                                                                <button class="close" type="button" data-dismiss="modal" aria-hidden="true">&times;
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


                    </div>

                </div>


            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <%@ include file="/WEB-INF/jsp/common/common_footer.jsp" %>

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<%@ include file="/WEB-INF/jsp/common/common_logout.jsp" %>
<%@ include file="/WEB-INF/jsp/common/common_js.jsp" %>
<script type="text/javascript">
    //删除任务
    function del(task_id) {
        let flag = confirm("你确定要删除此任务吗？");
        if (flag) {
            $.ajax({
                url: "${pageContext.request.contextPath}/task/delete",
                type: "post",
                async: false,
                data: {'task_id': task_id},
                success: function (data) {
                    if (data === "1") {
                        alert("删除任务成功！");
                        window.location.href = '${pageContext.request.contextPath}/task/project_task';
                    }
                },
                error: function () {
                    alert("删除任务失败，请检查您的网络！");
                }

            });
        }
    }
</script>

</body>

</html>
