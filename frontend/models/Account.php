<?php

    namespace frontend\models;

    use Yii;
    use yii\db\ActiveRecord;
    use yii\easyii\models\Setting;
    use yii\web\IdentityInterface;
    use yii\db\Expression;
    use yii\easyii\modules\code\models\Code;
    use yii\easyii\modules\usercode\models\Usercode;
    use yii\easyii\modules\uservoucher\models\Uservoucher;
    use yii\easyii\modules\user\models\User;
    use yii\easyii\modules\productrate\models\Productsrate;
    use yii\easyii\modules\winner\models\Winner;
    use yii\easyii\modules\voucher\models\Voucher;
    use yii\easyii\modules\product\models\Product;
    use yii\easyii\modules\city\models\City;
 

    /**
    * This is the model class for table "easyii_goute_account".
    * @property integer $id_user
    * @property string $username
    * @property string $email
    * @property string $password
    * @property string $salt
    * @property string $fullname
    * @property string $fbid
    * @property string $update_date
    * @property string $phone
    * @property string $register_date
    * @property integer $status
    * @property integer $total_code
    * @property integer $total_voucher
    * @property string $fbtoken
    * @property string $password_reset_token
    * @property integer $delete_flag
    * @property integer $total_product
    * 
    * @property GouteUserCode[] $gouteUserCodes
    * @property GouteUserVoucher[] $gouteUserVouchers
    * @property GouteWinnerEvents[] $gouteWinnerEvents
    */
    class Account extends ActiveRecord implements IdentityInterface {

        public $confirmpassword;
        /**
        * @inheritdoc
        */
        public static function tableName() {
            return 'user';
        }

        /**
        * @inheritdoc
        */
        
        public function rules() {
            return [
                [['created_at', 'updated_at'], 'safe'],
                [['status'], 'integer'],
                [['adress'], 'string', 'max' => 255],
                [['username'], 'string', 'max' => 255], 
                ['username', 'required', 'message' => Yii::t('app', '{attribute} không được để trống')],       
                [['email'], 'string', 'max' => 100],
                [['displayname'], 'string', 'max' => 200],
                ['phone', 'match', 'pattern' => '/^[0-9]\w*$/i'],
                ['phone', 'filter', 'filter' => 'trim'],
            /*    ['phone', 'required', 'message' => Yii::t('app', '{attribute} không được để trống')],*/
             //   ['phone', 'unique', 'targetClass' => '\app\models\Account', 'message' => Yii::t('app', '{attribute} đã tồn tại trong hệ thống')],
                ['phone', 'string', 'min' => 10, 'tooShort' => Yii::t('app', '{attribute} không được ngắn hơn {min} kí tự')],
                ['phone', 'string', 'max' => 14, 'tooLong' => Yii::t('app', '{attribute} không được dài hơn {max} kí tự')],
                ['email', 'filter', 'filter' => 'trim'],
                ['email', 'required', 'message' => Yii::t('app', '{attribute} không được để trống')],
                ['email', 'email', 'message' => Yii::t('app', 'Định dạng {attribute} chưa đúng, vui lòng kiểm tra lại')],
                ['email', 'string', 'max' => 100, 'tooLong' => Yii::t('app', '{attribute} không được dài hơn {max} kí tự')],
             //   ['email', 'unique', 'targetClass' => '\app\models\Account', 'message' => Yii::t('app', '{attribute} đã tồn tại trong hệ thống')],
                ['displayname', 'filter', 'filter' => 'trim'],
               /* ['fullname', 'required', 'message' => Yii::t('app', '{attribute} không được để trống')],*/
                ['displayname', 'string', 'max' => 32, 'tooLong' => Yii::t('app', '{attribute} phải nhỏ hơn {max} kí ')],
                ['password_hash', 'filter', 'filter' => 'trim'],
                ['password_hash', 'required', 'message' => Yii::t('app', '{attribute} không được để trống')],
                ['password_hash', 'string', 'min' => 6, 'tooShort' => Yii::t('app', '{attribute} phải lớn hơn {min} kí tự')],
                ['password_hash', 'string', 'max' => 100, 'tooLong' => Yii::t('app', '{attribute} không được dài hơn {max} kí tự')],
             
                //['password', 'match', 'pattern' => '/((?=.*\d)(?=.*[A-Z]).{8})|((?=.*\d)(?=.*[a-z]).{8})/', 'message' => Yii::t('app', '{attribute} phải gồm chữ và số')],
                ['confirmpassword', 'required', 'message' => Yii::t('app', '{attribute} không được để trống')],
                ['confirmpassword', 'compare', 'compareAttribute'=>'password_hash', 'message'=>"Mật khẩu nhập lại không trùng khớp" ],
           /*     ['location', 'required', 'message' => Yii::t('app', '{attribute} không được để trống')],*/
               /* [['location'], 'string', 'max' => 255],*/
            ];
        }

        /**
        * @inheritdoc
        */
        public function attributeLabels() {
            return [
                'id' => 'Id User',
                'username' => 'Username',     
                'updated_at' => 'Update Date',
                'created_at' => 'Register Date',
                'status' => 'Status',
                'displayname' => Yii::t('app', 'Họ và tên'),
                'phone' => Yii::t('app', 'Số điện thoại'),
                'email' => Yii::t('app', 'Email'),
                'password_hash' => Yii::t('app', 'Mật khẩu'),           
                'confirmpassword' => Yii::t('app', 'Xác nhận mật khẩu'),
                'password_reset_token' => 'Password Reset Token',
                'adress' => "Full Adress",
             
            ];
        }

        
         public static function findIdentity($id) {
            return static::findOne(['id' => $id]);
        }
         public static function findIdentityByAccessToken($token, $type = null) {
            //return static::findOne(['access_token' => $token]);
        }
        public function getId() {         
            return $this->id;
        }
         public function getAuthKey() {
           // return $this->salt;
        }
         public function validateAuthKey($salt) {
           // return $this->getAuthKey() === $salt;
        }

       public function beforeSave($insert) {
      
                if (parent::beforeSave($insert)) {
                 
                    if ($this->isNewRecord) {                              
                        $this->password_hash = $this->hashPassword($this->password_hash);
                        $this->created_at = new Expression('NOW()');
                        $this->status = 1;
                                                         
                    } else {
                        if ($this->password_hash != $this->oldAttributes['password_hash'])
                            $this->password_hash = $this->password_hash != '' ? $this->hashPassword($this->password_hash) : $this->oldAttributes['password_hash'];
                    }
                    return true;
                } else {
                    return false;
                }
            }
            
         private function hashPassword($password) {
            //return sha1($password . $this->getAuthKey() . Setting::get('password_salt'));
            return sha1($password . $this->getAuthKey() . 'GeTG6HWrVL9JIdbFNSu46HrjbyczrHNs');
        }

        public function validatePassword($password) {
            return $this->password_hash === $this->hashPassword($password);
        }  
          public static function findByEmail($email) {
            return static::findOne(['email' => $email]);
        }
 
    /*    public function getAuthKey() {
            return $this->salt;
        }

        public function getId() {
            return $this->id_user;
        }

        public function validateAuthKey($salt) {
            return $this->getAuthKey() === $salt;
        }

        public static function findIdentity($id) {
            return static::findOne(['id' => $id]);
        }

        public static function findIdentityByAccessToken($token, $type = null) {
            //return static::findOne(['access_token' => $token]);
        }

        private function hashPassword($password) {
            return sha1($password . $this->getAuthKey() . Setting::get('password_salt'));
        }

        public function validatePassword($password) {
            return $this->password === $this->hashPassword($password);
        }

        private function generateAuthKey() {
            return Yii::$app->security->generateRandomString();
        }

        public static function findByEmail($email) {
            return static::findOne(['email' => $email]);
        }

    
        
        public function Sendmail($to,$subject,$html,$from = 'info@deptraiphaitheclub.com'){
            Yii::$app->mailer->compose()
            ->setFrom(array($from => 'OXY HAIR VIỆT NAM'))
            ->setReplyTo('oxyhair@gmail.com')
            ->setTo($to)
            ->setSubject($subject)
            ->setHtmlBody($html)
            ->send();
        }
       
    
         public function getOxyUsersWinner()
        {
            return $this->hasMany(OxyUsersWinner::className(), ['user_id' => 'id_user']);
        }
        
        */
    }
