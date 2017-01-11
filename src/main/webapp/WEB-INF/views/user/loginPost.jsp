<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Login Page</title>
</head>
<body>
<style>	
@import url(https://fonts.googleapis.com/css?family=Roboto:300);

.login-page {
	width: 360px;
	padding: 8% 0 0;
	margin: auto;
}

.form {
	position: relative;
	z-index: 1;
	background: #FFFFFF;
	max-width: 360px;
	margin: 0 auto 100px;
	padding: 45px;
	text-align: center;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0
		rgba(0, 0, 0, 0.24);
}

.form input {
	font-family: "Roboto", sans-serif;
	outline: 0;
	background: #f2f2f2;
	width: 100%;
	border: 0;
	margin: 0 0 15px;
	padding: 15px;
	box-sizing: border-box;
	font-size: 14px;
}

.form button {
	font-family: "Roboto", sans-serif;
	text-transform: uppercase;
	outline: 0;
	background: #d9534f;
	width: 100%;
	border: 0;
	padding: 15px;
	color: #FFFFFF;
	font-size: 14px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
	border:1px solid #d9534f;
}

.form button:hover, .form button:active, .form button:focus {
	background: #ffffff; /* #d9534f; */
	color:#d9534f;
	border:1px solid #d9534f;
}

.form .message {
	margin: 15px 0 0;
	color: c;
	font-size: 12px;
}

.form .message a {
	color: #d9534f;/* 이건 이색 맞음 */
	text-decoration: none;
}

.form .register-form {
	display: none;
}

.container {
	position: relative;
	z-index: 1;
	max-width: 300px;
	margin: 0 auto;
}

.container:before, .container:after {
	content: "";
	display: block;
	clear: both;
}

.container .info {
	margin: 50px auto;
	text-align: center;
}

.container .info h1 {
	margin: 0 0 15px;
	padding: 0;
	font-size: 36px;
	font-weight: 300;
	color: #1a1a1a;
}

.container .info span {
	color: #4d4d4d;
	font-size: 12px;
}

.container .info span a {
	color: #000000;
	text-decoration: none;
}

.container .info span .fa {
	color: #EF3B3A;
}

body {
	/* background-color: rgba(255, 202, 212, 0.5); */
	/* background-image: url(../resources/designimg/girlsshopping.jpg); */
	background-color:  #d9534f;
	/* fallback for old browsers */
	/* background: -webkit-linear-gradient(right, rgba(255, 202, 212, 0.5),
		#d9534f);
	background: -moz-linear-gradient(right, rgba(255, 202, 212, 0.5),
		#d9534f);
	background: -o-linear-gradient(right, rgba(255, 202, 212, 0.5), #d9534f);
	background: linear-gradient(to left, rgba(255, 202, 212, 0.5), #d9534f); */
	font-family: "Roboto", sans-serif;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}
</style>
 <script src="https://use.typekit.net/ayg4pcz.js"></script>
    <script>try{Typekit.load({ async: true });}catch(e){}</script>

   <div class="login-page">
   <div style="text-align:center; margin-bottom:10px;">
   <a href="/all/main"><img src="/resources/image/assemvely2.png" alt="no image"></a>
   </div>
		<div class="form">
			<form class="register-form">
				<input type="text" placeholder="name" /> <input type="password"
					placeholder="password" /> <input type="text"
					placeholder="email address" />
				<button>create</button>
				<p class="message">
					Already registered? <a href="#">Sign In</a>
				</p>
			</form>


			<form class="login-form" method="post" action="/user/loginPost">
				<input type="text" name="id" placeholder="Enter your id" required
					autofocus /> <input type="password" id="inputPassword" name="pw"
					placeholder="enter your pw" required autofocus />
				<button type="submit">Login</button>
				<p class="message a">
					Not registered? <a href="/user/joinPage">Create an account</a>
				</p>
			</form>
		</div>
	</div>

</body>
</html>