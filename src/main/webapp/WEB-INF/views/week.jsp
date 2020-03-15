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
    <title>今日课时</title>
</head>
<body>
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



</div>



<script type="text/javascript">
$(function () {
    var now = new Date();
    var year = now.getFullYear(); //得到年份
    var month = now.getMonth();//得到月份
    var date = now.getDate();//得到日期
    var ndate=year+"-"+month+":"+date;
    $.ajax({
        url:"${base_path}/dayfee/"+ndate,
    })
})
</script>
</body>
</html>