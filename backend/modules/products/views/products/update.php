<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\ProductsExt */

$this->title = Yii::t('app', 'Update {modelClass}: ', [
    'modelClass' => 'Products Ext',
]) . ' ' . $model->product_id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Products Exts'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->product_id, 'url' => ['view', 'id' => $model->product_id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="products-ext-update">

    

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
