<?php
    use yii\helpers\Html;
    use yii\widgets\ActiveForm;
?>
<div class="" id ="code">
    <div class="col-md-12">
        <?php
            $form = ActiveForm::begin([
                'id' => 'savedata',
                'options' => ['class' => 'form-horizontal'],
            ])
        ?>
        <legend>Form code</legend>
        <div class="form-group">
            <label class="col-md-4 control-label" for="textinput">Code</label>
            <div class="col-md-6">
                <?= $form->field($model, 'bill_number')->label('') ?>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label" for="textinput">Name</label>
            <div class="col-md-6">
                <?= $form->field($model, 'receiver')->label('') ?>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label" for="color">Address</label>
            <div class="col-md-6">
                <?= $form->field($model, 'receiver_adress')->label('') ?>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label" for="color">Phone Number</label>
            <div class="col-md-6">
                <?= $form->field($model, 'receiver_phone')->label('') ?>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label" for="color">Money</label>
            <div class="col-md-6">
                <?= $form->field($model, 'bill_money')->label('') ?>
            </div>
        </div>
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
        <div class="form-group">
            <div class="col-md-4"></div>
            <div class="col-md-8">
                <button type="submit" class="btn btn-success">Save</button>
                <?= Html::a('Back', ['/savedata/index'], ['class'=>'btn btn-primary']) ?>
            </div>
        </div>
        <?php ActiveForm::end() ?>
    </div>
</div>
