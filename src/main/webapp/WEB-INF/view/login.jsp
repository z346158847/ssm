<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE >
<html >
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>模板</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css" />

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/flat-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/jquery.nouislider.css">

    <style>
        body{
            background:url(${pageContext.request.contextPath}/static/images/cloud.jpg) 0 bottom repeat-x  #049ec4;
        }
    </style>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $("#login").click(function () {

                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/user/login",
                    data:$("#l").serialize(),

                    success:function (result) {


                        if (result.code == 0){
                            alert(result.message);
                        }
                        if (result.code == 1) {
                            location.href = "${pageContext.request.contextPath}/emp/index";
                        }
                        if (result.code == 2) {
                            alert(result.message);
                        }
                    }

                    
                })
            })
        })
    </script>
</head>
<body>
<div class="container">
    <section id="content">
        <form action="${pageContext.request.contextPath}/user/login" method="post" id="l">
            <h1>会员登录</h1>
            <div>
                <input type="text" placeholder="用户名" required="" id="username" name="username"/>
            </div>
            <span id="spanname" style="display: none;color: red;">用户名输入不正确</span>
            <div>
                <input type="password" placeholder="密码" required="" id="password" name="password"/>
            </div>
            <span id="spanword" style="display: none;color: red">密码输入不正确</span>
            <div class="">
                <span class="help-block u-errormessage" id="js-server-helpinfo">&nbsp;</span>
            </div>
            <div class="loginbtn">
                <!-- <input type="submit" value="Log in" /> -->
                <input type="button" value="登录" class="btn btn-primary" id="login"/>
                <input type="button" value="注册" class="btn btn-primary" id="login1" onclick="location.href = '${pageContext.request.contextPath}/user/registView'"/>
                <!-- <a href="#">Register</a> -->
            </div>
        </form><!-- form -->
    </section><!-- content -->
</div>
<!-- container -->


<br><br><br><br>

</body>
</html>
