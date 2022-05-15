<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ page import="com.teamwork.service.UserService" %>
<%@ page import="com.teamwork.service.Impl.UserServiceImpl" %>
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

    <title>SB Admin 2 - Tables</title>

    <%@ include file="/WEB-INF/jsp/common/common_css.jsp" %>
    <!-- Custom styles for this page -->
    <link href="${pageContext.request.contextPath}/static/vendor/datatables/dataTables.bootstrap4.min.css"
          rel="stylesheet">

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

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <h1 class="h3 mb-2 text-gray-800">寻找团队</h1>


                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">所有团队</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>团队ID</th>
                                    <th>团队名</th>
                                    <th>团队创始人</th>
                                    <th>联系邮箱</th>
                                    <th>联系电话</th>
                                    <th>团队状态</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="team" items="${teamUsers}">
                                    <tr>
                                        <td><a class="btn btn-default" data-target="#myModal${team.team_id}"
                                               data-toggle="modal">
                                                ${team.team_id}
                                        </a></td>
                                        <td><a class="btn btn-default" data-target="#myModal${team.team_id}"
                                               data-toggle="modal">
                                                ${team.team_name}
                                        </a></td>

                                        <!--这里使用ajax去获取团队创始人的信息-->
                                        <td><a class="btn btn-default" data-target="#myModal${team.create_by}"
                                               data-toggle="modal"
                                               id="create_by">
                                                ${team.create_by}
                                        </a></td>

                                        <td>${team.email}</td>
                                        <td>${team.phone}</td>
                                        <td>
                                            <c:set var="num" value="${(team.status/team.team_num) * 100}"/>

                                            <div class="row no-gutters align-items-center">
                                                <div class="col mr-2">
                                                    <div class="row no-gutters align-items-center">
                                                        <div class="col-auto">
                                                            <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${team.status}/${team.team_num}</div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="progress progress-sm mr-2">
                                                                <div class="progress-bar bg-info" role="progressbar"
                                                                     style="width: ${num}%" aria-valuenow="50"
                                                                     aria-valuemin="0"
                                                                     aria-valuemax="100"></div>
                                                            </div>
                                                        </div>
                                                        <c:if test="${team.team_num > team.status}">
                                                            <a class="btn btn-sm btn-primary shadow-sm"
                                                               onclick="applyJoin('${team.team_id}','${team.create_by}')"
                                                               style="float: right">加入</a>
                                                        </c:if>

                                                    </div>
                                                </div>

                                            </div>
                                        </td>

                                    </tr>

                                    <!--团队信息-->
                                    <div class="modal fade" id="myModal${team.team_id}" aria-labelledby="myModallabel"
                                         aria-hidden="true"
                                         tabindex="-1">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">团队资料</h5>
                                                    <button class="close" type="button" data-dismiss="modal"
                                                            aria-hidden="true">&times;
                                                    </button>
                                                </div>
                                                <div class="card position-relative">
                                                    <div class="card-body">
                                                        <div style="text-align: center;">
                                                            <img style="width: 150px;height: 150px;border-radius: 50%;"
                                                                 src="${pageContext.request.contextPath}/upload/${team.avatar}"><br>
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
                                                            <label>团队当前人数：</label>
                                                            <label class="navbar-nav ml-auto">${team.status}</label>
                                                        </div>
                                                        <div class="navbar ">
                                                            <label>团队介绍：</label>
                                                            <label class="navbar-nav ml-auto">${team.intro}</label>
                                                        </div>

                                                    </div>
                                                </div>


                                            </div>
                                        </div>
                                    </div>


                                    <!--团队创始人信息-->
                                    <div class="modal fade" id="myModal${team.create_by}" aria-labelledby="myModallabel"
                                         aria-hidden="true"
                                         tabindex="-1">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" >个人资料</h5>
                                                    <button class="close" type="button" data-dismiss="modal"
                                                            aria-hidden="true">&times;
                                                    </button>
                                                </div>
                                                <div class="card position-relative">
                                                    <div class="card-body">
                                                        <div style="text-align: center;">
                                                            <img style="width: 150px;height: 150px;border-radius: 50%;"
                                                                 src="${pageContext.request.contextPath}/upload/${team.user_avatar}"><br>
                                                        </div>
                                                        <hr>
                                                        <div class=" navbar">
                                                            <label>用户账号：</label>
                                                            <label class="navbar-nav ml-auto">${team.login_name}</label>
                                                        </div>
                                                        <div class="navbar">
                                                            <label>用户昵称：</label>
                                                            <label class="navbar-nav ml-auto">${team.user_name}</label>
                                                        </div>
                                                        <div class="navbar   ">
                                                            <label>用户邮箱：</label>
                                                            <label class="navbar-nav ml-auto">${team.user_email}</label>
                                                        </div>
                                                        <div class="navbar ">
                                                            <label>手机号码：</label>
                                                            <label class="navbar-nav ml-auto">${team.user_phone}</label>
                                                        </div>
                                                        <div class="navbar ">
                                                            <label>用户性别：</label>
                                                            <label class="navbar-nav ml-auto">${team.user_sex}</label>
                                                        </div>
                                                        <div class="navbar ">
                                                            <label>所属团队：</label>
                                                            <label class="navbar-nav ml-auto">${team.team_name}</label>
                                                        </div>
                                                        <div class="navbar ">
                                                            <label>用户介绍：</label>
                                                            <label class="navbar-nav ml-auto">${team.user_intro}</label>
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

        <!-- Footer -->
        <%@ include file="/WEB-INF/jsp/common/common_footer.jsp" %>
        <!-- End of Footer -->

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

<script type="text/javascript">
    function applyJoin(team_id,create_by){
        let flag = confirm("你确定要加入团队"+team_id+"吗？");
        if (flag){
            $.ajax({
                url:"${pageContext.request.contextPath}/mess/join",
                type:"post",
                async:false,
                data:{
                    'team_id':team_id,
                    'create_by':create_by
                },
                success:function(data){
                    if(data === "1") {
                        alert("您已成功向"+create_by+"提交申请加入信息，请等待他的回应！");
                    }else if (data === "0"){
                        alert("你当前已在团队中，无法再次加入！");
                    }
                },
                error: function () {
                    alert("发送邀请失败，请检查您的网络！");
                }

            });
        }
    }
</script>








</body>

</html>
