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

    <title>SB Admin 2 - Forgot Password</title>


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
                        <div class="col-lg-6 d-none d-lg-block bg-password-image"></div>
                        <div class="col-lg-6">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-2">忘记密码?</h1>
                                </div>
                                <form class="user">
                                    <div class="form-group row">
                                        <input type="text" class="form-control form-control-user" id="loginName"
                                               placeholder="请输入你的账号">
                                    </div>
                                    <div class="form-group row">
                                        <input type="email" class="form-control form-control-user" id="email"
                                               placeholder="请输入此账号绑定的邮箱">
                                    </div>
                                    <div class="form-group row">
                                        <input type="password" class="form-control form-control-user" id="password"
                                               placeholder="请输入新密码">
                                    </div>
                                    <a onclick="resetPassword()" class="btn btn-primary btn-user btn-block">
                                        重设密码
                                    </a>
                                </form>
                                <hr>
                                <div class="text-center">
                                    <a class="small" href="${pageContext.request.contextPath}/to_register">创建一个账号!</a>
                                </div>
                                <div class="text-center">
                                    <a class="small" href="${pageContext.request.contextPath}/">已经有账号了? 开始登录!</a>
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

    function resetPassword() {
        let loginName = $("#loginName").val();
        let email = $("#email").val();
        let password = $("#password").val();

        if (loginName === "" || loginName == null || email === "" || email == null || password === "" || password == null) {
            alert("请输入完整！");
        } else {
            $.ajax({
                url: '${pageContext.request.contextPath}/user/forget', //提交的地址
                data: {
                    'loginName': loginName,
                    'email': email
                },
                type: 'post',
                async: false,
                success: function (data) {  //成功
                    if ("1" === data) {//修改成功
                        $.ajax({
                            url: '${pageContext.request.contextPath}/code', //提交的地址
                            data: {'email':email},
                            type: 'post',
                            async: false,
                            success: function () {  //成功
                                let verification = prompt("已发送验证码到你的邮箱，请输入:");
                                $.ajax({
                                    url: '${pageContext.request.contextPath}/user/forget_pwd', //提交的地址
                                    data:
                                        {
                                            "loginName": loginName,
                                            "password": password,
                                            "verification": verification
                                        },
                                    type: 'post',
                                    async: false,
                                    success: function (msg) {  //成功
                                        if ("111" === msg) {
                                            alert("修改成功！");
                                            window.location.href = '${pageContext.request.contextPath}/';
                                        } else if ("000" === msg) {
                                            alert("验证码错误！");
                                        }
                                    }
                                });
                            },
                            error: function () {
                                let verification = prompt("已发送验证码到你的邮箱，请输入:");
                                $.ajax({
                                    url: '${pageContext.request.contextPath}/user/forget_pwd', //提交的地址
                                    data:
                                        {
                                            "loginName": loginName,
                                            "password": password,
                                            "verification": verification
                                        },
                                    type: 'post',
                                    async: false,
                                    success: function (msg) {  //成功
                                        if ("111" === msg) {
                                            alert("修改成功！");
                                            window.location.href = '${pageContext.request.contextPath}/';
                                        } else if ("000" === msg) {
                                            alert("验证码错误！");
                                        }
                                    }
                                });
                            }
                        });

                    } else {
                        alert("账号或邮箱错误！");
                    }
                },
                error: function () {
                    // view("异常！");
                    alert("异常！");
                }
            });
        }
    }
</script>

</body>

</html>
