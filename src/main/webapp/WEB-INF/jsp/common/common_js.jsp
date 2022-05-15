<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Bootstrap core JavaScript-->
<script src="${pageContext.request.contextPath}/static/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="${pageContext.request.contextPath}/static/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="${pageContext.request.contextPath}/static/js/sb-admin-2.min.js"></script>
<script type="text/javascript">
    $("#fix").click(
        function () {
            let password = $("#password").val();
            let password1 = $("#password1").val();
            if (password === "" || password == null || password1 === "" || password1 == null) {
                alert("请输入完整！");
            } else {
                $.ajax({
                    url: '${pageContext.request.contextPath}/user/fix', //提交的地址
                    data: {
                        'password': password,
                        'password1': password1
                    },
                    type: 'post',
                    async: false,
                    success: function (data) {  //成功
                        if ("1" === data) {//修改成功
                            alert("修改成功！请退出后重新登录！");
                            window.location.href='${pageContext.request.contextPath}/logout';
                        } else if ("-1" === data){
                            alert("原密码输入错误！");
                        }else {
                            alert("修改失败！");
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