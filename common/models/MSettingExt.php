<?php

namespace common\models;

use Yii;
use common\models\MSetting;


class MSettingExt extends MSetting
{
    public static function getAllImage($setting)
    {
        $setting['image'] = self::getimage($setting['image'],$setting['mst_value']);
        return $setting;
    }
    public function getimage($image,$mst_value)
    {
        if (empty($image))
            return '';
        $baseuploads = yii::$app->params['baseuploads'];
        return $baseuploads . "setting/" . $image;    
    }
    
}
