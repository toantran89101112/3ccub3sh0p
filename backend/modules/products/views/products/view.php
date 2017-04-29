<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\ProductsExt */

$this->title = $model->product_id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Products Exts'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="products-ext-view">

    

    <p>
        <?= Html::a(Yii::t('app', 'Update'), ['update', 'id' => $model->product_id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a(Yii::t('app', 'Delete'), ['delete', 'id' => $model->product_id], [
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
            'product_id',
            'product_name',
            'introduce:ntext',
            'product_num',
            'product_type',
            'product_brand',
            'product_maker',
            'product_supplier',
            'product_supplier_url:url',
            'product_img_search',
            'img_1',
            'img_2',
            'img_3',
            'img_4',
            'img_5',
            'img_6',
            'img_7',
            'img_8',
            'img_9',
            'img_10',
            'delivery_time',
            'transport_fee',
            'manufacturer_directly',
            'cod',
            'extend_warranty',
            'category',
            'fix_category',
            'description_text:ntext',
            'description_html:ntext',
            'time_get',
            'get_site',
            'goods_lots_sd',
            'size_and_capacity:ntext',
            'standard:ntext',
            'note:ntext',
            'terms_of_delivery_netsea:ntext',
            'delivery_order_netsea:ntext',
            'payment_methods_netsea',
            'regist_update_time_netsea',
            'totalimg',
            'pd_trade_direct_price',
            'pd_trade_price',
            'user_id',
        ],
    ]) ?>

</div>
