<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Sign Up Form</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: url('/resources/assets/images/login.jpg') no-repeat center center fixed;
      background-size: cover;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }

    .login-box {
      background: rgba(255, 255, 255, 0.25); /* semi-transparent */
      padding: 40px 30px;
      border-radius: 20px;
      box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
      width: 360px;
      backdrop-filter: blur(10px); /* blur effect */
      -webkit-backdrop-filter: blur(10px); /* Safari support */
      transition: all 0.3s ease-in-out;
    }

    .login-box:hover {
      box-shadow: 0 12px 35px rgba(0, 0, 0, 0.3);
    }

    h2 {
      text-align: center;
      margin-bottom: 25px;
      color: #222;
      font-weight: bold;
    }

    .login-box input,
    .login-box select {
      width: 100%;
      padding: 12px 10px;
      margin: 8px 0;
      border: 1px solid #bbb;
      border-radius: 8px;
      font-size: 14px;
      box-sizing: border-box;
      background-color: rgba(255,255,255,0.8); /* input slightly opaque */
    }

    .login-box input:focus,
    .login-box select:focus {
      outline: none;
      border-color: #007BFF;
      box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
    }

    .login-box button {
      width: 100%;
      padding: 14px;
      margin-top: 12px;
      background-color: #007BFF;
      border: none;
      color: #fff;
      font-size: 16px;
      font-weight: bold;
      border-radius: 8px;
      cursor: pointer;
      transition: background 0.3s ease;
    }

    .login-box button:hover {
      background-color: #0056b3;
    }

    .login-box .login-btn {
      background-color: #28a745;
      margin-top: 10px;
    }

    .login-box .login-btn:hover {
      background-color: #1e7e34;
    }

    .error-msg {
      color: red;
      font-size: 12px;
      margin-top: -5px;
      margin-bottom: 10px;
      display: none;
    }

    .login-box a {
      text-decoration: none;
      color: #fff;
      display: block;
      text-align: center;
      margin-top: 10px;
    }

    .login-box a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
  <div class="login-box">
    <h2>Sign Up</h2>
    <form name="signup" action="Sign_up" method="post" onsubmit="return validateForm()">
      <input type="text" name="username" placeholder="User Name" required>
      <div id="username-error" class="error-msg"></div>

      <input type="text" name="contact_number" placeholder="Contact Number" maxlength="10" required>
      <div id="contact_number-error" class="error-msg"></div>

      <input type="email" name="email" placeholder="Email" required>
      <div id="email-error" class="error-msg"></div>

      <input type="password" name="password" placeholder="Password" required>
      <div id="password-error" class="error-msg"></div>

      <select name="role" required>
        <option value="">-- Select Role --</option>
        <option value="Admin">Admin</option>
        <option value="Student">Student</option>
      </select>
      <div id="role-error" class="error-msg"></div>

      <button type="submit">Sign Up</button>
    </form>

    <form action="Login.jsp" method="get">
      <button type="submit" class="login-btn">Go to Login</button>
    </form>
  </div>
</body>
</html>
