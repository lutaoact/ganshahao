<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>index.php</title>
<link rel="stylesheet" rev="stylesheet" href="CSS/main.css" type="text/css" media="all" />
<script type="text/javascript" src="javascript/loginexpand.js"></script>
<script type="text/javascript" src="javascript/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="javascript/jquery.alsEN-1.0.min.js"></script>

<link rel="icon" type="/image/ico" href="favicon.ico">
</head>

<body>
<div class="headerimg"></div>
<!-- indexheader -->
<div class="popupmask" id="popupmask" style="visibility:hidden; opacity:0;" onclick="loginhide()"></div>
<div class="navcon">
	<div class="navbg">
    <div class="container">
    	<div class="navbutLogo">LOGO</div>
        <a href=""><div class="navbutL">我要雇人</div></a>
        <a href=""><div class="navbutL">了解我们</div></a>
        <div class="navbutR2" id="login" onclick="loginexpand()">登录</div>
        <a href=""><div class="navbutR">注册</div></a>
    </div>
    </div>
</div>
<!-- indexheader -->
<section>
<div class="stepscon">
	<div style="position:absolute; top:-70px; height:70px; color:white; font-size:42px; line-height:70px; -moz-text-shadow: 1px 1px 5px #333; -webkit-text-shadow: 1px 1px 5px #333; text-shadow: 1px 1px 5px #333;">找到适合你的兼职</div>
	<div class="stepsblock">
		<span class="circlespan">&nbsp1 </span>&nbsp 搜索职位
    </div>
    <div class="stepsblock">
		<span class="circlespan">&nbsp2 </span>&nbsp 能力培训
    </div>
    <div class="stepsblock">
		<span class="circlespan">&nbsp3 </span>&nbsp 提交申请
    </div>
    <div class="stepsblock" style="background:#ffdb17; width:32%">
    <!-- 邮编搜索 -->
		<input type="text" class="zipcode" name="zipcode" maxlength="6"  placeholder="请输入邮编" style="width:150px" />
        <input type="submit" class="zipcodebut" name="submit" value="&nbsp搜索 " />
    <!-- 邮编搜索 -->
    </div>
</div>

<div class="container" style="padding-top:490px;">
<div id="list" class="als-container">
	<span class="als-prev"><img src="image/thin_left_arrow_333.png" alt="prev" title="previous" /></span>
		<div class="als-viewport">
			<div class="als-wrapper">
            <!-- 商标滚动条 -->
				<div class="als-item"><img src="image/brand1.jpg" alt="" height="120px" /></div>
                <div class="als-item"><img src="image/brand1.jpg" alt="" height="120px" /></div>
                <div class="als-item"><img src="image/brand1.jpg" alt="" height="120px" /></div>
                <div class="als-item"><img src="image/brand1.jpg" alt="" height="120px" /></div>
                <div class="als-item"><img src="image/brand1.jpg" alt="" height="120px" /></div>
            <!-- 商标滚动条 -->
			</div>
		</div>
	<span class="als-next"><img src="image/thin_right_arrow_333.png" alt="next" title="next" /></span>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$("#list").als({
					visible_items: 4,
					scrolling_items: 4,
					orientation: "horizontal",
					circular: "yes",
					autoscroll: "yes",
					interval: 4000,
					direction: "left",
					start_from: 1
		});
	});	
</script>
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