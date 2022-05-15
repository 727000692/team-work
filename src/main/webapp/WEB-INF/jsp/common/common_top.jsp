<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Topbar -->
<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">



    <!-- Topbar Navbar -->
    <ul class="navbar-nav ml-auto">


        <!-- Nav Item - User Information -->
        <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">${user.user_name}</span>
                <img class="img-profile rounded-circle" src="${pageContext.request.contextPath}/upload/${user.avatar}">
            </a>
            <!-- Dropdown - User Information -->
            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                 aria-labelledby="userDropdown">
                <a class="dropdown-item" href="${pageContext.request.contextPath}/profile">
                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                    个人中心
                </a>
                <a class="dropdown-item"  data-target="#fixPassword" data-toggle="modal">
                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                    修改密码
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                    退出
                </a>
            </div>
        </li>

    </ul>
    <!--fade 淡入淡出-->
    <div class="modal fade" id="fixPassword" aria-labelledby="label" aria-hidden="true"
         tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="label">修改密码</h5>
                    <button class="close" type="button" data-dismiss="modal"
                            aria-hidden="true">&times;
                    </button>
                </div>
                <div class="card-body">
                    <div>
                        <form>
                            <div class="form-group">
                                <label>请输入原密码：</label>
                                <label>
                                    <input type="password" id="password">
                                </label>
                            </div>
                            <div class="form-group">
                                <label>请输入新密码：</label>
                                <label>
                                    <input type="password" id="password1" >
                                </label>
                            </div>
                            <hr>
                            <input type="submit" id="fix" value="修改" class="btn btn-primary ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="reset" value="取消" class="btn btn-primary ">
                        </form>
                    </div>
                </div>


            </div>
        </div>
    </div>

</nav>
<!-- End of Topbar -->
