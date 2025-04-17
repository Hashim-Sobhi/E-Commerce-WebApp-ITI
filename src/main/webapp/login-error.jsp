<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login Failed</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #ffebee;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .error-box {
            background-color: #ffffff;
            padding: 30px;
            border: 2px solid #e53935;
            border-radius: 10px;
            text-align: center;
        }

        .error-box h3 {
            color: #e53935;
            margin-bottom: 15px;
        }

        .error-box a {
            color: #4caf50;
            text-decoration: none;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="error-box">
        <h3>Login Failed</h3>
        <p>Invalid username or password.</p>
        <a href="adminLogin.jsp">Try Again</a>
    </div>
</body>
</html>
