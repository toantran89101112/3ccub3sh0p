<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\Msetting */

$this->title = 'Thêm Thiết Lập';
$this->params['breadcrumbs'][] = ['label' => 'Msettings', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="msetting-create">


    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
