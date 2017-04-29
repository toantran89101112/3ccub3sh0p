<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\module\useradmin\models\Useradmin */

$this->title = 'Tạo người dùng';
$this->params['breadcrumbs'][] = ['label' => 'Người dùng hệ thống', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="useradmin-create">

    <!--<h1><?= Html::encode($this->title) ?></h1>-->

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
