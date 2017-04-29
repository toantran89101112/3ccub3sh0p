<?php

    namespace api\modules\v1;
    use yii\filters\Cors;
    use yii\filters\auth\CompositeAuth;
    use yii\filters\auth\HttpBasicAuth;
    use yii\filters\auth\HttpBearerAuth;
    use yii\filters\auth\QueryParamAuth;
    use yii\helpers\ArrayHelper;
    use yii\web\Response;
    use Yii;
    class Module extends \yii\base\Module
    {
        public $controllerNamespace = 'api\modules\v1\controllers';
        public $defaultRoute = 'customer';
        public $password_hash;
        public function init()
        {
            parent::init();
            \Yii::$app->user->enableSession = false;
        }
        public function behaviors()
        {    
            $behaviors = ArrayHelper::merge([
                [
                    'class' => Cors::className(),
                ],
            ], parent::behaviors());   
            //$behaviors = parent::behaviors();
            $behaviors['authenticator'] = [
                'class' => HttpBasicAuth::className(),
                'auth' => [$this, 'auth']
            ]; 
            /*$behaviors['authenticator'] = [
                'class' => HttpBearerAuth::className(),
            ];*/
            return $behaviors;
        }
        
        /**
        * Finds user by user_email and user_password
        *
        * @param string $username
        * @param string $password
        * @return static|null
        */
        public function Auth($username, $password) {
            // username, password are mandatory fields
            if(empty($username) || empty($password))
                return null;

            // get user using requested email
            $user = \common\models\User::findOne([
                'username' => $username,
                'auth_key' => $password 
            ]);
            // if no record matching the requested user
            if(empty($user))
                return null;
            if (Yii::$app->getRequest()->getUserIP() != $user->ipadress)
                return null;
            // hashed password from user record
            /*$this->password_hash = $user->password_hash;

            // validate password
            $isPass = \common\models\User::validatePassword($password);

            // if password validation fails
            if(!$isPass)
                return null;*/
            // if user validates (both user_email, user_password are valid)  
            return $user;
        }
    }
