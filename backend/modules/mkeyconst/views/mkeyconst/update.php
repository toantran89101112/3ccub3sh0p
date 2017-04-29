<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\MKeyConst */

$this->title = 'Sửa key thuộc tính: ' . ' ' . $model->key_id;
$this->params['breadcrumbs'][] = ['label' => 'Key thuộc tính', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->key_id, 'url' => ['view', 'id' => $model->key_id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="mkey-const-update">
    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
