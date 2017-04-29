<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\MKeyConstSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Key thuộc tính';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="mkey-const-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Thêm mới Key thuộc tính', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            //'key_id',
            'key_value',
            'key_name',
            'key_desc:ntext',
            //'create_time',
            // 'update_time',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
