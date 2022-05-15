<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/common/common_js.jsp" %>
<%@ include file="/WEB-INF/jsp/common/common_css.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>用户登录</title>

</head>

<body class="bg-gradient-primary">

<div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

        <div class="col-xl-10 col-lg-12 col-md-9">

            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                        <div class="col-lg-6">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">欢迎使用Team-Work!</h1>
                                </div>
                                <form class="user" id="user">
                                    <div class="form-group">
                                        <input type="text" class="form-control form-control-user" id="loginName"
                                               name="loginName"
                                               aria-describedby="emailHelp" placeholder="输入你的账号">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control form-control-user" id="password"
                                               name="password"
                                               placeholder="输入你的密码">
                                    </div>
                                    <div class="form-group">
                                        <div class="custom-control custom-checkbox small">
                                            <input type="checkbox" class="custom-control-input" id="customCheck">
                                            <label class="custom-control-label" for="customCheck">记住我</label>
                                        </div>
                                    </div>

                                    <input type="button" value="登录" id="login"
                                           class="btn btn-primary btn-user btn-block">
                           
                                </form>
                                <hr>
                                <div class="text-center">
                                    <a class="small" href="${pageContext.request.contextPath}/forget">忘记密码?</a>
                                </div>
                                <div class="text-center">
                                    <a class="small" href="${pageContext.request.contextPath}/to_register">创建一个账号!</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>

</div>


<script type="text/javascript">
    $("#login").click(
        function () {
            let loginName = $("#loginName").val();
            let password = $("#password").val();
            if (loginName === "" || loginName == null || password === "" || password == null) {
                alert("账号/密码不能为空！");
            } else {
                $.ajax({
                    url: '${pageContext.request.contextPath}/user/login', //提交的地址
                    data: {
                        'login_name': loginName,
                        'password': password
                    },
                    type: 'post',
                    async: false,
                    success: function (data) {  //成功
                        if ("0" === data) {//普通用户
                            location.href="${pageContext.request.contextPath}/user_index";
                        } else if ("1" === data) {//管理员

                            location.href=""
                        } else {
                            alert("账号/密码错误！");
                        }

                    },
                    error: function () {
                        // view("异常！");
                        alert("异常！");
                    }
                });
            }
        });
</script>
</body>

</html>