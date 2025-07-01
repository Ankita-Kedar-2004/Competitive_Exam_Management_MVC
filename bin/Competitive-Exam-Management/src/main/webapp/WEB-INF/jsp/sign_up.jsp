<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Sign Up Form</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: url('/resources/assets/images/login-images/sign_up.jpg') no-repeat center center fixed;
      background-size: cover;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }

    .login-box {
      background: rgba(255, 255, 255, 0.85);
      padding: 40px 30px;
      border-radius: 20px;
      box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
      width: 360px;
      backdrop-filter: blur(6px);
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
      padding: 14px 12px;
      margin: 12px 0;
      border: 1px solid #bbb;
      border-radius: 8px;
      font-size: 14px;
      background-color: #fff;
      box-sizing: border-box;
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
      margin-top: 20px;
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
  </style>
</head>

<body>
  <div class="login-box">
    <h2>Sign Up</h2>
    <form name="signup" action="Sign_up" method="post">
      <input type="text" name="username" placeholder="User Name" required>
      <input type="number" name="contact_number" placeholder="Contact Number" required>
      <input type="email" name="email" placeholder="Email" required>
      <input type="password" name="password" placeholder="Password" required>

      <select name="role" required>
        <option value="">-- Select Role --</option>
        <option value="Teacher">Teacher</option>
        <option value="Student">Student</option>
        <option value="Admin">Admin</option>
      </select>

      <button type="submit">Sign Up</button>
    </form>
  </div>
</body>
</html>
