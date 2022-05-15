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
                <h1 class="h3 mb-2 text-gray-800">信息中心</h1>


                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">所有信息</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>发送人</th>
                                    <th>类型</th>
                                    <th>内容</th>
                                    <th>时间</th>
                                    <th>状态</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="m" items="${messages}">
                                    <tr>
                                        <td>${m.send_name}</td>
                                        <td>${m.message_type}</td>
                                        <td>${m.content}</td>
                                        <td>${m.create_time}</td>
                                        <td>
                                            <c:if test="${m.tag == '0'}">
                                                <a data-target="#myModal${m.id}"
                                                   data-toggle="modal">
                                                    <span style="color: #1cc88a">未读</span>
                                                </a>
                                            </c:if>
                                            <c:if test="${m.tag == '1'}">
                                                <span style="color: #dda20a">已读</span>
                                            </c:if>
                                        </td>
                                        <td>
                                            <a class="btn btn-sm btn-primary shadow-sm"
                                               onclick="del('${m.id}','${m.tag}')">删除</a>

                                        </td>
                                    </tr>

                                    <!--fade 淡入淡出-->
                                    <div class="modal fade" id="myModal${m.id}" aria-labelledby="myModallabel"
                                         aria-hidden="true"
                                         tabindex="-1">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">信息内容</h5>
                                                    <button class="close" type="button" data-dismiss="modal"
                                                            aria-hidden="true">&times;
                                                    </button>
                                                </div>
                                                <div class="card position-relative">
                                                    <div class="card-body">
                                                        <div class=" navbar">
                                                            <label>发送人：</label>
                                                            <label class="navbar-nav ml-auto">${m.send_name}</label>
                                                        </div>
                                                        <div class="navbar">
                                                            <label>信息类型：</label>
                                                            <label class="navbar-nav ml-auto">${m.message_type}</label>
                                                        </div>
                                                        <div class="navbar   ">
                                                            <label>发送时间：</label>
                                                            <label class="navbar-nav ml-auto">${m.create_time}</label>
                                                        </div>
                                                        <div class="navbar ">
                                                            <label>具体内容：</label>
                                                            <label class="navbar-nav ml-auto">${m.content}</label>
                                                        </div>
                                                        <div class="navbar ">
                                                            <label>
                                                                <c:if test="${m.message_type == '加入团队'}">
                                                                    <a class="btn btn-sm btn-primary shadow-sm"
                                                                       onclick="deal('agree','${m.id}','${m.send_name}','${m.team_id}','${m.type}')">同意</a>
                                                                    <a class="btn btn-sm btn-primary shadow-sm"
                                                                       onclick="deal('refuse','${m.id}','${m.send_name}','${m.team_id}','${m.type}')">拒绝</a>
                                                                </c:if>

                                                                <c:if test="${m.message_type != '加入团队'}">
                                                                    <a class="btn btn-sm btn-primary shadow-sm"
                                                                       href="${pageContext.request.contextPath}/mess/read?id=${m.id}">标记为已读</a>
                                                                </c:if>
                                                            </label>
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
<script type="text/javascript">

    function deal(tag, id, send_name, team_id, type) {
        if (tag === "agree") {
            $.ajax({
                url: "${pageContext.request.contextPath}/mess/deal_agree",
                type: "post",
                async: false,
                data: {
                    'id': id,
                    'type': type,
                    'send_name': send_name,
                    'team_id': team_id
                },
                success: function (data) {
                    if (data === 'invite_1') {
                        alert("恭喜你成功加入团队" + team_id);
                    } else if (data === 'invite_-1') {
                        alert("该团队人数已满，加入失败！");
                    } else if (data === 'invite_-2') {
                        alert("你当前已在团队中，不可再加入！");
                    } else if (data === 'apply_1') {
                        alert("已批准用户" + send_name + "加入我的团队！");
                    } else if (data === 'apply_-1') {
                        alert("你的团队人数已满，无法批准该用户加入！");
                    } else if (data === 'apply_-2') {
                        alert("该用户已加入团队，不可再批准加入！");
                    } else if (data === '0') {
                        alert("错误！");
                    }
                    window.location.href = "${pageContext.request.contextPath}/mess/user_message";
                },
                error: function () {
                    alert("同意失败，请检查您的网络！");
                }
            });
        } else if (tag === "refuse") {
            $.ajax({
                url: "${pageContext.request.contextPath}/mess/deal_refuse",
                type: "post",
                async: false,
                data: {
                    'id': id,
                    'type': type,
                    'send_name': send_name,
                },
                success: function (data) {
                    if (data === "1") {
                        alert("拒绝成功！");
                    } else if (data === "0") {
                        alert("错误！");
                    }
                    window.location.href = "${pageContext.request.contextPath}/mess/user_message";
                },
                error: function () {
                    alert("拒绝失败，请检查您的网络！");
                }

            });

        }

    }
    function del(id,tag){
        if (tag === '0'){
            alert("此条信息为处理，请处理完成后再执行删除！");
        }else {
            let flag = confirm("你确定要删除这条信息吗？此操作不可逆！");
            if (flag){
                $.ajax({
                    url:"${pageContext.request.contextPath}/mess/del",
                    type:"post",
                    async:false,
                    data:{'id':id},
                    success:function(data){
                        if(data === "1") {
                            alert("删除成功！");
                        }else if (data === "0"){
                            alert("删除失败！");
                        }
                        window.location.href = "${pageContext.request.contextPath}/mess/user_message";
                    },
                    error: function () {
                        alert("操作失败，请检查您的网络！");
                    }

                });
            }
        }
    }

</script>
</body>

</html>
