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

    <%@ include file="/WEB-INF/jsp/common/common_left.jsp" %>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">
            <%@ include file="/WEB-INF/jsp/common/common_top.jsp" %>

            <!-- 页面内容 -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">我的团队</h1>
                    <a href="${pageContext.request.contextPath}/team/all" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">寻找团队</a>
                </div>

                <!-- Content Row -->
                <div class="row">
                    <!-- Circle Buttons -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">团队信息</h6>
                        </div>
                        <div class="card-body">
                            你暂时还未加入任何团队&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="#" class="btn btn-primary btn-icon-split" data-target="#myModal" data-toggle="modal">
                                    <span class="icon text-white-50">
                                        <i class="fas fa-flag"></i>
                                    </span>
                                <span class="text">新建团队</span>
                            </a>
                        </div>

                    </div>

                    <!--fade 淡入淡出-->
                    <div class="modal fade" id="myModal" aria-labelledby="myModallabel" aria-hidden="true"
                         tabindex="-1">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="myModallabel">新建团队</h5>
                                    <button class="close" type="button" data-dismiss="modal"
                                            aria-hidden="true">&times;</button>
                                </div>


                                <div class="card-body">

                                    <div>
                                        <form action="${pageContext.request.contextPath}/team/new_team" enctype="multipart/form-data" method="post">
                                            <div class="form-group">
                                                <label>团队头像：</label>
                                                <input type="file" name="file">
                                            </div>
                                            <div class="form-group">
                                                <label>团队名：&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                <label>
                                                    <input type="text" name="team_name">
                                                </label>
                                            </div>
                                            <div class="form-group">
                                                <label>联系邮箱：</label>
                                                <label>
                                                    <input type="email"  name="email">
                                                </label>
                                            </div>
                                            <div class="form-group">
                                                <label>联系电话：</label>
                                                <label>
                                                    <input type="text"  name="phone">
                                                </label>

                                            </div>
                                            <div class="form-group">
                                                <label>团队人数：</label>
                                                <label>
                                                    <select name="team_num">
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4">4</option>
                                                        <option value="5">5</option>
                                                        <option value="6">6</option>
                                                        <option value="7">7</option>
                                                        <option value="8">8</option>
                                                        <option value="9">9</option>
                                                        <option value="10">10</option>
                                                    </select>
                                                </label>


                                            </div>
                                            <div class="form-group">
                                                <label>团队介绍：</label>
                                                <label>
                                                    <textarea name="intro"></textarea>
                                                </label>

                                            </div>

                                            <hr>
                                            <input type="submit" value="创建"  class="btn btn-primary ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <input type="reset" value="取消" class="btn btn-primary ">


                                        </form>
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

        <%@ include file="/WEB-INF/jsp/common/common_footer.jsp" %>

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->






<%@ include file="/WEB-INF/jsp/common/common_logout.jsp" %>
<%@ include file="/WEB-INF/jsp/common/common_js.jsp" %>


<!-- Page level plugins -->
<script src="${pageContext.request.contextPath}vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="${pageContext.request.contextPath}js/demo/chart-area-demo.js"></script>
<script src="${pageContext.request.contextPath}js/demo/chart-pie-demo.js"></script>

</body>

</html>