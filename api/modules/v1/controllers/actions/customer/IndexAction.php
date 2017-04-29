<?php
/**
* @link http://www.yiiframework.com/
* @copyright Copyright (c) 2008 Yii Software LLC
* @license http://www.yiiframework.com/license/
*/

namespace api\modules\v1\controllers\actions\customer;

use Yii;
use yii\base\Model;
use yii\helpers\Url;
use common\models\UserExt;
use yii\web\ServerErrorHttpException;
use api\modules\v1\controllers\actions\BservicesAction;
use yii\db\Expression;
/**
* CreateAction implements the API endpoint for creating a new model from the given data.
*
* @author Qiang Xue <qiang.xue@gmail.com>
* @since 2.0
*/
class IndexAction extends BservicesAction
{                                                      
    /**
    * @var string the scenario to be assigned to the new model before it is validated and saved.
    */
    public $scenario = Model::SCENARIO_DEFAULT;
    /**
    * @var string the name of the view action. This property is need to create the URL when the model is successfully created.
    */
    public $viewAction = 'view';


    /**
    * Creates a new model.
    * @return \yii\db\ActiveRecordInterface the model newly created
    * @throws ServerErrorHttpException if there is any error when creating the model
    */
    public function run()
    {
        if ($this->checkAccess) {
            call_user_func($this->checkAccess, $this->id);
        }

        /* @var $model \yii\db\ActiveRecord */
        $model = new $this->modelClass([
            'scenario' => $this->scenario,
        ]);
        $model = $model->find()->one();
        
        return $model;
    }
    
}
