<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\CustomerSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Customers';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="customer-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Customer', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'customer_id',
            'customer_code',
            'customer_name',
            'customer_email:email',
            'customer_mobi',
            // 'customer_login_password',
            // 'customer_avatar',
            // 'customer_birthday',
            // 'customer_gender',
            // 'customer_register_date',
            // 'customer_last_active',
            // 'customer_ip_connect_api',
            // 'customer_accesstoken',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
