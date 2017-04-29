<?php
/**
* @link http://www.yiiframework.com/
* @copyright Copyright (c) 2008 Yii Software LLC
* @license http://www.yiiframework.com/license/
*/

namespace api\modules\v1\controllers\actions\common;

use Yii;                            
use yii\base\Model;
use api\modules\v1\controllers\actions\BservicesAction;
use yii\web\NotFoundHttpException; 
use yii\data\ActiveDataProvider;
use common\models\MSetting;  
use common\models\MSettingExt;  

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
        
    }

}