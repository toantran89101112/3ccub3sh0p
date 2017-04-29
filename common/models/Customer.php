<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "customer".
 *
 * @property integer $customer_id
 * @property string $customer_code
 * @property string $customer_name
 * @property string $customer_email
 * @property string $customer_mobi
 * @property string $customer_login_password
 * @property string $customer_avatar
 * @property string $customer_birthday
 * @property integer $customer_gender
 * @property string $customer_register_date
 * @property string $customer_last_active
 * @property string $customer_ip_connect_api
 * @property string $customer_accesstoken
 */
class Customer extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'customer';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['customer_mobi', 'customer_login_password'], 'required'],
            [['customer_birthday', 'customer_register_date', 'customer_last_active'], 'safe'],
            [['customer_gender'], 'integer'],
            [['customer_code'], 'string', 'max' => 30],
            [['customer_name', 'customer_email'], 'string', 'max' => 100],
            [['customer_mobi'], 'string', 'max' => 14],
            [['customer_login_password', 'customer_avatar', 'customer_ip_connect_api', 'customer_accesstoken'], 'string', 'max' => 255],
            [['customer_mobi'], 'unique']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'customer_id' => Yii::t('app', 'Customer ID'),
            'customer_code' => Yii::t('app', 'Customer Code'),
            'customer_name' => Yii::t('app', 'Customer Name'),
            'customer_email' => Yii::t('app', 'Customer Email'),
            'customer_mobi' => Yii::t('app', 'Customer Mobi'),
            'customer_login_password' => Yii::t('app', 'Customer Login Password'),
            'customer_avatar' => Yii::t('app', 'Customer Avatar'),
            'customer_birthday' => Yii::t('app', 'Customer Birthday'),
            'customer_gender' => Yii::t('app', 'Customer Gender'),
            'customer_register_date' => Yii::t('app', 'Customer Register Date'),
            'customer_last_active' => Yii::t('app', 'Customer Last Active'),
            'customer_ip_connect_api' => Yii::t('app', 'Customer Ip Connect Api'),
            'customer_accesstoken' => Yii::t('app', 'Customer Accesstoken'),
        ];
    }
}
