<%@page contentType="text/html" pageEncoding="UTF-8"%>


    <!DOCTYPE html>
    <html>

    <head>
        <style>
            <%@include file="CSS/Welcome.css"%>
        </style>


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Insert title here</title>
    </head>

    <body>
        <div id="login">
            <form action="dologin" method="post" id="login-form">
                <label for="" >Mã công ty</label>
                <input type="text" id="companyCode" name="companyCode" required>
            <br>
            <br>
                <label>Tài khoản</label>
                <input type="text" name="username" required>
            <br>
            <br>
                <label>Mật khẩu</label>
                <input type="password" name="password" required>
            <br>
            <br>
            <button type="submit" class="submit-btn">Đăng Nhập</button>
            </form>
            <form action="register" method="post" id="login-form">
                <button type="submit" class="submit-btn">Đăng kí doanh nghiệp</button>
            </form>
        </div>
    </body>

    </html>