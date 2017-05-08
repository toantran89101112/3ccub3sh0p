<?php
namespace backend\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use common\models\LoginForm;
use yii\filters\VerbFilter;
use common\models\UserExt;
use common\components\CRestFull;
/**
 * Site controller
 */
class SiteController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'actions' => ['login', 'error'],
                        'allow' => true,
                    ],
                    [
                        'actions' => ['logout', 'index'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * @inheritdoc
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
        ];
    }

    public function actionIndex()
    {
       $ch = curl_init();

    curl_setopt($ch, CURLOPT_AUTOREFERER, TRUE);
    curl_setopt($ch, CURLOPT_HEADER, 0);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_URL, 'http://www.vnpost.vn/vi-vn/dinh-vi/buu-pham?key=Ei533877620VN');
    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, TRUE);       

    $data = curl_exec($ch);
    curl_close($ch);

    print_r($data); die;
        /*$postdata = [
            'param1' => 'value1',
            'param2' => 'value2'
        ];
        $postdata = \yii\helpers\Json::encode($postdata);
        $params = [
            'postto' => 'yahoo',
            'postdata' => $postdata
        ];
        $api = \common\components\CRestFull::post('http://root.test/eccubeapi/api/web/v1/customer/transferproduct',$params,'bantraicay' , 'XfaoH-LlXJcyBunJpQLSqJqhwQmsuJfn')->getResponse();
        print_r($api);die;*/
        $api = file_get_contents('http://www.vnpost.vn/vi-vn/dinh-vi/buu-pham?key=Ei533877620VN');
        //$api = \common\components\CRestFull::get('http://www.vnpost.vn/vi-vn/dinh-vi/buu-pham?key=Ei533877620VN',[])->getResponse();
        //$api = file_get_contents('http://www.vnpost.vn/vi-vn/dinh-vi/buu-pham?key=Ei533877620VN');
        //$api = \common\components\CRestFull::get('http://www.vnpost.vn/vi-vn/dinh-vi/buu-pham?key=Ei533877620VN')->getResponse();
        print_r($api);die;
        $totaluser = UserExt::find()->count();
        return $this->render('index',[
            'totaluser' => $totaluser,
        ]);
    }

    public function actionLogin()
    {
        if (!\Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->goBack();
        } else {
            return $this->render('login', [
                'model' => $model,
            ]);
        }
    }

    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }
}
