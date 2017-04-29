<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\MsettingSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Thiết Lập';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="msetting-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Thêm Thiết Lập', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            //'mst_id',
            //'mst_kubun',
            'mst_key',
            //'mst_id_parent',
             [
                'attribute'=>'mst_id_parent',
                'content'=>function($data){
                    if(!empty($data->mst_id_parent))
                        {
                            $parent = common\models\MSetting::Parent($data->mst_id_parent);
                            return $parent->mst_display_value;
                        }
                    else{
                        return "không có";
                    }
                },
                'filter' => false
            ],

            //'mst_value',
            // 'mst_display_value',
            // 'mst_content_value:ntext',
            // 'create_by',
            // 'create_date',
            // 'update_by',
            // 'update_date',
            //'desc:ntext',
            [
                'attribute' => 'desc',
                'format' => 'raw',
                'label' => 'Mô tả',
            ],

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
