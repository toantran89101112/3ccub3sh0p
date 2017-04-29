<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\MKeyConst */

$this->title = $model->key_id;
$this->params['breadcrumbs'][] = ['label' => 'Key thuộc tính', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="mkey-const-view">
    <p>
        <?= Html::a('Sửa', ['update', 'id' => $model->key_id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Xóa', ['delete', 'id' => $model->key_id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Bạn có muốn xóa thuộc tính này?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'key_id',
            'key_value',
            'key_name',
            'key_desc:ntext',
            //'create_time',
            //'update_time',
        ],
    ]) ?>

</div>
