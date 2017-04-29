<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use common\widgets\CKEditor;
use common\models\MSetting;
use yii\helpers\ArrayHelper;
/* @var $this yii\web\View */
/* @var $model common\models\Msetting */
/* @var $form yii\widgets\ActiveForm */
use iutbay\yii2kcfinder\KCFinder;
?>
<?php 
$baseUrlSettingUpload = Yii::$app->params['webDomain'].'uploads/setting/';
?>
<div class="msetting-form">

    <?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]); ?>

    <?= $form->field($model, 'mst_display_value')->textInput(['maxlength' => true]) ?>
    
    <!--<?= $form->field($model, 'mst_kubun')->dropDownList(['0' => 'Tất Cả','1' => 'Android','2'=>'Ios']) ?>-->

    <?= $form->field($model, 'mst_key')->textInput(['maxlength' => true]) ?>
    
    <?= $form->field($model, 'mst_id_parent')->dropDownList(ArrayHelper::map(MSetting::find()->where(['mst_content_value'=>''])->orWhere(['mst_content_value'=>null])->all(), 'mst_value', 'mst_display_value'),['prompt' => ' -- Danh Mục Gốc --']) ?>
    
    <?= $form->field($model, 'mst_value')->textInput(['readonly'=>true]) ?>

    <?= $form->field($model, 'mst_content_value')->widget(CKEditor::className(), [
        'options' => ['rows' => 6],
        'preset' => 'full'
    ]) ?>
    <?= $form->field($model, 'short_content')->textInput(['maxlength' => true]) ?>
    <?= $form->field($model, 'create_by')->textInput(['readonly'=>true]) ?>

    <?= $form->field($model, 'create_date')->textInput(['readonly'=>true]) ?>

    <?= $form->field($model, 'update_by')->textInput(['readonly'=>true]) ?>

    <?= $form->field($model, 'update_date')->textInput(['readonly'=>true]) ?>

    <?= $form->field($model, 'desc')->widget(CKEditor::className(), [
        'options' => ['rows' => 6],
        'preset' => 'full'
    ]) ?>


    <?php 
        $srcCutImage_A = "";
        if(!empty($model->image))
        {
            $srcCutImage_A = $baseUrlSettingUpload.$model->image;
        }
    ?>
    
    <img src="<?=$srcCutImage_A?>" id='cutImage_A' style="display: <?php  echo !empty($model->image)?'block':'none' ?>;width:100px">
    <?= $form->field($model, 'image')->fileInput() ?>



    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
