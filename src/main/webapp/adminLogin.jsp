<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #a8e063, #56ab2f);
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            padding: 0 15px;
        }

        .login-container {
            background-color: #ffffff;
            padding: 40px 30px;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
        }

        .login-container h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #2e7d32;
            font-size: 1.8rem;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
            color: #388e3c;
            font-size: 0.95rem;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #c8e6c9;
            border-radius: 8px;
            background-color: #f9fff9;
            font-size: 1rem;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #4caf50;
            border: none;
            color: white;
            font-weight: bold;
            border-radius: 8px;
            cursor: pointer;
            font-size: 1rem;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #388e3c;
        }

        /* Responsive tweaks */
        @media (max-width: 480px) {
            .login-container {
                padding: 30px 20px;
            }

            .login-container h2 {
                font-size: 1.5rem;
            }

            input[type="submit"] {
                font-size: 0.95rem;
            }

            label {
                font-size: 0.9rem;
            }

            input[type="text"],
            input[type="password"] {
                font-size: 0.95rem;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Admin Login</h2>
        <form method="post" action="j_security_check">
            <div class="form-group">
                <label for="j_username">Username</label>
                <input type="text" id="j_username" name="j_username" required>
            </div>
            <div class="form-group">
                <label for="j_password">Password</label>
                <input type="password" id="j_password" name="j_password" required>
            </div>
            <input type="submit" value="Login">
        </form>
    </div>
</body>
</html>
