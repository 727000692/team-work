<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <%@ include file="/WEB-INF/jsp/common/common_css.jsp" %>

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <%@ include file="/WEB-INF/jsp/common/common_left.jsp" %>
    <!-- End of Sidebar -->

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
                    <h1 class="h3 mb-0 text-gray-800">欢迎登录</h1>
                    <!-- <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                            class="fas fa-download fa-sm text-white-50"></i> Generate Report</a> -->
                </div>

                <!-- Content Row -->

                <div class="row">
                    <div class="col-lg-6">

                        <div class="card position-relative">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">个人资料</h6>
                            </div>
                            <div class="card-body">
                                <div style="text-align: center;">
                                    <img style="width: 150px;height: 150px;border-radius: 50%;" src="${pageContext.request.contextPath}/upload/${user.avatar}"><br>
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


                    <div class="col-xl-6 col-lg-5">
                        <div class="card  mb-4">
                            <!-- Card Header - Dropdown -->
                            <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">任务进度</h6>
                            </div>
                            <!-- Card Body -->
                            <div class="card-body">
                                <!-- 为 ECharts 准备一个 DOM -->
                                <div id="main" style="width: 550px;height:400px;"></div>
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
<!-- End of Page Wrapper -->

<%@ include file="/WEB-INF/jsp/common/common_logout.jsp" %>
<%@ include file="/WEB-INF/jsp/common/common_js.jsp" %>
<!-- Page level plugins -->
<script src="${pageContext.request.contextPath}/static/vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="${pageContext.request.contextPath}/static/js/echarts.js"></script>

<script type="text/javascript">
    window.onload=function contributeData(){
        let chartDom = document.getElementById('main');
        let myChart = echarts.init(chartDom);
        let option;

        option = {
            tooltip: {
                formatter: '{a} <br/>{b} : {c}%'
            },
            series: [
                {
                    name: 'Pressure',
                    type: 'gauge',
                    progress: {
                        show: true
                    },
                    detail: {
                        valueAnimation: true,
                        formatter: '{value}'
                    },
                    data: [
                        {
                            value: ${process},
                            name: '进度'
                        }
                    ]
                }
            ]
        };

        option && myChart.setOption(option);
    }






</script>



</body>
</html>
