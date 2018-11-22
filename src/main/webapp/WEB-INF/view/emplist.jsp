<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ch">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">


    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/jquery.nouislider.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/flat-ui.min.css" />

    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
    <title>员工管理系统</title>
    <script>
        $(function() {
            $(".deleteone").click(function () {
                var emp_id = $(this).attr("emp_id");
                location.href = "${pageContext.request.contextPath}/emp/deleteEmpById?id=" + emp_id;
            });
            $(".selectAll").click(function () {
                $(".item").prop("checked", $(".selectAll").prop("checked"));
            });
            $(".deleteAll").click(function () {
                //提交请求到后台,将Id传入
                var ids = new Array();
                $(".item").each(function (index, value) {
                    if (value.checked) {
                        var id = value.getAttribute("empid");
                        ids.push(id);
                    }
                });
                if (ids[0] == null){
                    alert("请至少选择一项");
                    location.href = "${pageContext.request.contextPath}/emp/emplist" ;
                } else {
                    location.href = "${pageContext.request.contextPath}/emp/deleteEmpAll?ids=" + ids;
                }
            });
            $("#search-btn").click(function () {
                var search = $("#search-input").val();
                location.href = "${pageContext.request.contextPath}/emp/getEmpByName?name=" + search;
            })

        })
    </script>


    <%--<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">--%>

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
                    <input class="form-control" type="text" id="search-input" placeholder="员工名">
                    <button type="button" id="search-btn" class="btn btn-default">搜索</button>
                    <%--<form action="${pageContext.request.contextPath}/emp/getEmpByParam" method="get">
                        <input type="text" name="name" >
                        <input type="text" name="phone" >
                        <input type="text" name="sex" >
                        <input type="text" name="salary" >
                        <button type="submit">精确查找</button>
                    </form>--%>
<%--
                    <input type="text" id="search-input" placeholder="员工名" ><button type="button" id="search-btn" class="btn btn-yellow btn-xs">搜索</button>
--%>
                </div>
                    <div class="row tableHeader">
                        <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 "><input type="checkbox" class="selectAll"></div>
                        <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 ">#</div>
                        <div class="col-lg-1 col-md-1 col-sm-4 col-xs-4">姓名</div>
                        <div class="col-lg-2 col-md-2 col-sm-5 col-xs-5">手机</div>
                        <div class="col-lg-1 col-md-1 col-sm-2 col-xs-2">性别</div>
                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">工资</div>
                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">部门</div>
                        <div class="col-lg-2 col-md-1 col-sm-2 col-xs-2">操作</div>
                    </div>
                    <div class="row tablebody">
                        <c:forEach items="${empList}" var="emp" varStatus="i">
                        <div class="row">
                            <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1"><input type="checkbox" class="item" empid="${emp.emp_id}"></div>
                            <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">${i.index+1}</div>
                            <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">${emp.name}</div>
                            <div class="col-lg-2 col-md-2 col-sm-1 col-xs-1">${emp.phone}</div>
                            <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">${emp.sex}</div>
                            <div class="col-lg-2 col-md-2 col-sm-1 col-xs-1">${emp.salary}</div>
                            <div class="col-lg-2 col-md-1 col-sm-1 col-xs-1">${emp.dept.dname}</div>
                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                <button type="button" class="btn btn-success btn-xs"   onclick="location.href = '${pageContext.request.contextPath}/emp/updateEmpView?id=${emp.emp_id}'">修改</button>
                                <button type="button" class="btn btn-danger btn-xs deleteone"   emp_id="${emp.emp_id}">删除</button>
                            </div>
                        </div>
                        </c:forEach>
                        <div class="row">
                            <button type="button" class="btn btn-danger btn-xs deleteAll"  >删除所选</button>
                        </div>
                    </div>

            </div>
        </div>
        <nav aria-label="Page navigation ">
            <ul class="pagination label label-info">
                <c:if test="${pageInfo.isFirstPage}">
                <li class="disabled">
                    <a href="javascript:" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                </c:if>
                <c:if test="${!pageInfo.isFirstPage}">
                    <li >
                        <a href="${pageContext.request.contextPath}/emp/emplist?pageNum=${pageInfo.prePage}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>
                <c:forEach items="${pageInfo.navigatepageNums}" var="num">
                        <li <c:if test="${num == pageInfo.pageNum }">class="active"</c:if>><a href="${pageContext.request.contextPath}/emp/emplist?pageNum=${num}">${num}</a></li>
                </c:forEach>
                <c:if test="${pageInfo.isLastPage}">
                <li class="disabled">
                    <a href="javascript:" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
                </c:if>
                <c:if test="${!pageInfo.isLastPage}">
                    <li >
                        <a href="${pageContext.request.contextPath}/emp/emplist?pageNum=${pageInfo.nextPage}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
            </ul>
        </nav>
    </div>
</div>
</body>

</html>








