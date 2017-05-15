<?php

    namespace frontend\controllers;

    //use app\models\SignupForm;
    use frontend\models\LoginForm;
    use app\models\ForgotPassForm;
    use Yii;
    use yii\web\Controller;
    //use yii\easyii\components\Controller;
    use yii\captcha\CaptchaAction;
    use frontend\models\Account;
    use yii\widgets\ActiveForm;
    use yii\data\ActiveDataProvider;
    use app\controllers\base\BaseController;
    use yii\easyii\models\Setting;
    use app\components\GoogleAPI;
    use app\models\OxyUsersEvents;
    use yii\web\Cookie;

    class AccountController extends Controller {

    
      //  private $passwordsocial = '!@#oxysocial321';
        public function actionLoginfb(){

            $data_post = Yii::$app->request->post();
            /*echo "<pre>";
            print_r($data_post);die;*/
            $model = new Account;
            $checkuser = $model->find()->where(['email'=>$data_post['email'], 'fbid' => $data_post['fbid']])->one();

            if (!empty($checkuser)){
                Yii::$app->account->login($checkuser, $data_post['ipt_rememberMe'] == 'on' ? Setting::get('auth_time') ?: null : 0);
                if(!empty($data_post['data_img']))
                {          
                    $find_save = OxyUsersEvents:: find()->where(['id'=>$data_post['data_img']])->one();
                    $find_save->user_id = $checkuser->id_user;
                    $find_save->save();
                    return 'uploadsuccess';
                }
                else
                    return 'success';
            }else
            {
                $model = new Account;
                $model->email=$data_post['email'];
                $model->fbid= $data_post['fbid']; 
                $model->fullname= $data_post['name'];         
                $model->password= $this->passwordsocial;
                $model->confirmpassword = $this->passwordsocial;
                if($model->save()){            

                    Yii::$app->account->login($model, $data_post['ipt_rememberMe'] == 'on' ? Setting::get('auth_time') ?: null : 0 );
                    if(!empty($data_post['data_img'])){
                        $find_save = OxyUsersEvents:: find()->where(['id'=>$data_post['data_img']])->one();

                        $find_save->user_id = $model->id_user;
                        $find_save->save();
                        return 'uploadsuccess_new';
                    }
                    else                         
                        return 'success';
                }else
                {
                    return json_encode($model->getErrors());
                }
            }
            die('nologin');
        }
        public function actionForgotpass(){
           
            if (!yii::$app->account->isGuest)
                $this->goHome();
            $model = new ForgotPassForm();
            $model->load(Yii::$app->request->post());
             if(Yii::$app->request->isAjax){
                    Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
                    if ($model->validate()){
                    
                    //    return $model->forgotPass();
                     return  json_encode(['type' => 'success', 'result' => $model->forgotPass()]);
                        //    return json_encode(['type' => 'loginsuccess']);
                    }
                    else
                    {                  
                       // return ActiveForm::validate($model);
                     return  json_encode(['type' => 'validate', 'error' => $model->getErrors()]);
                    }
            }else{
                die('call not ajax');
            }
        }
        public function actionSendmail(){
            $to = 'nguyenquocthien7418v@gmail.com';
            $subject = 'Chúc mừng bạn đã nhận được giải thưởng !!!';
            $this->Sendmail($to,$subject,'','winner');
        }
        public function Sendmail($to,$subject,$html,$from = 'nguyenquocthien7418v@gmail.com'){
            Yii::$app->mailer->compose()
            ->setFrom($from)
            ->setTo($to)
            ->setSubject($subject)
            ->setHtmlBody($html)
            ->send();
        }
        public function actionCreate(){
           
            if (!yii::$app->user->isGuest)
                $this->goHome();
            $model = new Account();
            if ($model->load(Yii::$app->request->post())) {           
                     $data_all =  Yii::$app->request->post();                    
                    if($model->save()){    
                       //      echo   "<pre>"; print_r(yii::$app->user->isGuest);       die;  
                       $find_save = Account::findOne(['username' =>$data_all['Account']['username'] ]);
                   //   $find_save = Account:: find()->where(['id'=>$data_all['data_img']])->one();
                                           
                        Yii::$app->user->login($find_save, 86400 ?: null );           
                        return $this->redirect(['site/index']);
                 
                    }else{   
                       echo   "<pre>"; print_r($model->getErrors());       die;  
                       return  json_encode($model->getErrors());
                    }   
            }
            else {
                   //   die("ko posst");
                 return $this->redirect(['site/signup']);
             //   return $this->render('create', ['model' => $model]);
            }
        }
        public function actionLogout(){      
            yii::$app->user->logout();
            $this->goHome();
        }
        public function actionLogin()
        {    
            $request = yii::$app->request->post();
            $model = new LoginForm();
          
                /*
                if(isset($_COOKIE["remember_login_name"])) {                  
                $model->email = $_COOKIE["remember_login_name"];
                }

                */
                //if (!yii::$app->account->isGuest)
                //    $this->goHome();

           //     $id_user_need = ($request->post()['data_img']);
                if ( ($model->load(Yii::$app->request->post()))) {
                  
                    $find_save = Account::findOne(['username' =>$request['LoginForm']['username'] ]);
                      
                         if(!empty($find_save)) 
                            $checklogin = $model->login($find_save->id);
                          else
                            die('shit');
                       echo   "<pre>"; print_r($checklogin);       die;  
                    if ($checklogin == 'gotoDetail')
                    {
                        return json_encode(['type' => 'gotoDetail', 'user_event_id' => $id_user_need]) ; 
                    }
                    else if ($checklogin == 'success') 
                        return json_encode(['type' => 'loginsuccess']);
                    else if ($checklogin == 'anothererror')
                        return json_encode(['type' => 'error', 'msg' => 'Có lỗi xảy ra. Vui lòng thử lại']);
                    else
                        return  json_encode(['type' => 'validate', 'error' => $model->getErrors()]);
                } else {
                   return 'error';
                }

           
        }

        public function actionIndex() {
          
            return $this->render('index');
             
        }

    }
