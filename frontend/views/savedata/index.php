<?php
    use yii\helpers\Html;
    use yii\widgets\ActiveForm;
    use yii\web\View;
    use yii\helpers\Url;
    $url_code = Url::to(['/savedata/code']);
    $url_file = Url::to(['/savedata/file']);
?>
<div class="container">
    <form id="mycheck">
        <div class="row">
            <?= Html::button('Xem Theo Mã', ['class'=>'btn btn-primary','id'=>'btnCode']) ?>
            <?= Html::button('Xem Theo File', ['class'=>'btn btn-primary','id'=>'btnFile']) ?>
        </div>
    </form>
</div>
<input type="hidden" id="url_code" value="<?=$url_code?>">
<input type="hidden" id="url_file" value="<?=$url_file?>">
<div id="watchcode">

</div>

<?php
    $script = <<<Js
    
    $("#btnCode").click(function() {
    
      $.ajax({
            url: $('#url_code').val(),
            type: "POST",
            data: {data:'test'}, 
            success: function(data) {                   
                $('#watchcode').html(data);
            }
        });
    });
    $("#btnFile").click(function() {
      $.ajax({
            url: $('#url_file').val(),
            type: "POST",
            data: {data:'test'}, 
            success: function(data) {                   
                $('#watchcode').html(data);
            }
        });
    });

Js;
    $this->registerJs($script, View::POS_END);
?>