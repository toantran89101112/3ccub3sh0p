<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\module\useradmin\models\UseradminSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Người dùng hệ thống';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="useradmin-index">

    <!--<h1><?= Html::encode($this->title) ?></h1>-->
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Tạo người dùng', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            //'id',
            'username',
            //'auth_key',
            //'password_hash',
            //'password_reset_token',
            'email:email',
            // 'status',
            // 'created_at',
            // 'updated_at',
            // 'new_password',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
