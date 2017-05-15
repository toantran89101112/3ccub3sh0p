<?php

    namespace frontend\controllers;
    use Yii;
    use yii\base\InvalidParamException;
    use yii\web\BadRequestHttpException;
    use yii\web\Controller;
    use yii\filters\VerbFilter;
    use yii\filters\AccessControl;
    use common\models\Bills;
    use yii\web\UploadedFile;

    class SavedataController extends Controller
    {
        public function beforeAction()
        {
            if (Yii::$app->user->isGuest)
                $this->redirect(array('site/login'));
            return true;
        }
        public function actionIndex()
        {
            return $this->render('index');
        }
        public function actionCode()
        {
            $model = new Bills();
            if($model->load(Yii::$app->request->post()))
            {
                /*echo "<pre>";
                print_r(Yii::$app->request->post());die;*/
                $request = Yii::$app->request->post()['Bills'];
                $present = Yii::$app->user->identity->id;
                $model->bill_number = $request['bill_number'];
                $model->user_id = $present;
                $model->receiver = $request['receiver'];
                $model->receiver_adress = $request['receiver_adress'];
                $model->receiver_phone = $request['receiver_phone'];
                $model->bill_money = $request['bill_money'];
                $model->unit_transport = $request['unit_transport'];
                $model->method_transport = $request['method_transport'];

                if($model->save())
                {
                    \Yii::$app->session->setFlash('success', 'Success');
                    return $this->render('index',['model'=>$model]);
                }
                else
                    $model->getErrors();
            }
            else
            {
                return $this->render('code',['model'=>$model]);
            }
            
        }
        public function actionFile()
        {
            $model = new Bills();
            if($model->load(Yii::$app->request->post()))
            {
                $request = Yii::$app->request->post()['Bills'];
                $file = UploadedFile::getInstance($model, 'file');
                if(($file->error)==0) 
                {  
                    
                    $file_excel = $file->name; 
                    uploadfile($file, yii::getAlias('@dataupload'));
                    $htmldom = Yii::$app->htmldom;
                    
                    $list_code = $htmldom->getCodeExcel($file_excel);
                    $arr_result = $htmldom->getContent($list_code);
                    $present = Yii::$app->user->identity->id;
                    foreach($arr_result as $result)
                    {
                        $model_ = new Bills();
                        $model_->unit_transport = $request['unit_transport'];
                        $model_->method_transport = $request['method_transport'];

                        $model_->bill_number = $result['code'];
                        $model_->user_id = $present;
                        //$model->receiver = $result['receiver'];
                        $model_->receiver_adress = $result['address'];
                        //$model->receiver_phone = $result['receiver_phone'];
                        //$model->bill_money = $result['bill_money'];
                        if($model_->save())
                        {    
                        }
                        else
                        {
                            print_r($model_->getErrors());die;  
                        }    
                    }
                }
                else
                {
                    \Yii::$app->getSession()->setFlash('error', yii::t('app','Error Upload File.') );     
                    return $this->render('file', [
                        'model' => $model,
                    ]);
                }
            }
            return $this->render('file',['model'=>$model]);
        }
}