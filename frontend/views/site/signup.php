<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \frontend\models\SignupForm */

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
$asset = \frontend\assets\AppAsset::register($this);

$this->title = 'ĐĂNG KÝ - Phần mềm quản lý Bưu Kiện';
$this->params['breadcrumbs'][] = $this->title;
?>
<div id="thongbao"></div>
    <section id="sign-in">
        <!-- Background Bubbles -->
        <!-- /Background Bubbles -->
        <!-- Sign In Form -->
        <div class="col-xs-9 mobile-hidden">
            <div class="container">
                <div class="textintro">
                    Phần mềm quản lý vận đơn tốt nhất
                    <p>Hotline hỗ trợ 24/7: 0911.337.688 - 0947.288.115</p>

                    <a href="/frontend/web" class="buttom">Trang chủ</a>
                </div>
            </div>
        </div>

        <div class="col-xs-3">        
            <form id="form-register" method="POST" accept-charset="utf-8" style="max-width:25%">
                <div class="row links">
                    <div class="col s6 logo" style="padding-left: 27px;"><img src="<?= $asset->baseUrl ?>/template/Login/images/logo-white.png" alt=""></div>
                </div>

                <h5 style="text-transform: uppercase;padding: 20px 30px;text-align: center;background: #00b8cf;color: #fff;">Đăng ký sử dụng phần mềm</h5>
                <div class="card-panel clearfix">
                    <!-- /Social Sign Up -->
                    <!-- Username -->
                    <div class="input-field"><i class="fa fa-globe prefix"></i>
                        <input name="subdomain" maxlength="30" minlength="2" id="subdomain" type="text" class="validate" style="padding-right: 70px!important;width: calc(100% - 8.2rem);" required><span style="    float: right;
    position: absolute;
    top: 9.2px;
    right: 0;
    border-radius: 3px;">.vnpost.me</span>
                        <label for="subdomain" class="active">Username <i class="fa fa-question-circle tooltip" title="<div style='max-width: 300px;'>Sau này địa chỉ truy cập vào phần mềm sẽ có dạng<br><br>http://username.vnpost.me/<br><br>Username chỉ bao gồm các ký tự từ A-Z và 0-9, không bao gồm các ký tự đặc biệt. Và có độ dài không quá 30 ký tự</div>" style="font-size: 14px;margin-top: -2px;margin-left: 5px;"></i></label>
                    </div>
                    <div class="input-field"><i class="fa fa-shopping-bag prefix"></i>
                        <input name="shopname" id="shopname" type="text" class="validate" required>
                        <label for="shopname" class="active">Tên bạn or Tên Shop</label>
                    </div>
                    <div class="input-field"><i class="fa fa-envelope-o prefix"></i>
                        <input name="email" id="email" type="email" class="validate" required>
                        <label for="email" class="active">Email  <i class="fa fa-question-circle tooltip" title="<div style='max-width: 300px;'>Sẽ dùng email này để đăng nhập vào phần mềm</div>" style="font-size: 14px;margin-top: -2px;margin-left: 5px;"></i></label>
                    </div>
                    <div class="input-field"><i class="fa fa-phone-square prefix"></i>
                        <input name="telephone" id="telephone" type="text" class="validate" required>
                        <label for="telephone" class="active">Điện thoại</label>
                    </div>
                    <div class="input-field"><i class="fa fa-location-arrow prefix"></i>
                        <input name="address" id="address" type="text" class="validate" required>
                        <label for="address" class="active">Địa chỉ</label>
                    </div>
                    <div class="input-field"><i class="fa fa-unlock-alt prefix"></i>
                        <input name="password" id="password" type="password" minlength="8" class="validate" required>
                        <label for="password" class="active">Mật khẩu</label>
                    </div>
                    <div class="input-field"><i class="fa fa-unlock-alt prefix"></i>
                        <input name="confirm_password" id="confirm_password" minlength="8" type="password" class="validate" required>
                        <label for="confirm_password" class="active">Nhập lại mật khẩu</label>
                    </div>
                    
                    <button id="btn-submit" class="waves-effect waves-light btn-large z-depth-0 z-depth-1-hover"><img id="loading" style="display:none;" src="<?= $asset->baseUrl ?>/template/Login/images/loading.gif" alt="">Đăng ký</button>
                </div>
                <div class="contact">
                    <img src="<?= $asset->baseUrl ?>/template/Login/images/contact.png" alt="">
                </div>
            </form>
        </div>
        <!-- /Sign In Form -->
    </section>





