<!DOCTYPE html>
<html lang='zh'>
    <head>
    <meta charset="utf-8">
    <title>Home</title>
    <link rel="stylesheet" href="/static/css/common.css" type="text/css" />
    <link rel="stylesheet" rev="stylesheet" href="/static/CSS/main.css" type="text/css" media="all" />
	<link rel="icon" type="/image/ico" href="favicon.ico">
    </head>
    <body id="home">
        <div class="headerimg"></div>
        {include file="common/header.tpl"}
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
	<span class="als-prev"><img src="/static/img/thin_left_arrow_333.png" alt="prev" title="previous" /></span>
		<div class="als-viewport">
			<div class="als-wrapper">
            <!-- 商标滚动条 -->
				<div class="als-item"><img src="/static/img/brand1.jpg" alt="" height="120px" /></div>
                <div class="als-item"><img src="/static/img/brand1.jpg" alt="" height="120px" /></div>
                <div class="als-item"><img src="/static/img/brand1.jpg" alt="" height="120px" /></div>
                <div class="als-item"><img src="/static/img/brand1.jpg" alt="" height="120px" /></div>
                <div class="als-item"><img src="/static/img/brand1.jpg" alt="" height="120px" /></div>
            <!-- 商标滚动条 -->
			</div>
		</div>
	<span class="als-next"><img src="/static/img/thin_right_arrow_333.png" alt="next" title="next" /></span>
</div>
</div>
</section>
  
    
        {include file="common/footer.tpl"}
	<script type="text/javascript" src="/static/js/loginexpand.js"></script>
	<script type="text/javascript" src="/static/js/jquery.alsEN-1.0.min.js"></script>
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


    </body>
</html>
