<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Login Page</title>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />

  <style>
    html, body {
      height: 100%;
      margin: 0;
      font-family: Arial, sans-serif;
    }

    body {
      margin: 0;
      padding: 0;
      background-image: url('/resources/assets/images/login.jpg'); /* Adjust the path */
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
    }

    .overlay-dark {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(255, 255, 255, 0.1); /* lighter overlay */
      z-index: 1;
    }

    .form-container {
      position: relative;
      z-index: 2;
      max-width: 420px;
      background-color: rgba(255, 255, 255, 0.75); /* brighter background */
      padding: 45px 35px;
      margin: auto;
      margin-top: 5%;
      border-radius: 20px;
      box-shadow: 0 0 30px rgba(0, 0, 0, 0.2);
      backdrop-filter: blur(8px);
    }

    .form-label {
      font-weight: 600;
    }

    .form-outline input,
    .form-outline select {
      border-radius: 10px;
      border: 1px solid #ced4da;
      padding: 10px 15px;
    }

    .btn-custom {
      padding: 10px 30px;
      border-radius: 50px;
      font-weight: bold;
      font-size: 16px;
    }

    .text-danger {
      font-size: 14px;
      margin-top: 5px;
    }

    a {
      text-decoration: none;
    }
  </style>
</head>
<body>
<!-- onsubmit="validateForm(event)" -->
  <div class="overlay-dark"></div>

  <div class="form-container">
    <form id="login-form"  action="login" method="get">
      <div class="text-center mb-3">
        <h3 class="fw-bold">Login</h3>
      </div>

      <div class="text-danger text-center mb-3">
        <b style="color:red">${error}</b>
      </div>

      <div class="form-outline mb-3">
        <label class="form-label" for="email">Email</label>
        <input type="email" id="email" name="email" class="form-control form-control-lg" required />
      </div>

      <div class="form-outline mb-3">
        <label class="form-label" for="password">Password</label>
        <input type="password" id="password" name="password" class="form-control form-control-lg" required />
      </div>

      

      <div class="text-center">
        <button type="submit" class="btn btn-primary btn-custom">Login</button>
        <a href="sign_up" class="btn btn-outline-primary btn-custom ms-2">Sign Up</a>
      </div>
    </form>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

  <!-- <script>
    function validateForm(event) {
      const email = document.getElementById('email').value.trim();
      const password = document.getElementById('password').value.trim();
      const role = document.getElementById('role').value;

      if (!email || !password || !role) {
        alert("Please fill in all fields.");
        event.preventDefault();
      }
    }
  </script> -->

</body>
</html>
