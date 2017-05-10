<?php

/* @var $this yii\web\View */

$this->title = 'VNPOST.ME - Phần mềm quản lý Vận Đơn PRO';
$asset = \frontend\assets\AppAsset::register($this);
?>

<!--hero section-->

<header class="hero-section"> 
  
  <!--navigation-->
  
  <nav class="navbar navbar-default" data-spy="affix" data-offset-top="450">
    <div class="container">
      <div class="navbar-header"> <a class="navbar-brand" href="#"><img class="logo" alt="logo" src="<?= $asset->baseUrl ?>/template/Home/img/xlogo-white.png.pagespeed.ic.Xfnntp10qd.png"><img class="logo-nav" alt="logo-nav" src="<?= $asset->baseUrl ?>/template/Home/img/xlogo-color.png.pagespeed.ic.I7S7nvMIk4.png"></a> </div>
      <ul class="nav navbar-nav navbar-right">
        <li class="hidden-xs hidden-sm"><a href="#introduce">Giới thiệu</a></li>
        <li class="hidden-xs hidden-sm"><a href="#reviews">Đánh giá</a></li>
        <li class="hidden-xs hidden-sm"><a target="_blank" href="https://www.facebook.com/groups/634524100048245/">Facebook Group</a></li>
        <li class="hidden-xs hidden-sm"><a data-toggle="modal" data-target="#modal-contact-form" href="#">Đăng nhập</a></li>
        <li><a href="/frontend/web/site/signup" class="btn btn-nav">Đăng ký sử dụng</a></li>
        <li class="hidden-md hidden-lg"><a id="toggle"><i class="fa fa-bars fa-2x"></i><i class="fa fa-times fa-2x"></i></a></li>
      </ul>
    </div>
  </nav>
  
  <!--navigation end--> 

  
  <!--welcome message-->
  
  <section class="container text-center welcome-message">
    <div class="row">
      <div class="col-md-12">
        <h1>Phần mềm quản lý bưu kiện tuyệt vời nhất</h1>
        <h2>Sử dụng Vnpost.me công việc kinh doanh của bạn sẽ nhàn hạ hơn trước 10 lần</h2>
        <div class="play-btn-container"><a href="https://www.youtube.com/watch?v=cVRRaRbiSAY" class="play-btn"><i class="fa fa-play fa-2x"></i> </a></div>
        
        <!--hero-image-->
        
        <figure class="hero-image"> 
          
          <!--pointer 1--> 
          <a class="pointer pointer-1" data-toggle="popover" title="Quản lý khách hàng dễ dàng" data-content="Bạn có thể tìm kiếm khách hàng theo tên, SĐT. địa chỉ..."> <span class="plus"><i class="fa fa-plus"></i></span> <span class="minus"><i class="fa fa-minus"></i></span></a> 
          <!--pointer 1 end--> 
          
          <!--pointer 2--> 
          <a class="pointer pointer-2" data-toggle="popover" title="Trạng thái bưu kiện" data-content="Trạng thái bưu kiện trực quan và đặc biệt trạng thái sẽ được tự động cập nhật."> <span class="plus"><i class="fa fa-plus"></i></span> <span class="minus"><i class="fa fa-minus"></i></span></a> 
          <!--pointer 2 end--> 
          
          <!--pointer 3--> 
          <a class="pointer pointer-3" data-toggle="popover" title="Quản lý mã bưu kiện" data-content="Thống kê phân tích tỷ lệ chuyển hoàn hàng tháng, tỉnh nào chuyển hoàn nhiều nhất."> <span class="plus"><i class="fa fa-plus"></i></span> <span class="minus"><i class="fa fa-minus"></i></span></a> 
          <!--pointer 3 end--> 
          
          <img src="<?= $asset->baseUrl ?>/template/Home/img/xhero-img.png.pagespeed.ic.fd8sI5cOi6.png" alt="hero image"> </figure>
        
        <!--hero-image end--> 
        
      </div>
    </div>
  </section>
  
  <!--welcome message end--> 
  
</header>

<!--hero section end--> 



<!--How it works-->

<section class="how-it-works section-spacing features" id="introduce">
  <div class="container">
    <header class="section-header text-center">
      <h2>Chúng tôi giúp được bạn những gì</h2>
      <h3>Và nhiều chức năng khác chờ bạn khám phá</h3>
    </header>
    <div class="row">
      <div class="col-md-11 center-block"> 
        
        <!--step 1-->
        <div class="row">
          <div class="col-md-6 col-md-push-6 text-center"> <img src="<?= $asset->baseUrl ?>/template/Home/img/step-1.svg" alt="step-1"> </div>
          <div class="col-md-6 col-md-pull-6">
            <div class="step-number"><span>1</span></div>
            <h4>Trạng thái bưu kiện</h4>
            <p>Trạng thái của mỗi bưu kiện sẽ được hệ thống tự động cập nhật khi có bất kỳ thay đổi</p>
          </div>
        </div>
        <!--step 1 end--> 
        
        <!--step 2-->
        <div class="row">
          <div class="col-md-6 text-center"> <img src="<?= $asset->baseUrl ?>/template/Home/img/step-2.svg" alt="step-2"> </div>
          <div class="col-md-6">
            <div class="step-number"><span>2</span></div>
            <h4>Giảm tỷ lệ chuyển hoàn</h4>
            <p>Việc chăm sóc khách hàng sẽ đơn giản hơn gấp 10 lần vì đó mà tỷ lệ chuyển hoàn sẽ giảm đi đáng kể</p>
          </div>
        </div>
        <!--step 2 end--> 
        
        <!--step 3-->
        <div class="row">
          <div class="col-md-6 col-md-push-6 text-center"> <img src="<?= $asset->baseUrl ?>/template/Home/img/step-3.svg" alt="step-3"> </div>
          <div class="col-md-6 col-md-pull-6">
            <div class="step-number"><span>3</span></div>
            <h4>Quản lý khách hàng</h4>
            <p>Không cần nhiều phần mềm phức tạp, bạn chỉ cần duy nhất vnpost.me để quản lý chi tiết từng khách hàng.</p>
          </div>
        </div>
        <!--step 3 end--> 
        
        <!--step 4-->
        <div class="row">
          <div class="col-md-6 text-center"> <img src="<?= $asset->baseUrl ?>/template/Home/img/step-4.svg" alt="step-4"> </div>
          <div class="col-md-6">
            <div class="step-number"><span>4</span></div>
            <h4>Phân tích và báo cáo</h4>
            <p>Hàng tháng bạn sẽ biết được tình hình kinh doanh của mình, tỷ lệ chuyển hoàn và tỉnh thành nào có tỷ lệ chuyển hoàn cao, nhân viên nào bán hàng tốt nhất...</p>
          </div>
        </div>
        <!--step 4 end--> 
        
      </div>
      <a href="dang-ky.html" class="btn btn-cta-features">Đăng ký sử dụng ngay</a>
    </div>
  </div>
</section>

<!--How it works end--> 


<!--About us -->

<section class="about-us section-spacing" id="reviews">
  <div class="container">
    <header class="section-header text-center">
      <h2>Phản hồi của khách hàng</h2>
    </header>
    <div class="row text-center team-details">
      <div class="col-md-11 center-block">
        <div class="team-slider owl-carousel owl-theme"> 
          
          <!--Team 1-->
          <div class="item"> <img src="<?= $asset->baseUrl ?>/template/Home/img/avatar/x1_tranthilan.jpg.pagespeed.ic.afgAYMXTyW.jpg" alt="team member" class="img-circle">
            <h5>Hi, i’m <span class="bold">Trần Thị Lan</span><!--<span class="team-position">Designer</span>--></h5>
            <ul class="social">
              <li><a href="#" class="a-facebook"><i class="fa fa-facebook"></i></a></li>
              <li><a href="#" class="a-twitter"><i class="fa fa-twitter"></i></a></li>
              <li><a href="#" class="a-google-plus"><i class="fa fa-google-plus"></i></a></li>
            </ul>
            <p>Ngay lần đầu dùng thử tôi thấy phần mềm có giao diện rất dễ sử dụng. Mình thích nhất chức năng báo cáo của Vnpost.me qua đó mình lắm được chi tiết tình hình kinh doanh của cty</p>
          </div>
          <!--Team 1 end--> 
          
          <!--Team 2-->
          <div class="item"> <img src="<?= $asset->baseUrl ?>/template/Home/img/avatar/x2_nguyenhue.jpg.pagespeed.ic.i2D1HOgB_q.jpg" alt="team member" class="img-circle">
            <h5>Hi, i’m <span class="bold">Nguyễn Huế</span></h5>
            <ul class="social">
              <li><a href="#" class="a-facebook"><i class="fa fa-facebook"></i></a></li>
              <li><a href="#" class="a-twitter"><i class="fa fa-twitter"></i></a></li>
              <li><a href="#" class="a-google-plus"><i class="fa fa-google-plus"></i></a></li>
            </ul>
            <p>Trước đây mình quản lý bằng Exel và viết bill bằng tay không chuyên nghiệp mất khá nhiều thời gian, sau khi chuyển qua dùng vnpost.me mình chăm sóc khách hàng tốt hơn vì thế mà giảm tỷ lệ chuyển hoàn.</p>
          </div>
          <!--Team 2 end--> 
          
          <!--Team 3-->
          <div class="item"> <img src="<?= $asset->baseUrl ?>/template/Home/img/avatar/x3.jpg.pagespeed.ic.8OZ4b21Q5C.jpg" alt="team member" class="img-circle">
            <h5>Hi, i’m <span class="bold">Nguyễn Văn Tiệp</span></h5>
            <ul class="social">
              <li><a href="#" class="a-facebook"><i class="fa fa-facebook"></i></a></li>
              <li><a href="#" class="a-twitter"><i class="fa fa-twitter"></i></a></li>
              <li><a href="#" class="a-google-plus"><i class="fa fa-google-plus"></i></a></li>
            </ul>
            <p>Trước đây do quản lý bằng excel rất mât thời gian vì vậy mà mình chăm sóc khách hàng chưa được tối nên tỷ lệ chuyển hoàn của mình rất cao. từ khi dùng phần mềm của ALT Team mình rất hài lòng.</p>
          </div>
          <!--Team 3 end--> 
          
          <!--Team 4-->
          <div class="item"> <img src="<?= $asset->baseUrl ?>/template/Home/img/avatar/x4_nguyenhuyhoang.jpg.pagespeed.ic._NL-Iamx_b.jpg" alt="team member" class="img-circle">
            <h5>Hi, i’m <span class="bold">Nguyễn Huy Hoàng</span></h5>
            <ul class="social">
              <li><a href="#" class="a-facebook"><i class="fa fa-facebook"></i></a></li>
              <li><a href="#" class="a-twitter"><i class="fa fa-twitter"></i></a></li>
              <li><a href="#" class="a-google-plus"><i class="fa fa-google-plus"></i></a></li>
            </ul>
            <p>Mình thích nhất chức năng báo cáo của Vnpost.me, rất rõ ràng, chi tiết và đầy đủ. mình có thể thống kê được tỷ lệ chuyển hoàn hàng tháng và đặc biệt là có thể xem được tỷ lệ chuyển hoàn ở các tỉnh thành.</p>
          </div>
          <!--Team 4 end--> 
          
          <!--Team 5-->
          <div class="item"> <img src="<?= $asset->baseUrl ?>/template/Home/img/avatar/x5.jpg.pagespeed.ic.KgvJ4kRQDH.jpg" alt="team member" class="img-circle">
            <h5>Hi, i’m <span class="bold">Hoành Văn Vũ</span></h5>
            <ul class="social">
              <li><a href="#" class="a-facebook"><i class="fa fa-facebook"></i></a></li>
              <li><a href="#" class="a-twitter"><i class="fa fa-twitter"></i></a></li>
              <li><a href="#" class="a-google-plus"><i class="fa fa-google-plus"></i></a></li>
            </ul>
            <p>Từ ngày được bạn bè giới thiệu sử dụng phần mềm quản lý bưu kiện Vnpost.Me, công việc của chúng tôi nhàn hơn hẳn. tỷ lệ chuyển hoàn cũng giảm đi đáng kể</p>
          </div>
          <!--Team 5 end--> 
          
        </div>
      </div>
    </div>
  </div>
</section>

<!--About us end--> 

<!--CTA footer-->

<section class="cta-footer section-spacing text-center">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <h2>Tham gia nhóm hỗ trợ trên <em>Facebook</em>.<a target="_blank" href="https://www.facebook.com/groups/634524100048245/" class="btn btn-secondary">Tham gia</a></h2>
      </div>
    </div>
  </div>
</section>

<!--CTA footer end--> 

<!--Trusted clients-->

<section class="section-spacing text-center">
  <div class="container">
    <header class="section-header">
      <h2>Đơn vị chuyển phát hỗ trợ</h2>
      <h3>Chúng tôi sẽ dần hỗ trợ thêm các đơn vị chuyển phát khác</h3>
    </header>
    <div class="row">
      <div class="col-md-10 center-block">
        <div class="row">
          <div class="col-md-12">
            <ul class="row clients-list">
              <li class="col-sm-4">
                <figure> <img src="<?= $asset->baseUrl ?>/template/Home/img/brand/xvnpost.jpg.pagespeed.ic.tmwFaQtM_B.jpg" alt="client"> </figure>
              </li>
              <li class="col-sm-4">
                <figure> <img src="<?= $asset->baseUrl ?>/template/Home/img/brand/xviettelpost.jpeg.pagespeed.ic.z65EKoHx4j.jpg" alt="client"> </figure>
              </li>
              <li class="col-sm-4">
                <figure> <img src="<?= $asset->baseUrl ?>/template/Home/img/brand/xems.jpeg.pagespeed.ic.ZlBN5zcOK6.jpg" alt="client"> </figure>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!--trusted clients end--> 

<div class="modal fade" id="modal-contact-form" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      <div class="modal-body"> 
        
        <!--contact form-->
        
        <div class="contact-form text-center">
          <header class="section-header">
            <h2>Hãy nhập vào username?</h2>
          </header>
          <form class="cta-form cta-light" action="http://vnpost.me/php/contact.php" method="post">
            <div class="form-group">
              <input type="text" name="name" class="contact-name form-control input-lg" placeholder="Username" id="username-login">
            </div>

            <button type="submit" class="btn" id="continue-login">TIẾP THEO</button>
          </form>
        </div>
        
        <!--contact form end-->
        
        <p class="contact-form-success"><i class="fa fa-check"></i><span>Thanks for contacting us!</span> We will get back to you very soon.</p>
      </div>
    </div>
  </div>
</div>


<!--Copyright terms-->

<footer class="copyright-terms">
  <div class="container">
    <div class="row">
      <div class="col-sm-5 col-md-6"> <small> &copy; 2016 Bản quyền thuộc về ALT Team.</small> </div>
      <div class="col-sm-7 col-md-6">
        <ul class="terms-privacy">
          <li>Hotline: <a href="#" data-toggle="modal" data-target="#modal-terms">0911.337.688</a></li>
          <li><a href="#" data-toggle="modal" data-target="#modal-terms">0947.288.115</a></li>
          <li>Email: <a href="mailto:support@vnpost.me" data-toggle="modal" data-target="#modal-terms">support@vnpost.me</a></li>
        </ul>
      </div>
    </div>
  </div>
</footer>

<!--Copyright terms end--> 






  

