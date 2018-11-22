<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/echarts.min.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css" />

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/flat-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/jquery.nouislider.css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>

    <title>员工管理系统</title>

</head>
<body>
<div id="wrap">
    <!-- 左侧菜单栏目块 -->
    <div class="leftMeun" id="leftMeun">
        <div id="logoDiv">
            <a href="index.jsp">
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
        <div class="meun-item" onclick="location.href ='${pageContext.request.contextPath}/emp/emplist'" aria-controls="sour" role="tab" data-toggle="tab"><img src="${pageContext.request.contextPath}/static/images/icon_source.png">员工信息</div>
        <div class="meun-item" onclick="location.href ='${pageContext.request.contextPath}/dept/deptlist'" aria-controls="char" role="tab" data-toggle="tab"><img src="${pageContext.request.contextPath}/static/images/icon_chara_grey.png">部门信息</div>
        <div class="meun-item" onclick="location.href ='${pageContext.request.contextPath}/dept/countempdeptView'" aria-controls="user" role="tab" data-toggle="tab"><img src="${pageContext.request.contextPath}/static/images/icon_user_grey.png">部门人数</div>
        <div class="meun-item meun-item-active" onclick="location.href ='${pageContext.request.contextPath}/emp/countsexView'" aria-controls="chan" role="tab" data-toggle="tab"><img src="${pageContext.request.contextPath}/static/images/icon_change_grey.png">男女比例</div>

    </div>
    <div id="rightContent">
        <a class="toggle-btn" id="nimei">
            <i class="glyphicon glyphicon-align-justify"></i>
        </a>
        <!-- Tab panes -->
        <div class="tab-content">
            <!-- 资源管理模块 -->
            <div role="tabpanel" class="tab-pane active" id="sour">


                <div class="row tableHeader">
                    <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 "></div>
                    <div class="col-lg-4 col-md-1 col-sm-1 col-xs-1 ">欢迎使用***员工管理系统</div>


                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
                    <div class="col-lg-2 col-md-1 col-sm-2 col-xs-2"></div>

                </div>
                <div id="main" style="width: 600px;height:400px;"></div>

            </div>
        </div>
    </div>
</div>









<script>
    // 绘制图表。


    // 绘制图表。

    var myChart = echarts.init(document.getElementById('main'));
    var option = {
        title : {
            text: '男女比例',
            subtext: '纯属虚构',
            x:'center'
        },
        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            left: 'left',
            data: [

            ]
        },
        series : [
            {
                name: '人数',
                type: 'pie',
                radius : '55%',
                center: ['50%', '60%'],
                data:[

                ],
                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };



   /* $.ajax({
        type:"get",
        url:"countsex",
        async:false,
        success:function (data) {

            option.series[0].data = data ;
            var legendData = new Array();
            for (var i = 0; i < data.length; i++) {
                legendData.push(data[i].name)
            }
            option.legend.data = legendData;
        }
    });*/
    $.ajax({
        type:"get",
        url:"countsex",
        async:false,
        success:function (data) {


            option.series[0].data = data ;
            var legendData =  Array();
            for (var i = 0; i < data.length; i++) {
                legendData.push(data[i].name)
            }
            option.legend.data = legendData;
        }
    });

    myChart.setOption(option);

</script>
</body>
</html>


