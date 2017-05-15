<?php
    use yii\helpers\Html;
    use yii\widgets\ActiveForm;
?>
<div class="" id = "file">
<div class="col-md-12">
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
    
        <label class="col-md-4 control-label" >Vận chuyển bằng</label>
        <div class="col-md-6">
            <?php echo $form->field($model, 'method_transport')->dropDownList(yii::$app->params['FRONTEND_LIST_METHOD'])->label(''); ?>
        </div>
        <label class="col-md-4 control-label" ></label>
        <div class="col-md-6">
            <?php
                echo $form->field($model, 'file')->fileInput() ;
            ?>
            <button type="submit" class="btn btn-success">Save</button>
            <?= Html::a('Back', ['/savedata/index'], ['class'=>'btn btn-primary']) ?>
        </div>
    </div>
    <?php ActiveForm::end() ?>
</div>
</div>