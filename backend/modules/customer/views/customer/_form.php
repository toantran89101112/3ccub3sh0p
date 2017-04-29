<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Customer */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="customer-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'customer_code')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'customer_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'customer_email')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'customer_mobi')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'customer_login_password')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'customer_avatar')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'customer_birthday')->textInput() ?>

    <?= $form->field($model, 'customer_gender')->textInput() ?>

    <?= $form->field($model, 'customer_register_date')->textInput() ?>

    <?= $form->field($model, 'customer_last_active')->textInput() ?>

    <?= $form->field($model, 'customer_ip_connect_api')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'customer_accesstoken')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
