<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>member.php</title>
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
    <div class="memberblock"><div class="membercon">
    	<div class="memberavatar"><!-- 头像 --><img src="image/avatar.jpg" width="150" height="150"></div>
        <div class="memberinfo">
        <!-- 个人信息 -->
        	<span style="font-size:20px; line-height:32px">尹禺然</span><br>
            21岁<br>大学生
        </div>
        <div class="updateinfo">更新个人信息</div>
    </div></div><div style="height:10px;"></div>
</div>
<div class="rightcol">
    <div class="latest">
    <div class="latesttitle">我的工作申请</div>
    	<!-- 最近申请列表 -->
        <!-- 最近申请单元 -->
			<div class="latestblock">
            	<div class="latestcon">
                	<div class="joblistlogo"><!-- 公司图片 --><img src="image/brand1.png" width="40" height="40"></div>
        			<div class="latestname"><!-- 公司名称 -->公司名称</div>
					<div class="latestposname"><!-- 职位名称 -->职位名称</div>
                    <div class="latestbut">查看详情</div>
                    <div class="lateststatus1"><!-- 当前状态 -->已提交</div>
                </div>
            </div>
        <!-- 最近申请单元 -->
        <!-- 最近申请单元 -->
			<div class="latestblock">
            	<div class="latestcon">
                	<div class="joblistlogo"><!-- 公司图片 --><img src="image/brand1.png" width="40" height="40"></div>
        			<div class="latestname"><!-- 公司名称 -->公司名称</div>
					<div class="latestposname"><!-- 职位名称 -->职位名称</div>
                    <div class="latestbut">查看详情</div>
                    <div class="lateststatus2"><!-- 当前状态 -->培训中</div>
                </div>
            </div>
        <!-- 最近申请单元 -->
        <!-- 最近申请单元 -->
			<div class="latestblock">
            	<div class="latestcon">
                	<div class="joblistlogo"><!-- 公司图片 --><img src="image/brand1.png" width="40" height="40"></div>
        			<div class="latestname"><!-- 公司名称 -->公司名称</div>
					<div class="latestposname"><!-- 职位名称 -->职位名称</div>
                    <div class="latestbut">查看详情</div>
                    <div class="lateststatus2"><!-- 当前状态 -->培训中</div>
                </div>
            </div>
        <!-- 最近申请单元 -->

	<div style="clear:both; height:30px;"></div>
    </div>
    
	<div class="jobtraining">
    <div class="latesttitle">我的最近测试</div>
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