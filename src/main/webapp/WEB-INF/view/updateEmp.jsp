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
            var isPhone = false;
            $("#name").blur(function () {
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
            $("#phone").blur(function () {
                var phone = $(this).val();
                var reg = /^[1][3|5|7|8][0-9]{9}$/;
                if (reg.test(phone)) {
                    $(".checkPhone").addClass("has-success").removeClass("has-error");
                    isPhone = true;
                }else {
                    $(".checkPhone").addClass("has-error").removeClass("has-success");
                    isPhone = false;
                }
            });

            $(".sub").click(function () {
                if (isName){
                    $(".updateEmp").submit();
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
        <div class="meun-item meun-item-active" onclick="location.href ='${pageContext.request.contextPath}/emp/emplist'" aria-controls="sour" role="tab" data-toggle="tab"><img src="${pageContext.request.contextPath}/static/images/icon_source.png">员工信息</div>
        <div class="meun-item" onclick="location.href ='${pageContext.request.contextPath}/dept/deptlist'" aria-controls="char" role="tab" data-toggle="tab"><img src="${pageContext.request.contextPath}/static/images/icon_chara_grey.png">部门信息</div>
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
                    <button class="btn btn-yellow btn-xs"  data-target="#addSource" onclick="location.href = '${pageContext.request.contextPath}/emp/addEmpView'">添加员工</button>
                </div>
                <div class="row tableHeader">

                    <div class="col-lg-12 col-md-1 col-sm-1 col-xs-1 ">旧员工信息</div>


                </div>
                <div class=" tablebody row">
                    <form class="form-horizontal updateEmp" action="${pageContext.request.contextPath}/emp/updateEmp" method="post">

                        <input type="hidden" name="emp_id" value="${emp.emp_id}" >
                        <div class="row">

                            <label for="name" class="col-sm-2 control-label">Name</label>
                            <div class="col-sm-6 checkName">
                                <input type="text" class="form-control" id="name" placeholder="name" name="name" value="${emp.name}">
                            </div>
                        </div>
                        <div class="row">
                            <label  class="col-sm-2 control-label">Sex</label>
                            <div class="col-sm-6">
                                <lavel class="radio-inline">
                                    <input type="radio" name="sex"  <c:if test="${emp.sex == '男'}">checked</c:if> checked style="margin-top: 15px">男
                                </lavel>
                                <lavel class="radio-inline">
                                    <input type="radio" name="sex" <c:if test="${emp.sex == '女'}">checked</c:if> style="margin-top: 15px">女
                                </lavel>

                            </div>

                        </div>

                        <div class="row">
                            <label for="phone" class="col-sm-2 control-label"   onkeyup="value=value.replace(/[^\d]/g,'')">phone</label>
                            <div class="col-sm-6 checkPhone">
                                <input type="text" class="form-control" id="phone" placeholder="phone" name="phone" value="${emp.phone}">
                            </div>

                        </div>
                        <div class="row">
                            <label for="salary" class="col-sm-2 control-label">salary</label>
                            <div class="col-sm-6 ">
                                <input type="text" class="form-control" id="salary" placeholder="salary" name="salary" value="${emp.salary}" onkeyup="value=value.replace(/[^\d]/g,'')">
                            </div>

                        </div>
                        <div class="row">
                            <label  class="col-sm-2 control-label">Dept</label>
                            <div class="col-sm-6">
                                <select name="dept_id" class="form-control">
                                    <c:forEach items="${empList}" var="emplist">
                                        <option value="${emplist.dept.dept_id}" <c:if test="${emplist.dept.dept_id == emp.dept_id}">selected</c:if>>${emplist.dept.dname}</option>
                                    </c:forEach>
                                </select>
                                   <%-- <select name="dept_id" class="form-control">
                                        <c:forEach items="${deptList}" var="dept">
                                            <option value="${dept.dept_id}">${dept.dname}</option>
                                        </c:forEach>
                                    </select>--%>
                            </div>

                        </div>


                        <div class="row ">
                            <div class="btncenter ">
                                <button type="button" class="btn btn-success  sub btn-sm" data-toggle="modal" data-target="#changeSource">确定</button>
                                <button type="button" class="btn btn-primary  btn-group btn-sm" onclick="location.href = '${pageContext.request.contextPath}/emp/emplist'">取消</button>
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








