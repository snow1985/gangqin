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
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0" />
    <script type="text/javascript" src="${base_path}/static/js/jquery-3.4.1.min.js"></script>
    <link href="${base_path}/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${base_path}/static/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    <script src="${base_path}/static/js/bootstrap.min.js"></script>
    <script src="${base_path}/static/js/bootstrap-datetimepicker.js"></script>
    <script src="${base_path}/static/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${base_path}/static/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<title>每周课表</title>
</head>
<body>

<div class="modal fade" id="weekAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">添加课表</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <%--<div class="checkbox">--%>
                    <label class="radio-inline">
                        <input type="radio" name="zjbs" id="monday" value="monday"> 周一
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="zjbs" id="tuesday" value="tuesday"> 周二
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="zjbs" id="wednesday" value="wednesday"> 周三
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="zjbs" id="thursday" value="thursday"> 周四
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="zjbs" id="friday" value="friday"> 周五
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="zjbs" id="saturday" value="saturday"> 周六
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="zjbs" id="sunday" value="sunday"> 周日
                    </label>


                    <div class="form-group">
                        <label class="col-sm-2 control-label">学生</label>
                        <div class="col-sm-4">
                            <!-- 部门提交部门id即可 -->
                            <select class="form-control" name="name">
                            </select>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 10px">
                        <label class="col-sm-3 control-label"
                               style="text-align: right; margin-top:5px;padding-left: 10px;padding-right: 10px">开始</label>
                        <div class="col-sm-9">
                            <input type="text" name="stime" <%--readonly--%> class="form-control"
                                   id="stime">
                        </div>

                    </div>
                    <div class="row" style="margin-top: 10px">
                        <label class="col-sm-3 control-label"
                               style="text-align: right; margin-top:5px;padding-left: 10px;padding-right: 10px">结束</label>
                        <div class="col-sm-9">
                            <input type="text" name="etime" <%--readonly--%> class="form-control"
                                   id="etime">
                        </div>

                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="week_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>每周课表</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="add_model">新增</button>
            <button class="btn btn-danger" id="back_model" onclick="window.location.href='${base_path}/index.jsp'">返回</button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2">
            <p>周一</p>
            <table class="table table-bordered" id="monday1">
                <thead>
                <tr>
                    <th>姓名</th>
                    <th>始</th>
                    <th>结</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>

        <div class="col-md-2">
            <p>周二</p>
            <table class="table table-bordered" id="tuesday1">
                <thead>
                <tr>
                    <th>姓名</th>
                    <th>始</th>
                    <th>结</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>

        <div class="col-md-2">
            <p>周三</p>
            <table class="table table-bordered" id="wednesday1">
                <thead>
                <tr>
                    <th>姓名</th>
                    <th>始</th>
                    <th>结</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
        <div class="col-md-2">
            <p>周四</p>
            <table class="table table-bordered" id="thursday1">
                <thead>
                <tr>
                    <th>姓名</th>
                    <th>始</th>
                    <th>结</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
        <div class="col-md-2">
            <p>周五</p>
            <table class="table table-bordered" id="friday1">
                <thead>
                <tr>
                    <th>姓名</th>
                    <th>始</th>
                    <th>结</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
        <div class="col-md-2">
            <p>周六</p>
            <table class="table table-bordered" id="saturday1">
                <thead>
                <tr>
                    <th>姓名</th>
                    <th>始</th>
                    <th>结</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
        <div class="col-md-2">
            <p>周日</p>
            <table class="table table-bordered" id="sunday1">
                <thead>
                <tr>
                    <th>姓名</th>
                    <th>始</th>
                    <th>结</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div></div>

</div>


<script type="text/javascript">
    $(function(){
        $.ajax({
            url:"${base_path}/weeks",
            type:"GET",

            success:function(result){
                build_Weeks_table(result);

            }
        });
    });
    function choose(key,value) {
        $.each(value,function (index,week) {
            var tname="\""+"#"+key+"1"+" "+"tbody"+"\"";
            var ttname=document.getElementById(key+"1");
            var wid =$("<td></td>").append(week.id);
            var wname =$("<td></td>").append(week.name);
            var wstime=$("<td></td>").append(week.stime.substr(0,5));
            var wetime=$("<td></td>").append(week.etime.substr(0,5));

            $("<tr></tr>").append(wname)
                .append(wstime)
                .append(wetime)
                .appendTo(ttname);

        })
    }
    function build_Weeks_table(result) {

        var weeks=result.extend.weeks;

        $.each(weeks,function (key,value) {
          choose(key,value);
            }
        )

    }
    $("#add_model").click(function name() {

        getStus("#weekAddModal select");
        $("#weekAddModal").modal({
            backdrop:'static'
        });
    });
    function getStus(ele){
        $(ele).empty();
        $.ajax({
            url:"${base_path}/stuss",
            type:"GET",
            success:function (result) {
                $.each(result.extend.students,function () {
                    var iname=this.id+"!"+this.name;
                    var radioOption=$("<option></option>").append(this.name).attr("value",iname);
                    radioOption.appendTo(ele);
                });
            }
        });
    }

    $("#stime").datetimepicker({
        format: 'hh:ii',
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 1,
        minView: 0,
        maxView: 1,
        forceParse: 0
    });
    $("#etime").datetimepicker({
        format: 'hh:ii',
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 1,
        minView: 0,
        maxView: 1,
        forceParse: 0
    });
    $("#week_save_btn").click(function () {
      /* var test = $("#weekAddModal form").serialize();
       alert(test);*/
       $.ajax({
            url:"${base_path}/week",
            type:"POST",
            data:$("#weekAddModal form").serialize(),
            success:function (result) {
                $("#weekAddModal").modal('hide');
            }
        });
    })
</script>
</body>
</html>