<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% 
   pageContext.setAttribute("basepath", request.getContextPath());
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="${base_path}/static/js/jquery-3.4.1.min.js"></script>
<link href="${base_path}/static/css/bootstrap.min.css" rel="stylesheet">
<script src="${base_path}/static/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>

<form class="form-horizontal" id="stu_add">
<div class="form-group">
  
    <label for="text" class="col-sm-2 control-label">学生学号</label>
    <div class="col-sm-10">
      <input type="text" name="id" class="form-control" id="inputid">
    </div>
  </div>
  <div class="form-group">
  
    <label for="text" class="col-sm-2 control-label">学生姓名</label>
    <div class="col-sm-10">
      <input type="text" name="name" class="form-control" id="inputname" placeholder="Email">
    </div>
  </div>
  <div class="form-group">
  
    <label for="text" class="col-sm-2 control-label">学生年龄</label>
    <div class="col-sm-10">
      <input type="text" name="age" class="form-control" id="inputage" placeholder="Email">
    </div>
  </div>
  <div class="form-group">
    <label for="text" class="col-sm-2 control-label">学生地址</label>
    <div class="col-sm-10">
      <input type="text" name="address" class="form-control" id="inputaddress" placeholder="Password">
    </div>
  </div>
  <div class="form-group">
    <label for="text" class="col-sm-2 control-label">学生信息</label>
    <div class="col-sm-10">
      <input type="text" name="information" class="form-control" id="inputinformation" placeholder="Password">
    </div>
  </div>
  <div class="form-group">
    <label for="text" class="col-sm-2 control-label">学生备注</label>
    <div class="col-sm-10">
      <input type="text" name="bak" class="form-control" id="inputbak" placeholder="Password">
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <div class="checkbox">
        <label>
          <input type="checkbox"> Remember me
        </label>
      </div>
    </div>
  </div>
  <input type="text" name="id" class="form-control" id="inputId" hidden="">
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button class="btn btn-default" id="save_stu" onclick="add()">Sign in</button>
      <button class="btn btn-default" id="select_stu" onclick="select()">chazhao</button>
    </div>
  </div>
</form>

<script type="text/javascript">
function select(){
	$.ajax({
		type:"POST",
		url: "${base_path}/selectstu",
		data:$('#stu_add').serialize(),
		success: function (result) {
			
           var stuDate=result.extend.stu;
           alert(stuDate.name);
           
           $("#inputname").text(stuDate.name);           
           $("#inputage").val(stuDate.age);
           $("#inputaddress").val(stuDate.address);
           $("#inputinformation").val(stuDate.information);
           $("#inputbak").val(stuDate.bak);
        },
        error : function() {
            alert("异常！");
        }
    });
}
function add() {
    $.ajax({
    //几个参数需要注意一下
        type: "POST",//方法类型
        dataType: "json",//预期服务器返回的数据类型
        url: "${base_path}/student" ,//url
        data: $('#stu_add').serialize(),
        success: function (result) {
            console.log(result);//打印服务端返回的数据(调试用)
            if (result.resultCode == 200) {
                alert("SUCCESS");
            }
            ;
        },
        error : function() {
            alert("异常！");
        }
    });
}

/* $("#save_stu").click(function() {
	$ajax({
		url:"${base_path}/student",
		type:"POST",
		data:$("#stu_add").serialize(),
		
		error: function(request) {  //失败的话
             alert("Connection error");  
        },
		success:function(result){
			
			alert(result.message);
		}
	});
}); */

</script>
</body>
</html>