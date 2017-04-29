<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\MKeyConst */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="mkey-const-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'key_value')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'key_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'key_desc')->textarea(['rows' => 6]) ?>


    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Thêm mới' : 'Sửa', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
