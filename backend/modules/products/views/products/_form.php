<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\ProductsExt */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="products-ext-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'product_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'introduce')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'product_num')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'product_type')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'product_brand')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'product_maker')->textInput() ?>

    <?= $form->field($model, 'product_supplier')->textInput() ?>

    <?= $form->field($model, 'product_supplier_url')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'product_img_search')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'img_1')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'img_2')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'img_3')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'img_4')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'img_5')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'img_6')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'img_7')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'img_8')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'img_9')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'img_10')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'delivery_time')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'transport_fee')->textInput() ?>

    <?= $form->field($model, 'manufacturer_directly')->textInput() ?>

    <?= $form->field($model, 'cod')->textInput() ?>

    <?= $form->field($model, 'extend_warranty')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'category')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'fix_category')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'description_text')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'description_html')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'time_get')->textInput() ?>

    <?= $form->field($model, 'get_site')->textInput() ?>

    <?= $form->field($model, 'goods_lots_sd')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'size_and_capacity')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'standard')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'note')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'terms_of_delivery_netsea')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'delivery_order_netsea')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'payment_methods_netsea')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'regist_update_time_netsea')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'totalimg')->textInput() ?>

    <?= $form->field($model, 'pd_trade_direct_price')->textInput() ?>

    <?= $form->field($model, 'pd_trade_price')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
