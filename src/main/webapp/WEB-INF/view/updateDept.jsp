<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="ch">

<head>


    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>updateEmp</title>


    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css" />

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/flat-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/jquery.nouislider.css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>

    <script>
        $(function () {
            var isName = false;

            $("#dname").blur(function () {
                var name = $(this).val();
                var reg = /^[\u0391-\uFFE5]{2,4}$/;
                if (reg.test(name)) {
                    $(".checkName").addClass("has-success").removeClass("has-error");
                    isName = true;
                }else {
                    $(".checkName").addClass("has-error").removeClass("has-success");
                    isName = false;
                }
            });


            $(".sub").click(function () {
                if (isName){
                    $(".updateDept").submit();
                }else {
                    alert("输入有误")
                }

            });
        })
    </script>


</head>
<body>
<div id="wrap">
    <!-- 左侧菜单栏目块 -->
    <div class="leftMeun" id="leftMeun">
        <div id="logoDiv">
            <a href="${pageContext.request.contextPath}/emp/index">
                <p id="logoP"><img id="logo" alt="左右结构项目" src="${pageContext.request.contextPath}/static/images/logo.png"><span>员工管理系统</span></p>
            </a>
        </div>
        <div id="personInfor">
            <p id="userName">
                <c:if test="${sessionScope.user == null}">
                    未登录
                </c:if>
                <c:if test="${sessionScope.user != null}">
<%--
                    <img src="${pageContext.request.contextPath}${sessionScope.user.headimg}" alt="" width="50px" height="50px">
--%>

                    你好,${sessionScope.user.username}
                </c:if>
            </p>
            <p><span><a href="${pageContext.request.contextPath}/user/loginView">退出登录</a></span>    </p>
            <%--<p>
                <a>退出登录</a>
            </p>--%>
        </div>
        <div class="meun-title">账号管理</div>
        <div class="meun-item " onclick="location.href ='${pageContext.request.contextPath}/emp/emplist'" aria-controls="sour" role="tab" data-toggle="tab"><img src="${pageContext.request.contextPath}/static/images/icon_source.png">员工信息</div>
        <div class="meun-item meun-item-active" onclick="location.href ='${pageContext.request.contextPath}/dept/deptlist'" aria-controls="char" role="tab" data-toggle="tab"><img src="${pageContext.request.contextPath}/static/images/icon_chara_grey.png">部门信息</div>
        <div class="meun-item" onclick="location.href ='${pageContext.request.contextPath}/dept/countempdeptView'" aria-controls="user" role="tab" data-toggle="tab"><img src="${pageContext.request.contextPath}/static/images/icon_user_grey.png">部门人数</div>
        <div class="meun-item" onclick="location.href ='${pageContext.request.contextPath}/emp/countsexView'" aria-controls="chan" role="tab" data-toggle="tab"><img src="${pageContext.request.contextPath}/static/images/icon_change_grey.png">男女比例</div>

    </div>
    <div id="rightContent">
        <a class="toggle-btn" id="nimei">
            <i class="glyphicon glyphicon-align-justify"></i>
        </a>
        <!-- Tab panes -->
        <div class="tab-content">
            <!-- 资源管理模块 -->
            <div role="tabpanel" class="tab-pane active" id="sour">

                <div class="check-div form-inline">
                    <button class="btn btn-yellow btn-xs"  data-target="#addSource" onclick="location.href = '${pageContext.request.contextPath}/dept/updateDeptView'">添加部门</button>
                </div>
                <div class="row tableHeader">

                    <div class="col-lg-12 col-md-1 col-sm-1 col-xs-1 ">增加部门信息</div>


                </div>
                <div class=" tablebody row">
                    <form class="form-horizontal updateDept" action="${pageContext.request.contextPath}/dept/updateDept" method="post">
                        <input type="hidden" name="dept_id" value="${dept.dept_id}" >
                        <div class="row">

                            <label for="dname" class="col-sm-2 control-label">Dname</label>
                            <div class="col-sm-6 checkName">
                                <input type="text" class="form-control" id="dname" placeholder="dname" name="dname" value="${dept.dname}">
                            </div>
                        </div>


                        <div class="row">
                            <label for="location" class="col-sm-2 control-label"  >location</label>
                            <div class="col-sm-6 ">
                                <input type="text" class="form-control" id="location" placeholder="location" name="location" value="${dept.location}">
                            </div>

                        </div>




                        <div class="row ">
                            <div class="btncenter ">
                                <button type="button" class="btn btn-success  sub btn-sm" data-toggle="modal" data-target="#changeSource">确定</button>
                                <button type="button" class="btn btn-primary  btn-group btn-sm" onclick="window.location.href = '${pageContext.request.contextPath}/dept//deptlist'">取消</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</body>

</html>








