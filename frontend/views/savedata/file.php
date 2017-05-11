<?php
    use yii\helpers\Html;
    use yii\widgets\ActiveForm;
?>
<div class="row" id = "file">
    <?php
        $form = ActiveForm::begin([
            'id' => 'saveupload',
            'options' => ['class' => 'form-horizontal','enctype' => 'multipart/form-data'],
        ])
    ?>
    <div class="form-group">
        <label class="col-md-4 control-label" >Đơn Vị Vận Chuyển</label>
        <div class="col-md-6">
            <?php echo $form->field($model, 'unit_transport')->dropDownList(yii::$app->params['FRONTEND_LIST_UNIT'])->label(''); ?>
        </div>
    </div>
    <div class="form-group">
        <label class="col-md-4 control-label" >Vận chuyển bằng</label>
        <div class="col-md-6">
            <?php echo $form->field($model, 'method_transport')->dropDownList(yii::$app->params['FRONTEND_LIST_METHOD'])->label(''); ?>
        </div>
    </div>
    <?php
        echo $form->field($model, 'file')->fileInput() ;
    ?>
    <button type="submit" class="btn btn-success">Save</button>
    <?= Html::a('Back', ['/savedata/index'], ['class'=>'btn btn-primary']) ?>
    <?php ActiveForm::end() ?>
</div>