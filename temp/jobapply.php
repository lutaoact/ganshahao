<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>jobapply.php</title>
<link rel="stylesheet" rev="stylesheet" href="CSS/main.css" type="text/css" media="all" />
<script type="text/javascript" src="javascript/loginexpand.js"></script>
<script type="text/javascript" src="javascript/jquery-1.9.0.min.js"></script>

<link rel="icon" type="/image/ico" href="favicon.ico">
</head>

<body>
<!-- loggedinheader -->
<div class="popupmask" id="popupmask" style="visibility:hidden; opacity:0;" onclick="loginhide()"></div>
<div class="navcon">
	<div class="navbg">
    <div class="container">
    	<div class="navbutLogo">LOGO</div>
        <a href="joblist.php"><div class="navbutL">工作列表</div></a>
        <a href=""><div class="navbutL">了解我们</div></a>
        <div class="navbutRA"><img src="image/avatar.jpg" height="55px" /></div>
        <a href=""><div class="navbutR3">邮箱</div></a>
    </div>
    </div>
</div>
<!-- loggedinheader -->
<section>
<div class="container" style="padding-top:40px;">
<div class="leftcol">
    <!-- jobinfo item -->
    <div class="jobinfoblock"><div class="jobinfocon">
    	<div class="joblistlogo"><!-- 公司图片 --><img src="image/brand1.png" width="60" height="60"></div>
        <div class="joblistname"><!-- 公司名称 -->公司名称</div>
        <div class="jobinfoname"><!-- 职位名称 -->职位名称</div>
        <a href="jobinfo.php"><div class="jobapplybut">职位信息</div></a>
    </div></div><div style="height:10px;"></div>
    <!-- jobinfo item -->
    <div class="jobapplystep"><div class="jobapplystep1">
    	<span class="circlespan">&nbsp1 </span>&nbsp开始
    </div></div>
    <div class="jobapplystep"><div class="jobapplystep1">
    	<span class="circlespan">&nbsp2 </span>&nbsp训练
    </div></div>
    <div class="jobapplystep"><div class="jobapplystep0">
    	<span class="circlespan">&nbsp3 </span>&nbsp申请
    </div></div>
</div>
<div class="rightcol">
	<div class="progbar">
        <div class="progbarcon">
            <div class="progbarobj" style="width:100%;">
            	<div class="progbartext">12/12</div>
            </div>
        </div>
    </div>
    <div class="training">
    	<!-- 试题列表 -->
        <!-- 试题单元 -->
        <div class="trainingcon">
        	<div class="objnum">01</div>
            <div class="objtext">test<br>test</div>
        	<div class="trainingobj">
            	<li>
                	<span class="input"></span><input type="checkbox" id="1"/><span class="input"></span><label for="1">test</label>
                </li>
                <li>
                	<span class="input"></span><input type="checkbox" id="2"/><span class="input"></span><label for="2">test</label>
                </li>
                <li>
                	<span class="input"></span><input type="checkbox" id="3"/><span class="input"></span><label for="3">test</label>
                </li>
                <li>
                	<span class="input"></span><input type="checkbox" id="4"/><span class="input"></span><label for="4">test</label>
                </li>
            </div>
        </div>
        <!-- 试题单元 -->
    </div>
	<div class="jobtraining">
    	<!-- 练习列表 -->
        <!-- 练习单元 -->
        <li>
        	<div class="testname"><!-- 测试名称 -->测试名称</div>
            <div class="testinfo"><!-- 测试信息 -->题型：选择题 &nbsp&nbsp 题量：20 &nbsp&nbsp 时间：10分钟</div>
            <div class="teststatus"><!-- 测试状态 -->未测试</div>
            <div class="ranking0"><!-- 成绩 -->N/A</div>
        </li>
        <div style="height:5px;"></div>
        <!-- 练习单元 -->
        <!-- 练习单元 -->
        <li>
        	<div class="testname"><!-- 测试名称 -->测试名称</div>
            <div class="testinfo"><!-- 测试信息 -->题型：选择题 &nbsp&nbsp 题量：20 &nbsp&nbsp 时间：10分钟</div>
            <div class="teststatus"><!-- 测试状态 -->2013-06-02</div>
            <div class="ranking1"><!-- 成绩 -->92</div>
        </li>
        <div style="height:5px;"></div>
        <!-- 练习单元 -->
        <!-- 练习单元 -->
        <li>
        	<div class="testname"><!-- 测试名称 -->测试名称</div>
            <div class="testinfo"><!-- 测试信息 -->题型：选择题 &nbsp&nbsp 题量：20 &nbsp&nbsp 时间：10分钟</div>
            <div class="teststatus"><!-- 测试状态 -->2013-06-01</div>
            <div class="ranking2"><!-- 成绩 -->75</div>
        </li>
        <div style="height:5px;"></div>
        <!-- 练习单元 -->
        <!-- 练习单元 -->
        <li>
        	<div class="testname"><!-- 测试名称 -->测试名称</div>
            <div class="testinfo"><!-- 测试信息 -->题型：选择题 &nbsp&nbsp 题量：20 &nbsp&nbsp 时间：10分钟</div>
            <div class="teststatus"><!-- 测试状态 -->2013-06-03</div>
            <div class="ranking3"><!-- 成绩 -->52</div>
        </li>
        <div style="height:5px;"></div>
        <!-- 练习单元 -->
    </div>
</div>
<div style="clear:both; height:40px;"></div>
</div>
</section>
<!-- footer -->
<div class="footercon">
	<div class="container" style="width:1280px;"><img src="image/sep.png" /></div>
    <div class="container">
    	<div style="width:482px; padding:20px 240px 20px 240px">
    		<a href=""><img src="image/sina.jpg" width="154px" /></a>
            <a href=""><img src="image/tencent.jpg" width="154px" /></a>
            <a href=""><img src="image/renren.jpg" width="154px" /></a>
        </div>
        <div style="text-align:center;">
        <a href=""><span style="font-size:14px; color:#666; text-decoration:none;">关于我们</span></a> &nbsp&nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp&nbsp <a href=""><span style="font-size:14px; color:#666; text-decoration:none;">联系我们</span></a> &nbsp&nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp&nbsp <a href=""><span style="font-size:14px; color:#666; text-decoration:none;">加入我们</span></a> &nbsp&nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp&nbsp <a href=""><span style="font-size:14px; color:#666; text-decoration:none;">营销服务</span></a> &nbsp&nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp&nbsp <a href=""><span style="font-size:14px; color:#666; text-decoration:none;">招贤纳士</span></a> &nbsp&nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp&nbsp <a href=""><span style="font-size:14px; color:#666; text-decoration:none;">友情链接</span></a>
        </div>
    </div>
    <div class="subfooter">
    	<div class="container" style="text-align:right;">subfooter text</div>
    </div>
</div>
<!-- footer -->
</body>
</html>