<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<% 
   pageContext.setAttribute("base_path", request.getContextPath());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Expires" content="0">
      <meta http-equiv="kiben" content="no-cache">
<script type="text/javascript" src="${base_path}/static/js/jquery-3.4.1.min.js"></script>
<link href="${base_path}/static/css/bootstrap.min.css" rel="stylesheet">
<script src="${base_path}/static/js/bootstrap.min.js"></script>

<title>Insert title here</title>
</head>
<body>
 var empDate=result.extend.emp;
               $("#empName_update_static").text(empDate.ename);
               $("#email_update_input").val(empDate.email);
                $("#empUpdateModal input[name=gender]").val([empDate.gender]);
                $("#empUpdateModal select").val([empDate.dId]);
<!-- 员工修改 -->>
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">员工修改</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal">
		  <div class="form-group">
		    <label class="col-sm-2 control-label">empName</label>
		    <div class="col-sm-10">
		    <p class="form-control-static" id="empName_update_static"></p>
		  
		      <span class="help-block"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">email</label>
		    <div class="col-sm-10">
		      <input type="text" name="email" class="form-control" id="email_update_input" placeholder="email@atguigu.com">
		     <span class="help-block"></span>
              
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">gender</label>
		    <div class="col-sm-10">
		      <label class="radio-inline">
				  <input type="radio" name="gender" id="gender1_update_input" value="m" checked="checked"> 男
				</label>
				<label class="radio-inline">
				  <input type="radio" name="gender" id="gender2_update_input" value="f"> 女
				</label>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">deptName</label>
		    <div class="col-sm-4">
		    	<!-- 部门提交部门id即可 -->
		      <select class="form-control" name="dId">
		      </select>
		    </div>
		  </div>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="emp_update_btn">保存</button>
      </div>
    </div>
  </div>
</div>

<!-- 员工添加的模态框 -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">课程添加</h4>
      </div>
      <div class="modal-body">
		  <div class="form-group">
		    <label class="col-sm-2 control-label">deptName</label>
		    <div class="col-sm-4">
		    	<!-- 部门提交部门id即可 -->
		      <select class="form-control" name="dId">
		      </select>
		    </div>
		  </div>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
      </div>
    </div>
  </div>
</div>


<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>SSM-CRUD</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary" id="add_model">新增</button>
				<button class="btn btn-danger" id="del_model">删除</button>
			</div>
		</div>
		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="emps_table">
				<thead>
					<tr>
						<th>
								<input type="checkbox" id="check_all"/>
							</th>
						<th>empId</th>
						<th>empName</th>
						<th>gender</th>
						<th>email</th>
						<th>deptName</th>
						<th>操作</th>
					</tr>
					</thead>
					<tbody>
					
					</tbody>
	   </table>
	   </div>
	   </div>
	   </div>
	   <!-- 显示分页信息 -->
		<div class="row">
			<!--分页文字信息  -->
			<div class="col-md-6 col-md-offset-1" id="page_info_area"></div>
			<!-- 分页条信息 -->
			<div class="col-md-6 col-md-offset-6" id="page_nav_area">
				
			</div>
		</div>
		
	</div>
	   <script type="text/javascript">
	   //首页
	   var totalRecord;
	      $(function(){
	 		 $.ajax({
	 			 url:"${base_path}/emps",
	 			 data:"pn=1",
	 			 type:"GET",
	 			
	 			 success:function(result){
	 				build_emps_table(result);
	 				build_page_nav(result);
	 				build_page_info(result)
	 			 }
	 		 });
	 	});
	      //翻页
	      function to_page(pn) {
	    	  $.ajax({
		 			 url:"${base_path}/emps",
		 			 data:"pn="+pn,
		 			 type:"GET",
		 			 
		 			success:function(result){
		 				build_mains_table(result);
		 				build_page_nav(result);
		 				build_page_info(result)
		 			 }
			});
	      }
	      //向页面添加员工信息及样式
	  	function build_mains_table(result){
	  		$("#emps_table tbody").empty();
			var emps = result.extend.pageInfo.list;
			$.each(emps,function(index,item){
				
				var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
				var empIdTd = $("<td></td>").append(item.eid);
				var empNameTd = $("<td></td>").append(item.ename);
				var genderTd = $("<td></td>").append(item.gender=='m'?"男":"女");
				var emailTd = $("<td></td>").append(item.email);
				var deptNameTd = $("<td></td>").append(item.department.dname);
				var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
				.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
				editBtn.attr("edit-id",item.eid);
				var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
				.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
				delBtn.attr("del-id",item.eid);
				var conBtn=$("<td></td>").append(editBtn).append(" ").append(delBtn);
				
				$("<tr></tr>").append(checkBoxTd)
				.append(empIdTd)
				.append(empNameTd)
				.append(genderTd)
				.append(emailTd)
				.append(deptNameTd)
				.append(conBtn)
				.appendTo("#emps_table tbody");
		});
			$("#check_all").click(function() {
				$(".check_item").prop("checked",$(this).prop("checked"));
			})
			
	  	}
	      $(document).on("click",".check_item",function(){
	    	var flag= $(".check_item:checked").length==$(".check_item").length;
	    	$("#check_all").prop("checked",flag);
	      });
	      
	  	//构建页码
	  	function build_page_info(result){
			$("#page_info_area").empty();
			$("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页,总"+
					result.extend.pageInfo.pages+"页,总"+
					result.extend.pageInfo.total+"条记录");
			totalRecord = result.extend.pageInfo.total;
			currentPage = result.extend.pageInfo.pageNum;
			
		}
	  	
	  	//翻页实现
	  	 function build_page_nav(result){
		//page_nav_area
		$("#page_nav_area").empty();
		var ul = $("<ul></ul>").addClass("pagination");		
		//构建元素
		var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
		var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
		if(result.extend.pageInfo.hasPreviousPage == false){
			firstPageLi.addClass("disabled");
			prePageLi.addClass("disabled");
		}else{
			//为元素添加点击翻页的事件
			firstPageLi.click(function(){
				to_page(1);
			});
			prePageLi.click(function(){
				to_page(result.extend.pageInfo.pageNum -1);
			});
		}	
		var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
		var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
		if(result.extend.pageInfo.hasNextPage == false){
			nextPageLi.addClass("disabled");
			lastPageLi.addClass("disabled");
		}else{
			nextPageLi.click(function(){
				to_page(result.extend.pageInfo.pageNum +1);
			});
			lastPageLi.click(function(){
				to_page(result.extend.pageInfo.pages);
			});
		} 	
	 	//添加首页和前一页 的提示
		ul.append(firstPageLi).append(prePageLi);
		//1,2，3遍历给ul中添加页码提示
		$.each(result.extend.pageInfo.navigatepageNums,function(index,item){
			
			var numLi = $("<li></li>").append($("<a></a>").append(item));
			if(result.extend.pageInfo.pageNum == item){
				numLi.addClass("active");
			}
			numLi.click(function(){
				to_page(item);
			});
			ul.append(numLi);
		});
		//添加下一页和末页 的提示
		ul.append(nextPageLi).append(lastPageLi);
		
		//把ul加入到nav
		var navEle = $("<nav></nav>").append(ul);
		navEle.appendTo("#page_nav_area");
	} 

	//清空表单样式及内容
	function reset_form(ele){
		$(ele)[0].reset();
		//清空表单样式
		$(ele).find("*").removeClass("has-error has-success");
		$(ele).find(".help-block").text("");
	}

	//点击新增按钮弹出模态框。
	
	$("#add_model").click(function name() {
		
		reset_form("#empAddModal form");
		
		getDept("#empAddModal select");
		
		$("#empAddModal").modal({
			backdrop:'static'
		});
	});
	
	//点击编辑模态框
    $(document).on("click",".edit_btn",function () {
        
        getDept("#empUpdateModal select");
        getEmp($(this).attr("edit-id"));
        $("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"));
        $("#empUpdateModal").modal({
			backdrop:'static'
		});
    });
	
    function getEmp(id) {
      $(id).empty();
        $.ajax({
           url:"${base_path}/main/"+id,
           type:"GET",
            success:function(result){
            	
               var empDate=result.extend.emp;
               $("#empName_update_static").text(empDate.ename);
               $("#email_update_input").val(empDate.email);
                $("#empUpdateModal input[name=gender]").val([empDate.gender]);
                $("#empUpdateModal select").val([empDate.dId]);
            }
        });
    }
    
	//获得部门信息
	function getDept(ele) {
		$(ele).empty();
		$.ajax({
			url:"${base_path}/dept",
			type:"GET",
			success:function(result){
				$.each(result.extend.dept,function(){
					var optionEle = $("<option></option>").append(this.dname).attr("value",this.did);
					optionEle.appendTo(ele);
			      });		
			   }
			});
		
     }
	
	
	$("#emp_update_btn").click(function() {
		var email = $("#email_update_input").val();
		var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
		if(!regEmail.test(email)){
			show_validate_msg("#email_update_input", "error", "邮箱格式不正确");
			return false;
		}else{
			show_validate_msg("#email_update_input", "success", "");
		}
		
		//2、发送ajax请求保存更新的员工数据
		$.ajax({
			url:"${base_path}/emp/"+$(this).attr("edit-id"),
			type:"PUT",
			data:$("#empUpdateModal form").serialize(),
			success:function(result){
				//alert(result.msg);
				//1、关闭对话框
				$("#empUpdateModal").modal("hide");
				//2、回到本页面
				to_page(currentPage);
			}
		});
	});
	//后端校验
	function addcheck() {
		
		var eName=$("#empName_add_input").val();
		
		var regName=/(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
		
		var email=$("#email_add_input").val();
		
		var regmail=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
		if(!regName.test(eName)){
			show_validate_msg("#empName_add_input", "error", "用户名可以是2-5位中文或者6-16位英文和数字的组合");
			return false;}
		
		else {
			show_validate_msg("#empName_add_input", "success", "");
			
			};
		
		if(!regmail.test(email)){
			show_validate_msg("#email_add_input", "error", "邮箱格式不正确");
			return false;}
		
		else {
			show_validate_msg("#email_add_input", "success", "");
			
			}
		
		return true;
		

	
	}
	
	function show_validate_msg(ele,status,msg){
		//清除当前元素的校验状态
		$(ele).parent().removeClass("has-success has-error");
		$(ele).next("span").text("");
		
		if("success"==status){
			$(ele).parent().addClass("has-success");
			$(ele).next("span").text(msg);
			
		
		}else if("error" == status){
			$(ele).parent().addClass("has-error");
			$(ele).next("span").text(msg);
			
		}
	}
	//发送ajax请求校验用户名是否可用
	$("#empName_add_input").change(function(){
		var ename=this.value;
		$.ajax({
			url:"${base_path}/fcheck",
			type:"POST",
			data:"ename="+ename,
			success:function(result){
				if(result.code==150){
					show_validate_msg("#empName_add_input","success","用户名可用");
					$("#emp_save_btn").attr("ajax-va","success");
				}else{
					show_validate_msg("#empName_add_input","error",result.extend.va_msg);
					$("#emp_save_btn").attr("ajax-va","error");
				}
				
			}
		});
	
	});
	
	//保存员工
	$("#emp_save_btn").click(function() {
		if(!addcheck()){
			return false;
		}
		if($(this).attr("ajax-va")=="error"){
			return false;
		}
		
		$.ajax({
			url:"${base_path}/emp",
			type:"POST",
			data:$("#empAddModal form").serialize(),
			success:function(result){
			
				$("#empAddModal").modal('hide');
				to_page(totalRecord);
			}
		});
	});
	$(document).on("click",".delete_btn",function () {
		var ename=$(this).parents("tr").find("td:eq(2)").text();
		var eid = $(this).attr("del-id");
		//alert($(this).parents("tr").find("td:eq(2)").text());
		if(confirm("确认删除【"+ename+"】吗？")){
		$.ajax({
			url:"${base_path}/emp/"+eid,
			type:"DELETE",
			success:function(result){
				alert(result.message);
				to_page(currentPage);
			}
		  
		});
		}
	});
	$("#del_model").click(function() {
		var eid="";
		var ename="";
		$.each($(".check_item:checked"),function(){
			ename+=$(this).parents("tr").find("td:eq(2)").text()+",";
			eid+=$(this).parents("tr").find("td:eq(1)").text()+"-";
		});
		eid=eid.substring(0,eid.length-1);
		ename=ename.substring(0,ename.length-1);
		if(confirm("确认删除【"+ename+"】吗？")){
			$.ajax({
				url:"${base_path}/emp/"+eid,
				type:"DELETE",
				success:function(result){
					alert(result.message);
					to_page(currentPage);
				}
			});
		}
		
	});
	
	
	   </script>

	
        
   
     </table>
</body>
</html>