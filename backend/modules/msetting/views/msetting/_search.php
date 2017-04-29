<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\MsettingSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="msetting-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'mst_id') ?>

    <?= $form->field($model, 'mst_kubun') ?>

    <?= $form->field($model, 'mst_key') ?>

    <?= $form->field($model, 'mst_id_parent') ?>

    <?= $form->field($model, 'mst_value') ?>

    <?php // echo $form->field($model, 'mst_display_value') ?>

    <?php // echo $form->field($model, 'mst_content_value') ?>

    <?php // echo $form->field($model, 'create_by') ?>

    <?php // echo $form->field($model, 'create_date') ?>

    <?php // echo $form->field($model, 'update_by') ?>

    <?php // echo $form->field($model, 'update_date') ?>

    <?php // echo $form->field($model, 'desc') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
