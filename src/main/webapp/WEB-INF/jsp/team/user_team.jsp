<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

            <!-- Topbar -->
            <%@ include file="/WEB-INF/jsp/common/common_top.jsp" %>

            <!-- 页面内容 -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">我的团队</h1>
                    <a  class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"
                        onclick="exit('${team.create_by}')"
                    >退出团队</a>
                </div>



                <!-- Content Row -->
                <div class="row">

                    <!-- Grow In Utility -->
                    <div class="col-lg-6">

                        <div class="card position-relative">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">
                                    团队资料
                                </h6>

                            </div>
                            <div class="card-body">
                                <div style="text-align: center;">
                                    <img style="width: 150px;height: 150px;border-radius: 50%;" src="${pageContext.request.contextPath}/upload/${team.avatar}">
                                </div>
                                <hr>
                                <div class=" navbar">
                                    <label>团队名：</label>
                                    <label class="navbar-nav ml-auto">${team.team_name}</label>
                                </div>

                                <div class="navbar">
                                    <label>团队创始人：</label>
                                    <label class="navbar-nav ml-auto">${team.create_by}</label>
                                </div>
                                <div class="navbar   ">
                                    <label>联系邮箱：</label>
                                    <label class="navbar-nav ml-auto">${team.email}</label>
                                </div>

                                <div class="navbar ">
                                    <label>联系电话：</label>
                                    <label class="navbar-nav ml-auto">${team.phone}</label>
                                </div>
                                <div class="navbar ">
                                    <label>团队上限人数：</label>
                                    <label class="navbar-nav ml-auto">${team.team_num}</label>
                                </div>


                                <div class="navbar ">
                                    <label>团队介绍：</label>
                                    <label class="navbar-nav ml-auto">${team.intro}</label>
                                </div>

                            </div>
                        </div>

                    </div>

                    <!-- Fade In Utility -->
                    <div class="col-lg-6">

                        <div class="card position-relative">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">
                                    团队成员
                                </h6>
                            </div>
                            <div class="card-body">

                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                        <tr>
                                            <th>用户账号</th>
                                            <th>用户昵称</th>
                                            <th>性别</th>
                                            <th>权限</th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <c:forEach var="user" items="${team_user}">
                                            <tr>
                                                <td><a class="btn btn-default" data-target="#myModal${user.user_id}" data-toggle="modal">
                                                        ${user.login_name}
                                                </a></td>
                                                <td><a class="btn btn-default" data-target="#myModal${user.user_id}" data-toggle="modal">
                                                        ${user.user_name}
                                                </a></td>
                                                <td>${user.sex}</td>
                                                <td style="color: chocolate;">${user.team_permission}</td>
                                            </tr>

                                            <!--fade 淡入淡出-->
                                            <div class="modal fade" id="myModal${user.user_id}" aria-labelledby="myModallabel"
                                                 aria-hidden="true"
                                                 tabindex="-1">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="myModallabel">个人资料</h5>
                                                            <button class="close" type="button" data-dismiss="modal"
                                                                    aria-hidden="true">&times;
                                                            </button>
                                                        </div>
                                                        <div class="card position-relative">
                                                            <div class="card-body">
                                                                <div style="text-align: center;">
                                                                    <img style="width: 150px;height: 150px;border-radius: 50%;"
                                                                         src="${pageContext.request.contextPath}/upload/${user.avatar}"><br>
                                                                </div>
                                                                <hr>
                                                                <div class=" navbar">
                                                                    <label>用户账号：</label>
                                                                    <label class="navbar-nav ml-auto">${user.login_name}</label>
                                                                </div>
                                                                <div class="navbar">
                                                                    <label>用户昵称：</label>
                                                                    <label class="navbar-nav ml-auto">${user.user_name}</label>
                                                                </div>
                                                                <div class="navbar   ">
                                                                    <label>用户邮箱：</label>
                                                                    <label class="navbar-nav ml-auto">${user.email}</label>
                                                                </div>
                                                                <div class="navbar ">
                                                                    <label>手机号码：</label>
                                                                    <label class="navbar-nav ml-auto">${user.phonenumber}</label>
                                                                </div>
                                                                <div class="navbar ">
                                                                    <label>用户性别：</label>
                                                                    <label class="navbar-nav ml-auto">${user.sex}</label>
                                                                </div>
                                                                <div class="navbar ">
                                                                    <label>所属团队：</label>
                                                                    <label class="navbar-nav ml-auto">${user.team_id}</label>
                                                                </div>
                                                                <div class="navbar ">
                                                                    <label>用户介绍：</label>
                                                                    <label class="navbar-nav ml-auto">${user.intro}</label>
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
            <!-- /.container-fluid -->

        </div>
        <%@ include file="/WEB-INF/jsp/common/common_footer.jsp" %>

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->


<%@ include file="/WEB-INF/jsp/common/common_logout.jsp" %>
<%@ include file="/WEB-INF/jsp/common/common_js.jsp" %>
<script type="text/javascript">
    function exit(create_by) {
        let flag = confirm("你确定要退出该团队吗？");
        if (flag) {
            $.ajax({
                url: "${pageContext.request.contextPath}/mess/exit",
                type: "post",
                async: false,
                data: {'create_by': create_by},
                success: function () {
                    alert("成功退出该团队");
                    window.location.href= "${pageContext.request.contextPath}/team/my";
                },
                error: function () {
                    alert("退出失败，请检查您的网络！");
                }

            });
        }
    }
</script>

</body>

</html>

