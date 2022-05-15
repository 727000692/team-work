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
        <h1 class="h3 mb-2 text-gray-800">交友广场</h1>


        <!-- DataTales Example -->
        <div class="card shadow mb-4">
          <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">所有用户</h6>
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                  <th>用户账号</th>
                  <th>用户昵称</th>
                  <th>性别</th>
                  <th>用户邮箱</th>
                  <th>手机号码</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="user" items="${teamUsers}">
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
                    <td>${user.email}</td>
                    <td>${user.phonenumber}</td>
                  </tr>

                  <!--fade 淡入淡出-->
                  <div class="modal fade" id="myModal${user.user_id}" aria-labelledby="myModallabel"
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

</body>

</html>
