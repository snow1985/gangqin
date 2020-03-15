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
<div class="row">
  <div class=".col-xs-12 .col-md-4 col-md-offset-3">
 <div class="text-center">
  <button type="button" class="btn btn-primary btn-lg btn-block" 
  onclick="window.location.href='${base_path}/week'">本周安排</button>
  </div>
  </div>
</div>
<div class="row">
  <div class=".col-xs-12 .col-md-4 col-md-offset-3">
  <div class="text-center">
  <button type="button" class="btn btn-primary btn-lg btn-block"
  onclick="window.location.href='${base_path}/student'">学生信息</button>
  </div>
  </div>
</div>
<div class="row">
  <div class=".col-xs-12 .col-md-4 col-md-offset-3">
  <div class="text-center">
  <button type="button" class="btn btn-primary btn-lg btn-block"
   onclick="window.location.href='${base_path}/plan'">近期计划
</button>
  </div>

</div>
</div>
<div class="row">
  <div class=".col-xs-12 .col-md-4 col-md-offset-3">
 <div class="text-center">
  <button type="button" class="btn btn-primary btn-lg btn-block"
  onclick="window.location.href='${base_path}/history'">历史记录
  </button>
  </div>
  </div>
</div>
<div class="row">
  <div class=".col-xs-12 .col-md-4 col-md-offset-3">
 <div class="text-center">
  <button type="button" class="btn btn-primary btn-lg btn-block"
  onclick="window.location.href='${base_path}/addfee'">修改费用
</button>
  </div>
  </div>
</div>
<div class="row">
    <div class=".col-xs-12 .col-md-4 col-md-offset-3">
        <div class="text-center">
            <button type="button" class="btn btn-primary btn-lg btn-block"
                    onclick="window.location.href='${base_path}/weekplan'">修改课表
            </button>
        </div>
    </div>
</div>
</body>
</html>