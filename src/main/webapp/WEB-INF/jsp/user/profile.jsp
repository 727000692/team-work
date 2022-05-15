<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                <h1 class="h3 mb-1 text-gray-800">个人中心</h1>

                <!-- Content Row -->
                <div class="row">

                    <!-- Grow In Utility -->
                    <div class="col-lg-6">

                        <div class="card position-relative">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">个人资料</h6>
                            </div>
                            <div class="card-body">
                                <div style="text-align: center;">
                                    <img style="width: 150px;height: 150px;border-radius: 50%;" src="${pageContext.request.contextPath}/upload/${user.avatar}"><br>
                                    <a class="btn btn-default" data-target="#myModal" data-toggle="modal">修改头像</a>
                                </div>
                                <hr>
                                <div class=" navbar">
                                    <label>登录账号：</label>
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

                    <!-- Fade In Utility -->
                    <div class="col-lg-6">

                        <div class="card position-relative">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">基本资料</h6>
                            </div>
                            <div class="card-body">

                                <div>
                                    <form action="${pageContext.request.contextPath}/user/update" method="post">
                                        <div class="form-group">
                                            <label>用户昵称：</label>
                                            <input type="text"  name="user_name" value="${user.user_name}">
                                        </div>
                                        <div class="form-group">
                                            <label>用户邮箱：</label>
                                            <input type="text"  name="email" value="${user.email}">
                                        </div>
                                        <div class="form-group">
                                            <label>手机号码：</label>
                                            <input type="text" name="phonenumber" value="${user.phonenumber}">

                                        </div>
                                        <div class="form-group">
                                            <label>用户性别：</label>
                                            男<input type="radio" name="sex" checked="checked" value="男" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            女<input type="radio" name="sex" value="女" />

                                        </div>
                                        <div class="form-group">
                                            <label>个人介绍：</label>
                                            <textarea name="intro">${user.intro}</textarea>

                                        </div>

                                        <hr>
                                        <input type="submit" value="更新"  class="btn btn-primary ">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="reset" value="取消"  class="btn btn-primary ">
                                    </form>
                                </div>


                            </div>
                        </div>

                    </div>

                </div>





                <!--修改头像-->
                <div class="modal fade" id="myModal" aria-labelledby="myModallabel" aria-hidden="true"
                     tabindex="-1">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="myModallabel">修改头像</h5>
                                <button class="close" type="button" data-dismiss="modal"
                                        aria-hidden="true">&times;</button>
                            </div>
                            <div class="card-body">
                                <form action="${pageContext.request.contextPath}/user/update_photo" enctype="multipart/form-data" method="post">
                                    <div class="form-group">
                                        <label>上传头像：</label>
                                        <input type="file" name="file">
                                    </div>

                                    <hr>
                                    <input type="submit" value="更新"  class="btn btn-primary ">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="reset" value="清除"  class="btn btn-primary " >
                                </form>
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
        <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

</div>

<!-- Scroll to Top Button-->
<%@ include file="/WEB-INF/jsp/common/common_logout.jsp" %>
<%@ include file="/WEB-INF/jsp/common/common_js.jsp" %>

<!-- Page level plugins -->
<script src="${pageContext.request.contextPath}/static/vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="${pageContext.request.contextPath}/static/js/demo/chart-area-demo.js"></script>
<script src="${pageContext.request.contextPath}/static/js/demo/chart-pie-demo.js"></script>

</body>

</html>
