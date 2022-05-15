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
                    <a class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"
                       onclick="dissolve('${team.team_id}')">解散团队</a>
                </div>


                <!-- Content Row -->
                <div class="row">

                    <!-- Grow In Utility -->
                    <div class="col-lg-6">

                        <div class="card position-relative">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">
                                    团队资料
                                    <a href="#" class="btn btn-sm btn-primary shadow-sm" data-target="#myModal"
                                       data-toggle="modal" style="float: right;">修改信息</a>
                                </h6>

                            </div>

                            <!--fade 淡入淡出-->
                            <div class="modal fade" id="myModal" aria-labelledby="label" aria-hidden="true"
                                 tabindex="-1">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="label">修改信息</h5>
                                            <button class="close" type="button" data-dismiss="modal"
                                                    aria-hidden="true">&times;
                                            </button>
                                        </div>


                                        <div class="card-body">

                                            <div>
                                                <form action="${pageContext.request.contextPath}/team/update"
                                                      enctype="multipart/form-data" method="post">
                                                    <input type="hidden" name="team_id" value="${team.team_id}">
                                                    <input type="hidden" name="avatar" value="${team.avatar}">
                                                    <div class="form-group">
                                                        <label>团队头像：</label>
                                                        <input type="file" name="file">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>团队名：&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                        <label>
                                                            <input type="text" name="team_name"
                                                                   value="${team.team_name}">
                                                        </label>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>联系邮箱：</label>
                                                        <label>
                                                            <input type="email" name="email" value="${team.email}">
                                                        </label>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>联系电话：</label>
                                                        <label>
                                                            <input type="text" name="phone" value="${team.phone}">
                                                        </label>

                                                    </div>
                                                    <div class="form-group">
                                                        <label>团队人数：</label>
                                                        <label>
                                                            <input type="text" name="team_num" value="${team.team_num}">
                                                        </label>


                                                    </div>
                                                    <div class="form-group">
                                                        <label>团队介绍：</label>
                                                        <label>
                                                            <textarea name="intro">${team.intro}</textarea>
                                                        </label>

                                                    </div>

                                                    <hr>
                                                    <input type="submit" value="更新" class="btn btn-primary ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <input type="reset" value="取消" class="btn btn-primary ">


                                                </form>
                                            </div>


                                        </div>


                                    </div>
                                </div>
                            </div>


                            <div class="card-body">
                                <div style="text-align: center;">
                                    <img style="width: 150px;height: 150px;border-radius: 50%;"
                                         src="${pageContext.request.contextPath}/upload/${team.avatar}">
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
                                    <a href="${pageContext.request.contextPath}/user/all_user"
                                       class="btn btn-sm btn-primary shadow-sm" style="float: right;">邀请成员</a>
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
                                            <th>操作</th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <c:forEach var="user" items="${team_user}">
                                            <tr>
                                                <td><a class="btn btn-default" data-target="#myModal${user.user_id}"
                                                       data-toggle="modal">
                                                        ${user.login_name}
                                                </a></td>
                                                <td><a class="btn btn-default" data-target="#myModal${user.user_id}"
                                                       data-toggle="modal">
                                                        ${user.user_name}
                                                </a></td>
                                                <td>${user.sex}</td>
                                                <td style="color: chocolate;">${user.team_permission}</td>
                                                <td>
                                                    <c:if test="${user.team_permission != '团队队长'}">
                                                        <a class="btn btn-sm btn-primary shadow-sm"
                                                           onclick="remove('${user.login_name}')">移除</a>
                                                    </c:if>
                                                </td>
                                            </tr>

                                            <!--fade 淡入淡出-->
                                            <div class="modal fade" id="myModal${user.user_id}"
                                                 aria-labelledby="myModallabel"
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
    function remove(login_name) {
        let flag = confirm("你确定要将用户" + login_name + "移出团队吗？");
        if (flag) {
            $.ajax({
                url: "${pageContext.request.contextPath}/mess/remove",
                type: "post",
                async: false,
                data: {'login_name': login_name},
                success: function () {
                    alert("你已成功将该用户移除！");
                    window.location.href= "${pageContext.request.contextPath}/team/my";
                },
                error: function () {
                    alert("移除失败，请检查您的网络！");
                }

            });
        }
    }

    function dissolve(team_id) {
        let flag = confirm("你确定要解散团队吗？解散前请备份好资源文件！");
        if (flag) {
            $.ajax({
                url: "${pageContext.request.contextPath}/mess/dissolve",
                type: "post",
                async: false,
                data: {'team_id': team_id},
                success: function () {
                    alert("你已成功解散该团队！");
                    window.location.href= "${pageContext.request.contextPath}/team/my";
                },
                error: function () {
                    alert("解散失败，请检查您的网络！");
                }

            });
        }
    }
</script>


</body>

</html>
