<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\ProductsextSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="products-ext-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'product_id') ?>

    <?= $form->field($model, 'product_name') ?>

    <?= $form->field($model, 'introduce') ?>

    <?= $form->field($model, 'product_num') ?>

    <?= $form->field($model, 'product_type') ?>

    <?php // echo $form->field($model, 'product_brand') ?>

    <?php // echo $form->field($model, 'product_maker') ?>

    <?php // echo $form->field($model, 'product_supplier') ?>

    <?php // echo $form->field($model, 'product_supplier_url') ?>

    <?php // echo $form->field($model, 'product_img_search') ?>

    <?php // echo $form->field($model, 'img_1') ?>

    <?php // echo $form->field($model, 'img_2') ?>

    <?php // echo $form->field($model, 'img_3') ?>

    <?php // echo $form->field($model, 'img_4') ?>

    <?php // echo $form->field($model, 'img_5') ?>

    <?php // echo $form->field($model, 'img_6') ?>

    <?php // echo $form->field($model, 'img_7') ?>

    <?php // echo $form->field($model, 'img_8') ?>

    <?php // echo $form->field($model, 'img_9') ?>

    <?php // echo $form->field($model, 'img_10') ?>

    <?php // echo $form->field($model, 'delivery_time') ?>

    <?php // echo $form->field($model, 'transport_fee') ?>

    <?php // echo $form->field($model, 'manufacturer_directly') ?>

    <?php // echo $form->field($model, 'cod') ?>

    <?php // echo $form->field($model, 'extend_warranty') ?>

    <?php // echo $form->field($model, 'category') ?>

    <?php // echo $form->field($model, 'fix_category') ?>

    <?php // echo $form->field($model, 'description_text') ?>

    <?php // echo $form->field($model, 'description_html') ?>

    <?php // echo $form->field($model, 'time_get') ?>

    <?php // echo $form->field($model, 'get_site') ?>

    <?php // echo $form->field($model, 'goods_lots_sd') ?>

    <?php // echo $form->field($model, 'size_and_capacity') ?>

    <?php // echo $form->field($model, 'standard') ?>

    <?php // echo $form->field($model, 'note') ?>

    <?php // echo $form->field($model, 'terms_of_delivery_netsea') ?>

    <?php // echo $form->field($model, 'delivery_order_netsea') ?>

    <?php // echo $form->field($model, 'payment_methods_netsea') ?>

    <?php // echo $form->field($model, 'regist_update_time_netsea') ?>

    <?php // echo $form->field($model, 'totalimg') ?>

    <?php // echo $form->field($model, 'pd_trade_direct_price') ?>

    <?php // echo $form->field($model, 'pd_trade_price') ?>

    <?php // echo $form->field($model, 'user_id') ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('app', 'Reset'), ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
