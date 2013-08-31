<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<link rel="stylesheet" href="/css/buttons.css"/>
<link rel="stylesheet" href="/css/general.css"/>
<link rel="stylesheet" type="text/css" href="/css/login.css"/>
<title>Login</title>
</head>
<body class="login-page" style="cursor: default;background:#EEE">

<div id="content">

  <div class="logo">
		<h1><a title="Comprar eBook Hoy" href="www.comprarebookhoy.com"><span class="red">Comprar eBook Hoy</span></a></h1>
		<input type="image" src="/img/logo.png" width="95px" height="40px" class="button-sel" alt="www.comprarebookhoy.com" title="www.comprarebookhoy.com"/>
  </div>            

<div class="subheader" style="margin-left:20px">
    <h2>Log In</h2> para editar en Comprar eBook Hoy
</div>
<div id="mainbar">

        <div class="page-description">
                        
        <div class="form-error">
            
        </div>           

        <form id="sendToLog" name="sendToLog" method="post">            

            <!-- Simple OpenID Selector -->
            <div id="openid_choice" style="">
	            <p style="margin-right: 250px;">Tu cuenta no será publicada ni utilizada para ningún otro propósito que no sea parte de Comprar eBook Hoy. Recuerda que debes estar dado de alta en el sistema. Por favor, clicka en logo para <b>logarte</b> con una de tus cuentas de abajo:
                </p>
	            <div id="openid_btns" class=".login-page .openid_large_btn">
	            <span title="log in with Google" onclick="javascript:sendToLogin('https://www.google.com/accounts/o8/id');" style="background: #fff url(http://cdn.sstatic.net/Img/openid/openid-logos.png?v=8); background-position: -1px -1px;cursor:pointer;" class="google openid_large_btn"></span>
	            <span title="log in with Yahoo" onclick="javascript:sendToLogin('https://me.yahoo.com/user');" style="background: #fff url(http://cdn.sstatic.net/Img/openid/openid-logos.png?v=8); background-position: -1px -63px;cursor:pointer;" class="yahoo openid_large_btn"></span>
	            <span title="log in with Facebook" onclick="javascript:showMessage();sendToLogin('https://me.yahoo.com/user');" style="background: #fff url(http://cdn.sstatic.net/Img/openid/openid-logos.png?v=8); background-position: -1px -456px;cursor:pointer;" class="facebook openid_large_btn"></span><br></br>
	            <input id="openid_identifier" name="openid_identifier" type="hidden" size=80/>
            </div>
        </form>

    </div>        
</div> 
</div>

   
     
 <script type="text/javascript">
	
	function sendToLogin(url) {
		if (url != null) {
			document.getElementById("openid_identifier").value = url;
			document.forms['sendToLog'].submit()
        }
	}
	
	function showMessage(){
		alert("Please use the Facebook button at the next screen. Click Accept to proceed.");
	}
	
</script>   

</body>

</html>

