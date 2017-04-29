<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Msetting */

$this->title = 'Cập Nhật Thiết Lập: ' . ' ' . $model->mst_key;
$this->params['breadcrumbs'][] = ['label' => 'Msettings', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->mst_id, 'url' => ['view', 'id' => $model->mst_id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="msetting-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
