<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\ProductsExt */

$this->title = Yii::t('app', 'Create Products Ext');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Products Exts'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="products-ext-create">

    

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
