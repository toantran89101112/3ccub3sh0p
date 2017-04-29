<style>
    /*.content-wrapper, .right-side
    {
        background-image: url('<?php //echo Yii::$app->params['webDomain'].'/backend/web/images/bg.jpg' ?>');
        background-repeat:no-repeat;
        background-size: cover;
    }*/
    .content-header>h1{
      color: #fff;
    }
</style>
<div class="row">
            
            <div class="col-lg-3 col-xs-6">
              <div class="small-box bg-yellow">
                <div class="inner">
                  <h3><?=isset($totaluser)?$totaluser:'0'?></h3>
                  <p>User hệ thống</p>
                </div>
                <div class="icon">
                  <i class="ion fa fa-user"></i>
                </div>
                <a class="small-box-footer" href="<?=\Yii::$app->urlManager->createUrl(['admin'])?>">Xem <i class="fa fa-arrow-circle-right"></i></a>
              </div>
            </div><!-- ./col -->

            <div class="col-lg-3 col-xs-6">
              <div class="small-box bg-red">
                <div class="inner">
                  <h3>Thiết lập</h3>
                  <p>Settings</p>
                </div>
                <div class="icon">
                  <i class="ion fa fa-cogs"></i>
                </div>
                <a class="small-box-footer" href="<?=\Yii::$app->urlManager->createUrl(['msetting'])?>">Xem <i class="fa fa-arrow-circle-right"></i></a>
              </div>
            </div>
            <!-- ./col -->
          </div>