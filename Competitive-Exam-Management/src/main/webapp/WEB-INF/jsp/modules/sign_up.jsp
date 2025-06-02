<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Login Form</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: url('/resources/assets/images/login-images/sign_up.jpg') no-repeat center center fixed;
      background-size: cover;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }

    .login-box {
      background: rgba(255, 255, 255, 0.7); /* Transparent background */
      padding: 40px;
      border-radius: 15px;
      box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
      width: 350px;
      backdrop-filter: blur(5px); /* Optional glass effect */
    }

    h1 {
      font-size: 36px;
      text-align: center;
      color: #333;
      text-shadow: 2px 2px 5px rgba(0,0,0,0.4);
      margin-bottom: 20px;
    }

    .login-box h2 {
      margin-bottom: 25px;
      text-align: center;
      color: #333;
    }

    .login-box input,
    .login-box select {
      width: 100%;
      padding: 12px;
      margin: 10px 0;
      border: 1px solid #ccc;
      border-radius: 6px;
      background: rgba(255, 255, 255, 0.9);
    }

    .login-box button {
      width: 100%;
      padding: 12px;
      background: #007BFF;
      border: none;
      color: white;
      border-radius: 6px;
      cursor: pointer;
      font-size: 16px;
    }

    .login-box button:hover {
      background: #0056b3;
    }
  </style>
</head>
<body>

  <div class="login-box">
    <!--  <h1>Competitive Exam Management</h1>-->
    <h2>Sign In</h2>
    <form name="signup" action="Sign_up" method="post">
      <input type="email" name="email" placeholder="Email" required>
      <input type="password" name="password" placeholder="Password" required>
      <select name="role" required>
        <option value="">-- Select Role --</option>
        <option value="Teacher">Teacher</option>
        <option value="Student">Student</option>
      </select>
      <button type="submit">Sign In</button>
    </form>
  </div>

</body>
</html>
