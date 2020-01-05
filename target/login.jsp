<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
      pageContext.setAttribute("base_path", request.getContextPath());
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="${base_path}/static/js/jquery-3.4.1.min.js"></script>
<link href="${base_path}/static/css/bootstrap.min.css"  rel="stylesheet"> 
<script src="${base_path}/static/js/bootstrap.min.js"></script>
<title>denglu</title>
</head>
<body>

<div class="container">
<div class="row">
			<div class="col-md-12 col-md-offset-4">
				<h1>SSM-CRUD</h1>
			</div>
		</div>
<form class="col-md-6 col-md-offset-3">
  <div class="form-group col-md-offset-2">
    <label for="exampleInputName">user name</label>
    <input type="text" class="form-control" id="exampleInputName" placeholder="Name">
  </div>
  <div class="form-group col-md-offset-2">
    <label for="exampleInputPassword">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword" placeholder="Password">
  </div>
  

 
  <button type="submit" class="btn btn-default col-md-offset-3 col-md-4" id="login_btn">登录</button><br><br>
  <button type="submit" class="btn btn-default col-md-offset-3 col-md-4">忘记密码</button>
  
</form>
</div>
</body>
<script type="text/javascript">
$("#login_btn").click(function() {
	var ename=$("#exampleInputName").val();
	var password=$("#exampleInputPassword").val();
	var regName=/(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
	
	if(!regName.test(ename)){
		alert("请输入正确的用户名");
	}
	
	
})


</script>
</html>