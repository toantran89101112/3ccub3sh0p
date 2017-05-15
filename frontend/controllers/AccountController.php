<?php

    namespace frontend\controllers;

    //use app\models\SignupForm;
    use app\models\LoginForm;
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

        /*$data_post = Yii::$app->request->post();
        $checkuser = $model->find()->where(['email'=>$data_post['Account']['email'], 'fbid' => $data_post['Account']['fbid']])->one();
        if (!empty($checkuser)){
        $model->login();
        return $this->redirect(['site/index']);
        }
        var_dump(Yii::$app->request->post());die;*/ 
        private $passwordsocial = '!@#oxysocial321';
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

            if (!yii::$app->account->isGuest)
                $this->goHome();
            $model = new Account();
            if ($model->load(Yii::$app->request->post())) {
             
             //   if(Yii::$app->request->isAjax){

                     //echo "<pre>";
                     //print_r(Yii::$app->request->post());die;
                     $data_all =  Yii::$app->request->post();     
                  //    echo   "<pre>"; print_r($data_all);       die;                
                   
                    if($model->save()){    
                   die("co save"); 
                    $find_save = Account:: find()->where(['id'=>$data_all['data_img']])->one();
                        
                                $find_save->user_id = $model->id_user;                           
                                if($find_save->save()) 
                                   Yii::$app->account->login($model, Setting::get('auth_time') ?: null );
                            return   'uploadsuccess';
                        //$this->flash('success', Yii::t('app', 'Chuc mung ban da dang ky thanh cong'));
                     /*   if(!empty($data_all['data_img']))
                        {
                                $find_save = OxyUsersEvents:: find()->where(['id'=>$data_all['data_img']])->one();
                            
                                $find_save->user_id = $model->id_user;                           
                                if($find_save->save()) 
                                   Yii::$app->account->login($model, Setting::get('auth_time') ?: null );
                            return   'uploadsuccess';
                        }
                        else
                          //   return "loginsuccess";
                            Yii::$app->account->login($model, Setting::get('auth_time') ?: null );
                      return "loginsuccess";*/

                    }else{   
                         die("ko save");
                       return  json_encode($model->getErrors());
                        // return  $model->getErrors();
                        //     return ActiveForm::validate($model);
                    }
            //    }

            }
            else {
                      die("ko posst");
                 return $this->redirect(['site/signup']);
             //   return $this->render('create', ['model' => $model]);
            }
        }
        public function actionLogout(){
            yii::$app->account->logout();
            $this->goHome();
        }
        public function actionLogin()
        {
            die('login');
            $request = yii::$app->request;


            $model = new LoginForm();
            if($request->isAjax){
                /*
                if(isset($_COOKIE["remember_login_name"])) {                  
                $model->email = $_COOKIE["remember_login_name"];
                }

                */
                //if (!yii::$app->account->isGuest)
                //    $this->goHome();

                $id_user_need = ($request->post()['data_img']);
                if ( ($model->load(Yii::$app->request->post()))) {
                    $checklogin = $model->login($id_user_need);
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
        }

        public function actionIndex() {
          
            return $this->render('index');
             
        }

    }
