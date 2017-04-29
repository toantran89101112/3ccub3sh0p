<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\module\useradmin\models\Useradmin */

$this->title = 'Cập nhật người dùng: ' . ' ' . $model->id.'.'.$model->username;
$this->params['breadcrumbs'][] = ['label' => 'Người dùng hệ thống', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id.'.'.$model->username, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="useradmin-update">

    <!--<h1><?= Html::encode($this->title) ?></h1>-->

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
