<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/user_index">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-laugh-wink"></i>
            </div>
            <div class="sidebar-brand-text mx-3">Team-Work</div>
        </a>
        <hr class="sidebar-divider my-0">

        <!-- 首页 -->
        <li class="nav-item active">
            <a class="nav-link" href="${pageContext.request.contextPath}/user_index">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>首页</span></a>
        </li>
        <hr class="sidebar-divider">

        <!-- 用户信息 -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
               aria-expanded="true" aria-controls="collapseTwo">
                <span>用户信息</span>
            </a>
            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <a class="collapse-item" href="${pageContext.request.contextPath}/user/team_user">我的队友</a>
                    <a class="collapse-item" href="${pageContext.request.contextPath}/user/all_user">交友广场</a>
                </div>
            </div>
        </li>
        <hr class="sidebar-divider">

        <!-- 团队信息 -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
               aria-expanded="true" aria-controls="collapseUtilities">
                <span>团队信息</span>
            </a>
            <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                 data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <a class="collapse-item" href="${pageContext.request.contextPath}/team/my">我的团队</a>
                    <a class="collapse-item" href="${pageContext.request.contextPath}/team/all">寻找团队</a>

                </div>
            </div>
        </li>
        <hr class="sidebar-divider">


        <!-- 项目信息 -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
               aria-expanded="true" aria-controls="collapsePages">
                <span>项目信息</span>
            </a>
            <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <a class="collapse-item" href="${pageContext.request.contextPath}/project/team_project">团队项目</a>
                    <a class="collapse-item" href="${pageContext.request.contextPath}/task/project_task">项目任务</a>
                    <a class="collapse-item" href="${pageContext.request.contextPath}/task/my_task">我的任务</a>
                </div>
            </div>
        </li>
        <hr class="sidebar-divider">



        <!-- 信息中心 -->
        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/mess/user_message">
                <i class="fas fa-envelope fa-fw"></i>
                <span>信息中心</span></a>
        </li>

        <!-- 数据统计 -->
        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/project/data">
                <i class="fas fa-fw fa-table"></i>
                <span>数据统计</span></a>
        </li>


    </ul>



