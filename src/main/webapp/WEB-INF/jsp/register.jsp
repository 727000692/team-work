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

    <title>用户注册</title>


</head>

<body class="bg-gradient-primary">

<div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
        <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
                <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                <div class="col-lg-7">
                    <div class="p-5">
                        <div class="text-center">
                            <h1 class="h4 text-gray-900 mb-4">创建一个账号!</h1>
                        </div>
                        <form class="user">
                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <input type="text" class="form-control form-control-user" id="loginName"
                                           placeholder="请输入账号">
                                </div>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control form-control-user" id="userName"
                                           placeholder="请输入姓名">
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control form-control-user" id="email"
                                       placeholder="请输入邮箱">
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <input type="password" class="form-control form-control-user"
                                           id="password" placeholder="请输入密码">
                                </div>
                                <div class="col-sm-6">
                                    <input type="password" class="form-control form-control-user"
                                           id="password1" placeholder="重复你的密码">
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <input type="text" class="form-control form-control-user"
                                           id="verification" placeholder="请输入验证码">
                                </div>
                                <div class="col-sm-6">
                                    <input type="button" value="发送验证码" onclick="sendEmail();set_time(this);"
                                           class="btn btn-primary btn-user btn-block">
                                </div>
                            </div>
                            <input type="button" value="注册" onclick="register()"
                                   class="btn btn-primary btn-user btn-block">


                        </form>
                        <hr>
                        <div class="text-center">
                            <a class="small" href="${pageContext.request.contextPath}/forget">忘记密码?</a>
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

<script type="text/javascript">
    let init_down_time = 30;			    /*倒计时总时长*/
    let down_time = 30;				/*倒计时变量*/
    function set_time(val) {
        if (down_time === 0) {
            val.removeAttribute("disabled");    	/*移除框的属性*/
            val.value = "获取验证码";
            down_time = init_down_time;
        } else {
            val.setAttribute("disabled", true); 		/*设置框的属性*/
            val.value = "重新发送(" + down_time + ")";
            down_time--;

            setTimeout(function () {
                set_time(val)
            }, 1000);   	/*设置一秒*/
        }
    }

    function sendEmail() {

        //获取收件邮箱
        let email = $("#email").val();

        if (email === null || email === "") {
            alert("请输入邮箱！");
        } else {
            //发送请求
            $.post("code", {email: email}, function (data) {
                console.log(data);
            }, "text");
        }


    }


    function register() {
        let loginName = $("#loginName").val();
        let userName = $("#userName").val();
        let email = $("#email").val();
        let password = $("#password").val();
        let password1 = $("#password1").val();
        let verification = $("#verification").val();

        if (verification === "" || verification === null || loginName === "" || loginName === null || userName === "" || userName === null || email === "" || email === null || password === "" || password === null || password1 === "") {
            alert("请输入完整！");
        } else {
            if (password !== password1) {
                alert("两次输入的密码不一致！");
            } else {
                $.ajax({
                    url: '${pageContext.request.contextPath}/user/register', //提交的地址
                    data: {
                        'login_name': loginName,
                        'user_name':userName,
                        'password': password,
                        'email':email,
                        'verification':verification
                    },
                    type: 'post',
                    async: false,
                    success: function (data) {  //成功
                        if (data === "1"){
                            alert("注册成功！");
                            window.location.href = '${pageContext.request.contextPath}/';
                        }else if (data === "0"){
                            alert("该账号已存在！");
                        }else if (data === "-1"){
                            alert("验证码错误！");
                        }else {
                            alert("注册失败！");
                        }
                    },
                    error: function () {
                        // view("异常！");
                        alert("异常！");
                    }
                });


            }
        }
    }
</script>

</body>

</html>
