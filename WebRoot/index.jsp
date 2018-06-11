<%@page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>卖花的小女孩--主页</title>
    <link rel="stylesheet" href="./css/head.css">
    <link rel="stylesheet" href="./css/content.css">
    <link rel="stylesheet" href="./css/content-two.css">
    <link rel="stylesheet" href="./css/contentthree.css">
    <link rel="stylesheet" href="./css/contentfour.css">
    <link rel="stylesheet" href="./css/foot.css">
    <link rel="stylesheet" href="./css/button.css">




    <!--滚动样式表-->
   <link rel="stylesheet" type="text/css" href="css/style.css" media="screen" />
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="js/jquery.banner.revolution.min.js"></script>
    <script type="text/javascript" src="js/banner.js"></script>
    <script type="text/javascript" src="js/count.js">setInterval(getRTime,1000)</script>
    <script type="text/javascript" src="js/count2.js">setInterval(getRTime,1000)</script>
</head>
<body>

<div class="head-top">
    <div class="icon-time">
        <img  src="./icon/time.png" width="20px" height="20px">
    </div>
    <div class="head-time">
        营业时间 08:30~21:30
    </div>
    <div class="head-welcome">
        欢迎光临卖花的小女孩在线花店
    </div>
    <div class="right-but">
        <a href="lookShoppingCar.jsp" ><img class="icon" src="./icon/shopping.png"></a>
        <a href="#" > <img class="icon" src="./icon/search.png"></a>
        <a href="information.jsp" > <img class="icon" src="./icon/people.png"></a>
    </div>
</div>

<!--div head-title 放logo和导航-->
<div class="head-title">
    <div class="logo">
        <img src="./image/logo11.JPG" width="300px" height="180px">
    </div>
    <div class="head-navigation">
        <ul class="nav">
            <li><a href="index.jsp"><img  src="./icon/flower.png" width="20px" height="20px">我的首页</a></li>
            <li><a href="lookCosmetic.jsp"><img  src="./icon/flower.png" width="20px" height="20px">浏览花品</a></li>
            <li><a href="lookShoppingCar.jsp"><img  src="./icon/flower.png" width="20px" height="20px">我的购物车</a></li>
            <li><a href="lookOrderForm.jsp"><img  src="./icon/flower.png" width="20px" height="20px">我的订单</a></li>
            <li><a href="makeVIP.jsp"><img  src="./icon/flower.png" width="20px" height="20px">我要定制</a></li>
            <li><a href="myVIP.jsp"><img  src="./icon/flower.png" width="20px" height="20px">我的VIP定制</a></li>
            <li><a href="login.jsp"><img  src="./icon/flower.png" width="20px" height="20px">登录</a></li>
            <li><a href="inputRegisterMess.jsp"><img  src="./icon/flower.png" width="20px" height="20px">注册</a></li>
            <li><a href="exitServlet"><img  src="./icon/flower.png" width="20px" height="20px">退出</a></li>
        </ul>
    </div>
</div>

<!--div content图片滚动div-->
<div class="content">
    <div id="wrapper">
        <div class="fullwidthbanner-container">
            <div class="fullwidthbanner">
                <ul>
                    <li data-transition="3dcurtain-horizontal" data-slotamount="15" data-masterspeed="300">
                        <img src="images/slides/slide3.jpg"   alt="" />
                    </li>
                    <li data-transition="3dcurtain-vertical" data-slotamount="15" data-masterspeed="300" data-link="#">
                        <img src="images/slides/slide5.jpg" alt="" />
                    </li>
                    <li data-transition="papercut" data-slotamount="15" data-masterspeed="300" data-link="#">
                        <img src="images/slides/slide2.jpg" alt="" />
                    </li>
                    <li data-transition="turnoff" data-slotamount="15" data-masterspeed="300">
                        <img src="images/slides/slide1.jpg" alt="" />
                    </li>
                    <li data-transition="flyin" data-slotamount="15" data-masterspeed="300">
                        <img src="images/slides/slide6.jpg" alt="" />
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div style="text-align:center;clear:both;">
        <script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
        <script src="/follow.js" type="text/javascript"></script>
    </div>
</div>


<div class="twopicture">
    <div class="twopicture-left">
        <marquee direction="right" behavior="slide" scrollamount="20">
            </br>
            <img src="./image/good1.jpg" width="380px" height="380px">
        </marquee>
    </div>
    <div class="left-none">
        </div>
    <div class="right-none">
    </div>
    <div class="twopicture-right">
        <marquee direction="left" behavior="slide" scrollamount="20">
            </br>
            <img src="./image/good2.jpg" width="380px" height="380px">
        </marquee>
    </div>
</div>

<div class="today-new">
    <div class="div-title">
        <p>今日上新 New Product </p>
        <hr>
        </div>
    <div class="showmore">
        <a class="button button-glow button-border button-rounded button-primary"href="#">查看更多</a>
    </div>
    <div class="new-one">
        <img src="./image/good3.jpg" width="250px" height="250px">
    </div>
    <div class="new-two">
        <img src="./image/good4.jpg" width="250px" height="250px">
    </div>
    <div class="new-three">
        <img src="./image/good5.jpg" width="250px" height="250px">
    </div>
    <div class="new-four">
        <img src="./image/good6.jpg" width="250px" height="250px">
    </div>
</div>


<div class="timelimit-sale">
    <div class="div-title">
        <p>限时促销 Sale Promotion </p>
        <hr>
    </div>
    <div class="showmore">
        <a class="button button-glow button-border button-rounded button-primary"href="#">查看更多</a>
    </div>
    <div class="sale-left">
        <div class="sale-time-leftcount">
                <br><br>
                <span id="t_d">00天</span>
                <span id="t_h">00时</span>
                <span id="t_m">00分</span>
                <span id="t_s">00秒</span>
        </div>
        <div class="sale-left-picture">
        <marquee direction="right" behavior="slide" scrollamount="40">
            </br>
            <img src="./image/good8.jpg" width="600px" height="400px">
        </marquee>
        </div>
    </div>

    <div class="sale-right">
        <div class="sale-time-rightcount">
            <br>     <br>     <br>
            <span id="t_d2">00天</span>
            <span id="t_h2">00时</span>
            <span id="t_m2">00分</span>
            <span id="t_s2">00秒</span>
        </div>
        <div class="sale-right-picture">
            <marquee direction="left" behavior="slide" scrollamount="40">
            </br>
            <img src="./image/good7.jpg" width="600px" height="400px">
            </marquee>
        </div>

    </div>
</div>

<div class="decoration">
    <div class="div-title">
        <p>装扮花园 Beauty Gordon </p>
        <hr>
    </div>
    <div class="showmore">
        <a class="button button-glow button-border button-rounded button-primary"href="#">查看更多</a>
    </div>
    <div class="decoration-one">
        <img src="./image/good9.jpg" width="250px" height="500px">
    </div>
    <div class="decoration-two">
        <img src="./image/good11.jpg" width="250px" height="500px">
    </div>
    <div class="decoration-three">
        <img src="./image/good10.jpg" width="250px" height="500px">
    </div>
    <div class="decoration-four">
        <img src="./image/good12.jpg" width="250px" height="500px">
    </div>
</div>

<div class="flower-story">
    <div class="div-title">
        <p>花的故事 Flower Story </p>
        <hr>
    </div>
    <div class="storyone">
        <div class="storyonepicture">
            <a href="#"> <img src="./image/good14.jpg" width="180px" height="180px"></a>
        </div>
        <div class="storyonetext">
            <a href="#"><p style="font-size: large; color:white">关于彼岸花的传说</p></a>
            <p style="font-size: smaller">发布日期：2018-04-23</p>
            <p style="font-size: small">传说，很久很久以前，城市的边缘开满了大片大片的彼岸花，也就是曼珠沙华。守护彼岸花的是两个妖精，
                一个花妖叫曼珠，一个是叶妖叫沙华。他们守候了几千年的彼岸花，可是从来没有见过面，因为花开的时候，
                花开时看不到叶子，有叶子时看不到花，花叶两不相见，生生相错......</p>
        </div>
    </div>
    <div class="storytwo">
        <div class="storytwopicture">
            <a href="#"><img src="./image/good13.jpg" width="180px" height="180px"> </a>
        </div>
        <div class="storytwotext">
            <a href="#"><p style="font-size: large ;color:white">康乃馨的来历</p></a>
            <p style="font-size: smaller">发布日期：2018-03-28</p>
            <p style="font-size: small">在美国费拉德尔菲城有一位名叫安娜·查维斯小姐。她的母亲在1906年5月9日去世，她十分悲痛，怀念不已。
                在第二年其母的逝世周年纪念日时，她用白色的康乃馨鲜花佩带在襟上，借以纪念，同时她还向公众呼吁定立一个颂扬母亲的节日，
                到时让女儿们都给健在的母亲献上红色的康乃馨，以感激......</p>
        </div>
    </div>
    <div class="storyright">
        <img src="./image/good15.jpg" width="500px" height="380px">
    </div>

</div>

<!--页脚div-->
    <div class="foot">

        <div class="footone"><img src="./icon/car.png" width="50px" height="50px"><p style="font-size: medium">满1000元全国包邮</p></div>
        <div class="foottwo"><img src="./icon/gift.png" width="50px" height="50px"><p style="font-size: medium">下单送精美礼品</p></div>
        <div class="footthree"><img src="./icon/after.png" width="50px" height="50px"><p style="font-size: medium">贴心的售后服务</p></div>
        <div class="footfour"><img src="./icon/off.png" width="50px" height="50px"><p style="font-size: medium">店铺优惠劵</p></div>
    </div>
<div class="footleast">


   <div class="footext"> <p>Copyright © 2017-2018中山大学南方学院 All rights reserved</p></div>

</div>
 
 
	 
</div></body>
</html>