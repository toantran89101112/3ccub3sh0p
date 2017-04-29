<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\MKeyConst */

$this->title = 'Thêm mới';
$this->params['breadcrumbs'][] = ['label' => 'Key thuộc tính', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="mkey-const-create">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
