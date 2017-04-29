<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\ProductDetailsExt */

$this->title = Yii::t('app', 'Create Product Details Ext');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Product Details Exts'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="product-details-ext-create">

    

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
