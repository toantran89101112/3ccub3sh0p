<?php

    use yii\helpers\Html;
    use yii\helpers\ArrayHelper;
    use yii\grid\GridView;
    use common\models\User;

    /* @var $this yii\web\View */
    /* @var $searchModel common\models\ProductsextSearch */
    /* @var $dataProvider yii\data\ActiveDataProvider */

    $this->title = Yii::t('app', 'Quản lý Sản phẩm');
    $this->params['breadcrumbs'][] = $this->title;
?>
<div class="products-ext-index">

    
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            [
                'attribute' => 'user_id',
                //'format' => ['image',['width'=>'100','height'=>'100','data-fancybox-group'=>'gallery', 'href' => '#', 'class' => 'fancybox']],
                'value'=>function($data) {
                    return $data->user->username;
                },
                'filter'=> ArrayHelper::map(User::find()->where(['OR',['<>','permission','admin'],['IS','permission',null]])->asArray()->all(), 'id', 'username'),

            ],
            [
                'attribute' => 'product_name',
                //'format' => ['image',['width'=>'100','height'=>'100','data-fancybox-group'=>'gallery', 'href' => '#', 'class' => 'fancybox']],
                'value'=>function($data) {
                    return Html::a($data->product_name, ['/productdetail', 'ProductDetailsExtSearch[product_id]' => $data->product_id]) ;
                },
                'format' => 'raw',
            ],
            //'product_id',
            //'product_name',
            'description_text:ntext',
            //'introduce:ntext',
            //'product_num',
            //'product_type',
            // 'product_brand',
            // 'product_maker',
            // 'product_supplier',
            // 'product_supplier_url:url',
            // 'product_img_search',
            // 'img_1',
            // 'img_2',
            // 'img_3',
            // 'img_4',
            // 'img_5',
            // 'img_6',
            // 'img_7',
            // 'img_8',
            // 'img_9',
            // 'img_10',
            // 'delivery_time',
            // 'transport_fee',
            // 'manufacturer_directly',
            // 'cod',
            // 'extend_warranty',
            // 'category',
            // 'fix_category',
            // 'description_text:ntext',
            // 'description_html:ntext',
            // 'time_get',
            // 'get_site',
            // 'goods_lots_sd',
            // 'size_and_capacity:ntext',
            // 'standard:ntext',
            // 'note:ntext',
            // 'terms_of_delivery_netsea:ntext',
            // 'delivery_order_netsea:ntext',
            // 'payment_methods_netsea',
            // 'regist_update_time_netsea',
            // 'totalimg',
            // 'pd_trade_direct_price',
            // 'pd_trade_price',
            // 'user_id',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
