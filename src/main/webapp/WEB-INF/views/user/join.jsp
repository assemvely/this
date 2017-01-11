<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="Stylesheet" href="/resources/css/bootstrap.min.css" />
<script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script src="js/bootsrap.min.js"></script>
<script src="https://use.typekit.net/ayg4pcz.js"></script>
<title>Sign Up Page</title>
</head>
<body>
   <style>
@import url(https://fonts.googleapis.com/css?family=Roboto:300);

.join-page {
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
   color: #b3b3b3;
   font-size: 12px;
}

.form .message a {
   color: #d9534f;
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
   margin: 0 0 0px;
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
   background-color: #d9534f;/* rgba(255, 202, 212, 0.5); */
   /* background: rgba(255, 202, 212, 0.5); /*  #d9534f; */ */
   /* fallback for old browsers */
/*    background: -webkit-linear-gradient(right, rgba(255, 202, 212, 0.5),
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

   <!-- sh 추가 -->
   <script type="text/javascript">
      function Rradio_OnOff(id) {

         if (id == "Radio_On") {
            document.all["Radio_On"].style.display = 'none'; // 보이게s
            document.all["Radio_Off"].style.display = ''; // 안보이게
         } else {
            document.all["Radio_On"].style.display = ''; // 안보이게
            document.all["Radio_Off"].style.display = 'none'; // 보이게
         }
      }
   </script>

   <div class="join-page">
   <div style="text-align:center; margin-bottom:10px;">
   <a href="/all/main"><img src="/resources/image/assemvely2.png" alt="no image"></a>
   </div>
      <div class="form">
        <!--  <form class="register-form">
            <input type="text" placeholder="name" /> <input type="password"
               placeholder="password" /> <input type="text"
               placeholder="email address" />
            <button>create</button>
            <p class="message">
               Already registered? <a href="#">Sign In</a>
            </p>
         </form> -->


         <form id="form" name="form" class="join-form" method="post" action="/user/join"
            enctype="multipart/form-data">
            <input type="text" name="id" id="id" placeholder="Input your id"
               required autofocus /> 
               
               <input type="password" name="pw"
               id="password" placeholder="Input your pw" required autofocus /> 
               
               <input
               type="text" name="email" placeholder="Email Address" required
               autofocus /> <br /> 
               
               <div class="containerabc">
              
               <label class="radio-inline" for='b'>소비자
               <input type='radio' id='bsm' name="bsm" value='b' onclick="Rradio_OnOff('Radio_On');" checked>
               </label>
               
               
               <label class="radio-inline" for='b'>판매자
               <input type="radio" style="text-align: right;" id='bsm' name='bsm' value='s' onclick="Rradio_OnOff('Radio_Off');" >
               </label>
               
               <br/>
           
               </div>
               <br>
                  <hr>            
               </br>
               <label><h5>프로필 이미지 등록<h5></label>
            <input type="file" name="imgfile1"><br>

            <div id="Radio_On" style="display: none;">
            <hr>
               <label><h5>사업자 서류 등록</h5></label> <input
                  type="file" name="imgfile2"><br>

            </div>

            <input type=hidden name="address" value="">
            <button type="submit">Sign In</button>
            
         </form>
      </div>
   </div>
</body>
</html>