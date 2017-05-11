<?php

namespace common\models;
use yii\web\UploadedFile;

use Yii;

/**
 * This is the model class for table "bills".
 *
 * @property string $id
 * @property integer $user_id
 * @property string $bill_number
 * @property string $receiver
 * @property string $receiver_adress
 * @property string $receiver_phone
 * @property integer $bill_money
 * @property integer $unit_transport
 * @property integer $method_transport
 */
class Bills extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public $file;
    public static function tableName()
    {
        return 'bills';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id', 'bill_number', 'unit_transport'], 'required'],
            [['user_id', 'bill_money', 'unit_transport', 'method_transport'], 'integer'],
            [['bill_number'], 'string', 'max' => 50],
            [['receiver', 'receiver_adress'], 'string', 'max' => 255],
            [['receiver_phone'], 'string', 'max' => 15],
            [['file'], 'file']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'user_id' => 'User ID',
            'bill_number' => 'Bill Number',
            'receiver' => 'Receiver',
            'receiver_adress' => 'Receiver Adress',
            'receiver_phone' => 'Receiver Phone',
            'bill_money' => 'Bill Money',
            'unit_transport' => 'Unit Transport',
            'method_transport' => 'Method Transport',
            'file'=>'File'
        ];
    }
}
