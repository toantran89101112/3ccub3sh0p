<?php
namespace frontend\models;

use Yii;
use yii\validators;
use yii\base\Model;
use frontend\models\Account;
use yii\db\Expression;
use yii\easyii\validators\EscapeValidator;
use yii\easyii\models\Setting;
use app\models\OxyUsersEvents;
/**
 * Login form
 */
class LoginForm extends Account
{
    //const CACHE_KEY = 'SIGNIN_TRIES';
    
    public $email;
    public $password;
    public $rememberMe = '';
     public $rememberLoginName = true;
    private $_email;


    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            // username and password are both required
            [['username', 'password_hash'], 'required', 'message' => Yii::t('app', '{attribute} không được để trống')],
           // [['username', 'password_hash'], EscapeValidator::className()],
            [['rememberMe'], 'string'],
            // password is validated by validatePassword()
            ['password_hash', 'validatePassword'],
            
        ];
    }

    /**
     * Validates the password.
     * This method serves as the inline validation for password.
     *
     * @param string $attribute the attribute currently being validated
     * @param array $params the additional name-value pairs given in the rule
     */
    
    public function validatePassword($attribute, $params)
    {
        if (!$this->hasErrors()) {
            $user = new Account;
            $user = $this->getEmail();

            if (!$user || !$user->validatePassword($this->password_hash)) {
                $this->addError($attribute, 'Tên đăng nhập hoặc Mật khẩu không đúng');
            }
        }
    }

    /**
     * Logs in a user using the provided username and password.
     *
     * @return boolean whether the user is logged in successfully
     */
    
    public function login($id_user_need)
    {
       
      
            $user = $this->getEmail();
            
           if (!empty($id_user_need)){ 
               $find_save = Account:: find()->where(['id'=>$id_user_need])->one();         
               $find_save->save();
           } 
            
           // return Yii::$app->account->login($user, Setting::get('auth_time') ?: null );
           if (Yii::$app->user->login($user, 86400 ?: null )){
               if (!empty($id_user_need))
                    return 'gotoDetail';
               else
                    return 'success';
           }
           else
                return 'anothererror';
      
    }


    /**
     * Finds user by [[username]]
     *
     * @return User|null
     */
    protected function getEmail()
    {
        if ($this->_email === null) {
            $this->_email = Account::findByEmail($this->email);
        }
        return $this->_email;
    }

    public function attributeLabels()
    {
        return [
            'username'=>Yii::t('app', 'Username'),
            'password_hash'=>Yii::t('app', 'Mật khẩu'),
        ];
    }
}
