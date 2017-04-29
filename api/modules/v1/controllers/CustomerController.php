<?php

namespace api\modules\v1\controllers;

use yii\rest\ActiveController;
use yii\web\Response;
use yii\filters\ContentNegotiator;
use common\models\UserExt;
use common\models\MProdExt;
use common\models\TCustomerLikeProd;
use yii\web\UrlManager;
use yii\filters\auth\HttpBasicAuth;
use DateTime;

/**
* Country Controller API
*
* @author Budi Irawan <deerawan@gmail.com>
*/
class CustomerController extends ActiveController
{
    public $modelClass = 'common\models\UserExt';
    public function behaviors()
    {
        $behaviors = parent::behaviors();
        $behaviors['contentNegotiator'] = [
            'class' => ContentNegotiator::className(),
            'formats' => [
                'application/json' => Response::FORMAT_JSON,
            ],
        ];
        return $behaviors;
    }
    public function actions()
    {
        $actions = parent::actions();

        // disable the "delete" and "create" actions
        //unset($actions['create']);

        /*$actions['index'] = [
            'class' => 'api\modules\v1\controllers\actions\customer\IndexAction',
            'modelClass' => $this->modelClass,
            'checkAccess' => [$this, 'checkAccess'],
        ];*/
        
        $actions['transferproduct'] = [
            'class' => 'api\modules\v1\controllers\actions\customer\TransferproductAction',
            'modelClass' => $this->modelClass,
            'checkAccess' => [$this, 'checkAccess'],
        ];
        
        return $actions;
    } 
    protected function verbs()
    {
        return [
            'index' => ['', ''],
            'view' => ['GET', 'HEAD'],
            'create' => ['POST'],
            'update' => ['POST', 'PUT', 'PATCH'],
            'delete' => ['DELETE'],
            'transferproduct' => ['POST']
        ];            
    }
}
