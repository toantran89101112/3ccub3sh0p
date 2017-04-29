<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\CustomerSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="customer-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'customer_id') ?>

    <?= $form->field($model, 'customer_code') ?>

    <?= $form->field($model, 'customer_name') ?>

    <?= $form->field($model, 'customer_email') ?>

    <?= $form->field($model, 'customer_mobi') ?>

    <?php // echo $form->field($model, 'customer_login_password') ?>

    <?php // echo $form->field($model, 'customer_avatar') ?>

    <?php // echo $form->field($model, 'customer_birthday') ?>

    <?php // echo $form->field($model, 'customer_gender') ?>

    <?php // echo $form->field($model, 'customer_register_date') ?>

    <?php // echo $form->field($model, 'customer_last_active') ?>

    <?php // echo $form->field($model, 'customer_ip_connect_api') ?>

    <?php // echo $form->field($model, 'customer_accesstoken') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
