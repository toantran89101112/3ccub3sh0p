<?php

namespace backend\modules\products;

class Products extends \yii\base\Module
{
    public $controllerNamespace = 'backend\modules\products\controllers';
    public $defaultRoute = 'products';
    public function init()
    {
        parent::init();

        // custom initialization code goes here
    }
}
