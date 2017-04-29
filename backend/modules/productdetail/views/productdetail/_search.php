<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\ProductDetailsExtSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="product-details-ext-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'prd_detail_id') ?>

    <?= $form->field($model, 'product_type') ?>

    <?= $form->field($model, 'product_num_extend') ?>

    <?= $form->field($model, 'pd_trade_price') ?>

    <?= $form->field($model, 'pd_trade_price_tax') ?>

    <?php // echo $form->field($model, 'pd_sales_price') ?>

    <?php // echo $form->field($model, 'product_id') ?>

    <?php // echo $form->field($model, 'product_detail') ?>

    <?php // echo $form->field($model, 'pd_trade_direct_price') ?>

    <?php // echo $form->field($model, 'save_amazon') ?>

    <?php // echo $form->field($model, 'save_yahooshop') ?>

    <?php // echo $form->field($model, 'save_rakuten') ?>

    <?php // echo $form->field($model, 'product_detail_num') ?>

    <?php // echo $form->field($model, 'product_detail_jan') ?>

    <?php // echo $form->field($model, 'regist_time') ?>

    <?php // echo $form->field($model, 'amazon_transfer_time') ?>

    <?php // echo $form->field($model, 'yahooshop_transfer_time') ?>

    <?php // echo $form->field($model, 'rakuten_transfer_time') ?>

    <?php // echo $form->field($model, 'priceformula') ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('app', 'Reset'), ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
