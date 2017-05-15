<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \frontend\models\SignupForm */

use yii\helpers\Html;
use yii\helpers\Url;
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
            <!--<form id="form-register" method="POST" accept-charset="utf-8" style="max-width:25%">-->
            <?php $form = ActiveForm::begin([
                   'action' => Url::to(['account/create']),            
                    'options' => ['class' => 'login_form','style'=>'max-width:25%'],
                    'fieldConfig' => [
                        'template' => "<div class='row'>{label}{input}{error}</div>"
                    ]
                ])
            ?>
                <div class="row links">
                    <div class="col s6 logo" style="padding-left: 27px;"><img src="<?= $asset->baseUrl ?>/template/Login/images/logo-white.png" alt=""></div>
                </div>

                <h5 style="text-transform: uppercase;padding: 20px 30px;text-align: center;background: #00b8cf;color: #fff;">Đăng ký sử dụng phần mềm</h5>
                <div class="card-panel clearfix">
                    <!-- /Social Sign Up -->
                   
                    <?= $form->field($model, 'username',[
                    'template' => "<div >{label}{input}{error}</div>"
                ])->textInput() ?>
                 <?= $form->field($model, 'displayname',[
                    'template' => "<div >{label}{input}{error}</div>"
                ])->textInput() ?>
                <?= $form->field($model, 'email',[
                    'template' => "<div >{label}{input}{error}</div>"
                ])->textInput() ?>
                 <?= $form->field($model, 'phone',[
                    'template' => "<div >{label}{input}{error}</div>"
                ])->textInput() ?> 
                  <?= $form->field($model, 'adress',[
                    'template' => "<div >{label}{input}{error}</div>"
                ])->textInput() ?> 
                <?= $form->field($model, 'password_hash',[
                    'template' => "<div >{label}{input}{error}</div>"
                ])->passwordInput() ?>   
                 <?= $form->field($model, 'confirmpassword',[
                  'template' => "<div >{label}{input}{error}</div>"
                 ])->passwordInput() ?>
                   
                   <?=Html::submitInput(Yii::t('app', 'Đăng Ký'), ['class'=>'btn btn-info', 'id' => 'btnReg']) ?>
                </div>
                <div class="contact">
                    <img src="<?= $asset->baseUrl ?>/template/Login/images/contact.png" alt="">
                </div>
                 <?php ActiveForm::end(); ?>
           <!-- </form>-->
            
            
            
            
            
        </div>
        <!-- /Sign In Form -->
    </section>



