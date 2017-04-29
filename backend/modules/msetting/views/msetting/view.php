<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\Msetting */

$this->title = $model->mst_key;
$this->params['breadcrumbs'][] = ['label' => 'Msettings', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="msetting-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->mst_id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->mst_id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'mst_id',
            'mst_kubun',
            'mst_key',
            'mst_id_parent',
            'mst_value',
            'mst_display_value',
            [
                'attribute' => 'mst_content_value',
                'format' => 'raw',
            ],
            'short_content',
            'create_by',
            'create_date',
            'update_by',
            'update_date',
            'desc:ntext',
            [
                'attribute' => 'image',
                'value' => Yii::$app->params['webDomain'].'uploads/setting/'.$model->image,
                'format' => ['image',['width'=>'100','height'=>'100']],
            ],
        ],
    ]) ?>

</div>
