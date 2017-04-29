<?php

namespace backend\modules\customer;

class Customer extends \yii\base\Module
{
    public $controllerNamespace = 'backend\modules\customer\controllers';
    public $defaultRoute = 'customer';
    public function init()
    {
        parent::init();

        // custom initialization code goes here
    }
}
