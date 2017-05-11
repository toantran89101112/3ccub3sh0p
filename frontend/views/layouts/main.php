<?php

/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use frontend\assets\AppAsset;
use common\widgets\Alert;

AppAsset::register($this);
$controller = Yii::$app->controller->id;
$action = Yii::$app->controller->action->id;
$asset = \frontend\assets\AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head/>
<!-- Mirrored from vnpost.me/ by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 09 May 2017 02:12:02 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=utf-8"/><!-- /Added by HTTrack -->
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>VNPOST.ME - Phần mềm quản lý Vận Đơn PRO</title>
    <meta name="description" content="Phần mềm quản lý bưu kiện vận đơn tốt nhất, Tỷ lệ chuyển hoàn của bạn sẽ giảm đến mức thấp nhất khi sử dụng phần mềm của chúng tôi">
    <meta property='og:image:type' content='image/png'>
    <meta property='og:image' content='<?= $asset->baseUrl ?>/template/Home/img/timeline_share.png'>
    <meta property='og:image:type' content='image/png'>
    <meta property='og:type' content='website'>
    <meta property='og:url' content="index.html">
    <!--Favicon-->
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <!--Favicon end-->

    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,400italic,600,600italic,700,700italic,800,800italic,300italic,300" rel="stylesheet">
        <?php
          if($controller == 'site' && $action == 'index'){                   
     ?>      
    <link href="<?= $asset->baseUrl ?>/template/Home/css/A.bootstrap.min.css%2bfont-awesome.min.css%2bmagnific-popup.css%2bowl.carousel.css%2bmain.css%2cMcc.xe-QRbrcBQ.css.pagespeed.cf.L7Hhsc5Z-Y.css" rel="stylesheet"/>
    <?php
          }else if($controller == 'site' && $action == 'signup'){                     
     ?>   
     <link href="<?= $asset->baseUrl ?>/template/Login/css/fontawesome/css/font-awesome.min.css" rel="stylesheet"/>
     <link href="<?= $asset->baseUrl ?>/template/Login/css/style.css" rel="stylesheet"/>
     <link href="<?= $asset->baseUrl ?>/template/Login/js/tooltipster/css/tooltipster.css" rel="stylesheet"/>
     <link href="<?= $asset->baseUrl ?>/template/Login/js/tooltipster/css/themes/tooltipster-punk.css" rel="stylesheet"/>
     <link href="<?= $asset->baseUrl ?>/template/Login/css/component.css" rel="stylesheet"/>
     <?php
          }
      ?>



    <script>(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)})(window,document,'script','../www.google-analytics.com/analytics.js','ga');ga('create','UA-64641107-4','auto');ga('send','pageview');</script>

</head>
<body>
<?php $this->beginBody() ?>



  
        <?= $content ?>
  
  
  

  
     <?php        
             if($controller == 'site' && $action == 'index'){                    
     ?>  
        <script src="<?= $asset->baseUrl ?>/template/Home/js/jquery-2.2.1.min.js.pagespeed.jm.QwDZyK_Lba.js"></script> 
        <script src="<?= $asset->baseUrl ?>/template/Home/js/bootstrap.min.js%2bjquery.magnific-popup.min.js%2bowl.carousel.min.js%2bjquery.waypoints.min.js%2bjquery.animateNumber.min.js.pagespeed.jc.3Eraoz6Fqj.js"></script><script>eval(mod_pagespeed_nsGvxPh_mc);</script> 
        <script>eval(mod_pagespeed_K1l71QAHy6);</script> 
        <script>eval(mod_pagespeed_wXHn0ya0$n);</script> 
        <script>eval(mod_pagespeed_ML5jKmR5BY);</script> 
        <script>eval(mod_pagespeed_Zf8NKk52s4);</script> 
        <script src="<?= $asset->baseUrl ?>/template/Home/js/jquery.ajaxchimp.min.js%2btweetie.min.js.pagespeed.jc.IgK0FTjtba.js"></script><script>eval(mod_pagespeed__j5OiEZgSD);</script> 
        <script>eval(mod_pagespeed_2n6LXwCzW4);</script> 
        <!--[if IE 9]>
        <script src="template/Home/js/placeholders.min.js"></script>
        <![endif]--> 
        <script src="<?= $asset->baseUrl ?>/template/Home/js/main.js%2bgmap.js%2bretina.min.js.pagespeed.jc.Z0uU-KwXGN.js"></script><script>eval(mod_pagespeed_XiUeU74n6k);</script> 
        <!--<script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script> -->
        <!--<script>eval(mod_pagespeed_77Uf00M4b4);</script> -->
        <script>eval(mod_pagespeed_LDb0DTF80S);</script> 
 <?php
       }else if($controller == 'site' && $action == 'signup'){        
  ?>
   <canvas id="bubble-canvas" style="pointer-events: none; position: fixed; top: 0px; left: 0px; z-index: 1;" width="1304" height="286"></canvas>
    <!-- jQuery -->
    <script type="text/javascript" src="<?= $asset->baseUrl ?>/template/Login/js/jquery.min.js"></script>
    <script type="text/javascript" src="<?= $asset->baseUrl ?>/template/Login/js/jquery.form.js"></script>
    <!-- jQuery RAF (improved animation performance) -->
    <script type="text/javascript" src="<?= $asset->baseUrl ?>/template/Login/js/custom.js"></script>
    <!-- jQuery RAF (improved animation performance) -->
    <script type="text/javascript" src="<?= $asset->baseUrl ?>/template/Login/js/jquery.requestAnimationFrame.min.js"></script>
    <!-- nanoScroller -->
    <script type="text/javascript" src="<?= $asset->baseUrl ?>/template/Login/js/jquery.nanoscroller.min.js"></script>
    <!-- Materialize -->
    <!-- Sortable -->
    <script type="text/javascript" src="<?= $asset->baseUrl ?>/template/Login/js/Sortable.min.js"></script>
    <!-- Main -->
    <script type="text/javascript" src="<?= $asset->baseUrl ?>/template/Login/js/_con.min.js"></script>
    <!-- Google Prettify -->
    <script type="text/javascript" src="<?= $asset->baseUrl ?>/template/Login/js/prettify.js"></script>
    <script type="text/javascript" src="<?= $asset->baseUrl ?>/template/Login/js/validate/jquery.validate.min.js"></script>
    <script type="text/javascript" src="<?= $asset->baseUrl ?>/template/Login/js/validate/messages_vi.min.js"></script>
    <script type="text/javascript" src="<?= $asset->baseUrl ?>/template/Login/js/tooltipster/jquery.tooltipster.js"></script>
<?php
       }
 ?>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
