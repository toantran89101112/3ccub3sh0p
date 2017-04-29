<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\ProductDetailsExtSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Chi tiết sản phẩm');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="product-details-ext-index">

    
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            'product_detail',
            //'prd_detail_id',
            'product_type',
            'product_num_extend',
            'pd_trade_price',
            'pd_trade_price_tax',
            // 'pd_sales_price',
            // 'pd_trade_direct_price', 
            [
                'attribute' => 'save_amazon',
                'value'=>function($data) {
                    if ((int)$data->save_amazon == 0)   
                        return 'Chưa đồng bộ';
                    else
                        return 'Đã đồng bộ';
                },
                'filter'=>array("0"=>"Chưa đồng bộ","1"=>"Đã đồng bộ"),

            ],
            [
                'attribute' => 'save_yahooshop',
                'value'=>function($data) {
                    if ((int)$data->save_yahooshop == 0)   
                        return 'Chưa đồng bộ';
                    else
                        return 'Đã đồng bộ';
                },
                'filter'=>array("0"=>"Chưa đồng bộ","1"=>"Đã đồng bộ"),

            ],
            [
                'attribute' => 'save_rakuten',
                'value'=>function($data) {
                    if ((int)$data->save_rakuten == 0)   
                        return 'Chưa đồng bộ';
                    else
                        return 'Đã đồng bộ';
                },
                'filter'=>array("0"=>"Chưa đồng bộ","1"=>"Đã đồng bộ"),

            ],
            // 'product_detail_num',
            // 'product_detail_jan',
            // 'regist_time',
            // 'amazon_transfer_time',
            // 'yahooshop_transfer_time',
            // 'rakuten_transfer_time',
            // 'priceformula',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
