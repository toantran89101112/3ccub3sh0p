<?php
    use yii\helpers\Html;
    use yii\widgets\ActiveForm;
?>
<div class="container">
    <form id="mycheck">
        <div class="row">
            <?= Html::a('Xem Theo Mã', ['/savedata/code'], ['class'=>'btn btn-primary']) ?>
            <?= Html::a('Xem Theo File', ['/savedata/file'], ['class'=>'btn btn-primary']) ?>
        </div>
    </form>
</div>
<div id="watchcode">
    
</div>