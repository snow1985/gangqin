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
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0" />
<script type="text/javascript" src="${base_path}/static/js/jquery-3.4.1.min.js"></script>
<link href="${base_path}/static/css/bootstrap.min.css" rel="stylesheet">
<script src="${base_path}/static/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="modal fade" id="stuModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">详细信息</h4>
            </div>
            <div class="modal-body" >
                <dl class="dl-horizontal" id="stuUI">

                </dl>
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th>学习进度</th>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
        </div>
    </div>


<div class="container">
    <!-- 标题 -->
    <div class="row">
        <div class="col-md-12">
            <h1>学生信息</h1>
        </div>
    </div>
    <!-- 按钮 -->
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="add_model">新增</button>
            <button class="btn btn-danger" id="back_model" onclick="window.location.href='${base_path}/index.jsp'">返回</button>
        </div>
    </div>
    <!-- 显示表格数据 -->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="stus_table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>姓名</th>
                    <th>年龄</th>
                    <th>地址</th>
                    <th>信息</th>
                    <th>备注</th>
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
    var totalRecord;
    $(function(){
        $.ajax({
            url:"${base_path}/stus",
            data:"pn=1",
            type:"GET",

            success:function(result){
                build_stu_table(result);
                build_page_nav(result);
                build_page_info(result)
            }
        });
    });
    //翻页
    function to_page(pn) {
        $.ajax({
            url:"${base_path}/stus",
            data:"pn="+pn,
            type:"GET",

            success:function(result){
                build_stu_table(result);
                build_page_nav(result);
                build_page_info(result)
            }
        });
    }
    //向页面添加员工信息及样式
    function build_stu_table(result){
        $("#stus_table tbody").empty();
        var stus = result.extend.pageInfo.list;
        $.each(stus,function(index,item){


            var stuIdTd = $("<td></td>").append(item.id);
            var stunameTd = $("<td></td>").append(item.name);
            var stuageTd = $("<td></td>").append(item.age);
            var addressTd = $("<td></td>").append(item.address);
            var infoTd = $("<td></td>").append(item.information);
            var bakTd = $("<td></td>").append(item.bak);

            $("<tr></tr>").append(stuIdTd)
                .append(stunameTd)
                .append(stuageTd)
                .append(addressTd)
                .append(infoTd)
                .append(bakTd)
                .appendTo("#stus_table tbody");
        });


    }
    $('#stus_table').on('click','tr', function(){
        var t1 =$(this).find('td').eq(0).text();
        getStu(t1);
        $("#stuModal").modal({
            backdrop:'static'
        });


    });
    function getStu(id) {
        $(id).empty();
        $("#stuModal dl").empty();
        $("#stuModal tbody").empty();
        $.ajax({
            url:"${base_path}/simple/"+id,
            type:"GET",
            success:function(result){
                var stu=result.extend.stu;
                var stua1=$("<dt></dt>").append("学生学号");
                var stua2= $("<dd></dd>").append(stu.id);
                var stua3=$("<dt></dt>").append("学生姓名");
                var stua4= $("<dd></dd>").append(stu.name);
                var stua5=$("<dt></dt>").append("备注信息");
                var stua6= $("<dd></dd>").append(stu.bak);
                var stua9=$("<dt></dt>").append("学课单价");
                var stua10= $("<dd></dd>").append(stu.mainFee.unitprice);
                var stua11=$("<dt></dt>").append("剩余课时");
                var stua12= $("<dd></dd>").append(stu.mainFee.surplushour);
                var stua13=$("<dt></dt>").append("剩余费用");
                var stua14= $("<dd></dd>").append(stu.mainFee.surplusfee);
                var stua15=$("<dt></dt>").append("历史课时");
                var stua16= $("<dd></dd>").append(stu.mainFee.hishour);
                var stua17=$("<dt></dt>").append("历史费用");
                var stua18=$("<dd></dd>").append(stu.mainFee.hisfee);
                var stua7=$("<td></td>").append(stu.rate);
                $("<tr></tr>").append(stua7).appendTo("#stuModal tbody");
                $("<dl></dl>").append(stua1)
                            .append(stua2)
                            .append(stua3)
                            .append(stua4)
                            .append(stua5)
                            .append(stua6)
                            .append(stua9)
                            .append(stua10)
                            .append(stua11)
                            .append(stua12)
                            .append(stua13)
                            .append(stua14)
                            .append(stua15)
                            .append(stua16)
                            .append(stua17)
                            .append(stua18)
                            .appendTo("#stuModal dl")

            }
        });
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


        $("#empAddModal").modal({
            backdrop:'static'
        });
    });

    //点击编辑模态框
    $(document).on("click",".edit_btn",function () {


        getPlan($(this).attr("edit-id"));
        $("#plan_update_btn").attr("edit-id",$(this).attr("edit-id"));
        $("#empUpdateModal").modal({
            backdrop:'static'
        });
    });




    $("#plan_update_btn").click(function() {
        $.ajax({
            url:"${base_path}/plan/"+$(this).attr("edit-id"),
            type:"PUT",
            data:$("#empUpdateModal form").serialize(),
            success:function(result){
                alert(result.msg);
                //1、关闭对话框
                $("#empUpdateModal").modal("hide");
                //2、回到本页面
                to_page(currentPage);
            }
        });
    });

    $("#plan_save_btn").click(function() {


        $.ajax({
            url:"${base_path}/plan",
            type:"POST",
            data:$("#empAddModal form").serialize(),
            success:function(result){

                $("#empAddModal").modal('hide');
                to_page(totalRecord);
            }
        });
    });

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
		url:"/student",
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