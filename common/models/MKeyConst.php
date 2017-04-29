<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "m_key_const".
 *
 * @property integer $key_id
 * @property string $key_value
 * @property string $key_name
 * @property string $key_desc
 * @property string $create_time
 * @property string $update_time
 *
 * @property MAttribute[] $mAttributes
 */
class MKeyConst extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'm_key_const';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['key_desc'], 'string'],
            [['create_time', 'update_time'], 'safe'],
            [['key_value'], 'string', 'max' => 40],
            [['key_name'], 'string', 'max' => 100],
            [['key_value'], 'unique']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'key_id' => 'Key ID',
            'key_value' => 'Giá trị key thuộc tính',
            'key_name' => 'Tên key thuộc tính',
            'key_desc' => 'Mô tả',
            'create_time' => 'Thời gian tạo',
            'update_time' => 'Thời gian update',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMAttributes()
    {
        return $this->hasMany(MAttribute::className(), ['attr_key' => 'key_value']);
    }
}
