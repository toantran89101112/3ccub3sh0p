<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\ProductDetailsExt */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="product-details-ext-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'product_type')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'product_num_extend')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'pd_trade_price')->textInput() ?>

    <?= $form->field($model, 'pd_trade_price_tax')->textInput() ?>

    <?= $form->field($model, 'pd_sales_price')->textInput() ?>

    <?= $form->field($model, 'product_id')->textInput() ?>

    <?= $form->field($model, 'product_detail')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'pd_trade_direct_price')->textInput() ?>

    <?= $form->field($model, 'save_amazon')->textInput() ?>

    <?= $form->field($model, 'save_yahooshop')->textInput() ?>

    <?= $form->field($model, 'save_rakuten')->textInput() ?>

    <?= $form->field($model, 'product_detail_num')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'product_detail_jan')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'regist_time')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'amazon_transfer_time')->textInput() ?>

    <?= $form->field($model, 'yahooshop_transfer_time')->textInput() ?>

    <?= $form->field($model, 'rakuten_transfer_time')->textInput() ?>

    <?= $form->field($model, 'priceformula')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
