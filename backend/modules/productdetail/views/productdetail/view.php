<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\ProductDetailsExt */

$this->title = $model->prd_detail_id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Product Details Exts'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="product-details-ext-view">

    

    <p>
        <?= Html::a(Yii::t('app', 'Update'), ['update', 'id' => $model->prd_detail_id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a(Yii::t('app', 'Delete'), ['delete', 'id' => $model->prd_detail_id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'prd_detail_id',
            'product_type',
            'product_num_extend',
            'pd_trade_price',
            'pd_trade_price_tax',
            'pd_sales_price',
            'product_id',
            'product_detail',
            'pd_trade_direct_price',
            'save_amazon',
            'save_yahooshop',
            'save_rakuten',
            'product_detail_num',
            'product_detail_jan',
            'regist_time',
            'amazon_transfer_time',
            'yahooshop_transfer_time',
            'rakuten_transfer_time',
            'priceformula',
        ],
    ]) ?>

</div>
