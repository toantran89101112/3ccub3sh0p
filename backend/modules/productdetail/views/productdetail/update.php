<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\ProductDetailsExt */

$this->title = Yii::t('app', 'Update {modelClass}: ', [
    'modelClass' => 'Product Details Ext',
]) . ' ' . $model->prd_detail_id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Product Details Exts'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->prd_detail_id, 'url' => ['view', 'id' => $model->prd_detail_id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="product-details-ext-update">

    

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
