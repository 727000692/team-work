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
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">数据统计</h1>
                </div>

                <div class="row">


                    <!-- Earnings (Monthly) Card Example -->
                    <div class="col-xl-6 col-md-6 mb-4">
                        <div class="card border-left-info shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-info text-uppercase mb-1">当前项目进度
                                        </div>
                                        <div class="row no-gutters align-items-center">
                                            <div class="col-auto">
                                                <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${process}%</div>
                                            </div>
                                            <div class="col">
                                                <div class="progress progress-sm mr-2">
                                                    <div class="progress-bar bg-info" role="progressbar"
                                                         style="width: ${process}%" aria-valuenow="${process}" aria-valuemin="0"
                                                         aria-valuemax="100"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Pending Requests Card Example -->
                    <div class="col-xl-6 col-md-6 mb-4">
                        <div class="card border-left-warning shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                            当前项目任务数
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">${num}</div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">

                    <div class="col-xl-6 col-lg-5">
                        <div class="card shadow mb-4">
                            <!-- Card Header - Dropdown -->
                            <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">项目贡献</h6>
                            </div>
                            <!-- Card Body -->
                            <div class="card-body">
                                <!-- 为 ECharts 准备一个 DOM -->
                                <div id="contribute" style="width: 550px;height:400px;"></div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6 mb-4">
                        <!-- Project Card Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">任务进度</h6>
                            </div>
                            <div class="card-body">
                                <c:forEach var="d" items="${taskData}">
                                    <h4 class="small font-weight-bold">${d.user_name}<span
                                            class="float-right">${d.completeNum}/${d.taskNum}</span>
                                    </h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-danger" role="progressbar" style="width: ${d.status}%"
                                             aria-valuenow="${d.status}" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>

                    </div>

                </div>


            </div>

        </div>

        <%@ include file="/WEB-INF/jsp/common/common_footer.jsp" %>


    </div>



</div>


<%@ include file="/WEB-INF/jsp/common/common_logout.jsp" %>
<%@ include file="/WEB-INF/jsp/common/common_js.jsp" %>


<!-- Page level plugins -->
<script src="${pageContext.request.contextPath}/static/vendor/chart.js/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/echarts.js"></script>
<script type="text/javascript">
    window.onload=function contributeData(){

        let chartDom = document.getElementById('contribute');
        let myChart = echarts.init(chartDom);
        let option;
        option = {
            tooltip: {
                trigger: 'item'
            },
            legend: {
                top: '5%',
                left: 'center'
            },
            series: [
                {
                    name: 'Access From',
                    type: 'pie',
                    radius: ['40%', '70%'],
                    avoidLabelOverlap: false,
                    itemStyle: {
                        borderRadius: 10,
                        borderColor: '#fff',
                        borderWidth: 2
                    },
                    label: {
                        show: false,
                        position: 'center'
                    },
                    emphasis: {
                        label: {
                            show: true,
                            fontSize: '40',
                            fontWeight: 'bold'
                        }
                    },
                    labelLine: {
                        show: false
                    },
                    data: [
                        <c:forEach var="d" items="${taskData}">
                        {value:${d.completeNum},name : "${d.user_name}"},
                        </c:forEach>
                    ]
                }
            ]
        };

        option && myChart.setOption(option);
    }






</script>


</body>

</html>