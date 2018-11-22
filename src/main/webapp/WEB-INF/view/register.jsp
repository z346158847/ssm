<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/9/6
  Time: 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE >
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>模板</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css"/>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/flat-ui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/jquery.nouislider.css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
    <style>
        body {
            background: url(${pageContext.request.contextPath}/static/images/cloud.jpg) 0 bottom repeat-x #049ec4;
        }
    </style>
    <script>

        $(function () {
            var isName = false;
            var isPassword = false;
            var isFresh = true;
            var isCode = false;


            $("#username").blur(function () {

                var username = $(this).val();
                var reg = /^[a-z]{4,6}$/;
                if (reg.test(username)) {
                    //校验是否存在
                    $.ajax({
                        type: "get",
                        url: "checkusername",
                        data: "username=" + username,
                        success: function (data) {
                            if (data.code == 1) {
                                alert(data.message);
                                isName = true;
                            } else if (data.code == 0) {
                                alert(data.message);
                                isName = false;
                            }
                        }, error: function () {
                            alert("服务器很忙");
                            isName = false;
                        }
                    })
                } else {
                    alert("请输入小写4~6位英文字母");
                    isName = false;
                }
            });
            $("#password1").blur(function () {

                var password = $("#password").val();
                var password1 = $("#password1").val();
                if (password === password1) {
                    isPassword = true;
                } else {
                    alert("两次密码不一致");
                    isPassword = false;
                }

            });

            var time = 6;
            $("#freshcode").click(function () {

                if (isFresh) {
                    $(this).attr("src", "createcode?id=" + Math.random());
                    isFresh = false;
                    var interval = setInterval(function () {
                        $("#hiddencodetime").css("display","inline-block");
                        $("#codetime").html(--time);
                        if (time == 0) {
                            clearInterval(interval);
                            isFresh = true;
                            time = 6;
                            /*$("#codetime").html("");*/
                            $("#hiddencodetime").css("display","none");
                        }
                    }, 1000)
                }
            });
            $("#code").blur(function () {

                var code = $(this).val();
                /*alert(code)*/
                //通过ajax去后台获取
                $.ajax({
                    type: "get",
                    url: "getcode",
                    success: function (data) {
                        if (data == code) {
                            alert("验证码正确");
                            isCode = true;
                        } else {
                            alert("请重新输入");
                            isCode = false;
                        }
                    }
                });
            });




            /*$("#headimg").change(function () {

                    var fileName = $("#headimg").val();
                    var fileType = fileName.substring(fileName.lastIndexOf("."));
                    /!*alert(fileType);
                    alert(fileName);*!/
                    $("#preview").css("display"," inline-block");
                    if (fileType == ".png" || fileType == ".jpg") {
                        //图片预览
                        //this指向当前触发此函数的那个dom

                        var file = document.getElementById("headimg").files[0];

                        var reader = new FileReader();
                        reader.readAsDataURL(file);
                        reader.onload = function () {
                            /!*alert(reader.result);*!/
                            document.getElementById("preview").src = reader.result;
                        }
                        isFile = true ;
                    } else {
                        isFile = false;
                        alert("只支持png,jpg格式")
                    }
                }
            );*/

            $(".regist").click(function () {

                if (isPassword && isName && isCode ) {
                    $("#r").submit();
                }
            });


        });

        //处理图片
        /*function checkFileType() {

            var fileName = $("#headimg").val();
            var fileType = fileName.substring(fileName.lastIndexOf("."));
            /!*alert(fileType);
            alert(fileName);*!/
            $("#preview").css("display"," inline-block");
            if (fileType == ".png" || fileType == ".jpg") {
                //图片预览
                //this指向当前触发此函数的那个dom

                var file = document.getElementById("headimg").files[0];

                var reader = new FileReader();
                reader.readAsDataURL(file);
                reader.onload = function () {
                    /!*alert(reader.result);*!/
                    document.getElementById("preview").src = reader.result;
                }
            } else {
                alert("只支持png,jpg格式")
            }
        }
*/

    </script>
</head>
<body>
<div class="container">
    <section id="content">
        <form action="${pageContext.request.contextPath}/user/regist" method="post" id="r"
              >
            <h1>会员注册</h1>
            <div class="username">
                <input type="text" placeholder="用户名" required="" id="username" name="username"/>
            </div>
            <div class="password">
                <input type="password" placeholder="输入密码" required="" id="password" name="password"/>
            </div>
            <div class="password">
                <input type="password" placeholder="再次输入密码" required="" id="password1" name="password1"/>
            </div>
            <div class="username">
                <input type="text" required="" id="code" name="code"/><br>
                <img src="${pageContext.request.contextPath}/user/createcode" alt="" class="register-button1"
                     id="freshcode">
                <div id="hiddencodetime" style="display: none;">请在<span id="codetime"></span>秒后再次刷新</div>
            </div>

          <%--  <div class=username">
                <input type="file" required="" id="headimg" name="headimg" />
                <img src="" class="img-circle" width="100px" height="100px" id="preview" style="display: none">
            </div>--%>


            <div class="register1">
                <!-- <input type="submit" value="Log in" /> -->
                <input type="button" value="注册" class="btn btn-primary regist " id="js-btn-login"/>
                <!-- <a href="#">Register</a> -->
            </div>


        </form><!-- form -->

    </section><!-- content -->
</div>
<!-- container -->


<br><br><br><br>

</body>
</html>
