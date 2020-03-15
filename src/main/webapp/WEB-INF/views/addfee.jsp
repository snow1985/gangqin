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
    <title>费用信息</title>
</head>
<body>
<div class="modal fade" id="mainModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">费用修改</h4>
            </div>
            <div class="modal-body" >
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="name_update_static" name="name"></p>

                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">课单价</label>
                        <div class="col-sm-10">
                            <input type="text" name="unitprice" class="form-control" id="unitprice_update_input" placeholder="课时费">
                            <span class="help-block"></span>

                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">剩余课时</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="surplushour_update_static"></p>

                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">剩余费用</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="surplusfee_update_static"></p>

                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">历史课时</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="hishour_update_static"></p>

                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">历史费用</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="hisfee_update_static"></p>

                            <span class="help-block"></span>
                        </div>
                    </div>


                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="main_update_btn">保存</button>
            </div>
        </div>
    </div>
</div>


<div class="container">
    <!-- 标题 -->
    <div class="row">
        <div class="col-md-12">
            <h1>学生费用信息</h1>
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
            <table class="table table-bordered" id="mains_table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>姓名</th>
                    <th>课时费用</th>
                    <th>剩余课时</th>
                    <th>剩余费用</th>
                    <th>历史课时</th>
                    <th>历史费用</th>
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
            url:"${base_path}/mains",
            data:"pn=1",
            type:"GET",

            success:function(result){
                build_main_table(result);
                build_page_nav(result);
                build_page_info(result)
            }
        });
    });
    //翻页
    function to_page(pn) {
        $.ajax({
            url:"${base_path}/mains",
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
    function build_main_table(result){
        $("#mains_table tbody").empty();
        var mains = result.extend.pageInfo.list;
        $.each(mains,function(index,item){


            var stuIdTd = $("<td></td>").append(item.id);
            var stunameTd = $("<td></td>").append(item.name);
            var unitprice = $("<td></td>").append(item.unitprice);
            var surplushour = $("<td></td>").append(item.surplushour);
            var surplusfee = $("<td></td>").append(item.surplusfee);
            var hishour = $("<td></td>").append(item.hishour);
            var hisfee = $("<td></td>").append(item.hisfee);
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            editBtn.attr("edit-id",item.id);
            var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("暂封");
            delBtn.attr("del-id",item.id);
            var conBtn=$("<td></td>").append(editBtn).append(" ").append(delBtn);

            $("<tr></tr>").append(stuIdTd)
                .append(stunameTd)
                .append(unitprice)
                .append(surplushour)
                .append(surplusfee)
                .append(hishour)
                .append(hisfee)
                .append(conBtn)
                .appendTo("#mains_table tbody");
        });


    }
    $(document).on("click",".edit_btn",function () {


        getMain($(this).attr("edit-id"));
        $("#main_update_btn").attr("edit-id",$(this).attr("edit-id"));
        $("#mainModal").modal({
            backdrop:'static'
        });
    });
    function getMain(id) {
        $(id).empty();
        $.ajax({
            url:"${base_path}/main/"+id,
            type:"GET",
            success:function(result){
                var main=result.extend.mainfee;
                $("#name_update_static").text(main.name);
                $("#unitprice_update_input").val(main.unitprice);
                $("#surplushour_update_static").text(main.surplushour);
                $("#surplusfee_update_static").text(main.surplusfee);
                $("#hishour_update_static").text(main.hishour);
                $("#hisfee_update_static").text(main.hisfee);

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



    $("#main_update_btn").click(function () {
        $.ajax({
            url:"${base_path}/main/"+$(this).attr("edit-id"),
            type:"PUT",
            data:$("#mainModal form").serialize(),
            success:function(result){
                alert(result.msg);
                $("#mainModal").modal("hide");
                to_page(currentPage);
            }
        })
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