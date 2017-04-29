<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "m_setting".
 *
 * @property integer $mst_id
 * @property integer $mst_kubun
 * @property string $mst_key
 * @property integer $mst_id_parent
 * @property integer $mst_value
 * @property string $mst_display_value
 * @property string $mst_content_value
 * @property integer $create_by
 * @property string $create_date
 * @property integer $update_by
 * @property string $update_date
 * @property string $desc
 */
class MSetting extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'm_setting';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['mst_display_value'], 'required'],
            [['mst_kubun', 'mst_id_parent', 'mst_value', 'create_by', 'update_by'], 'integer'],
            [['mst_content_value', 'desc'], 'string'],
            [['create_date', 'update_date'], 'safe'],
            [['mst_key'], 'string', 'max' => 50],
            [['mst_display_value','short_content'], 'string', 'max' => 255],
            [['mst_value'], 'unique'],
            [['image'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'mst_id' => 'Mst ID',
            'mst_kubun' => 'Thiết bị(1:Android,2:Ios,0:Cả 2)',
            'mst_key' => 'Key setting',
            'mst_id_parent' => 'Thuộc setting cha',
            'mst_value' => 'Key value',
            'mst_display_value' => 'Giá trị sử dụng',
            'mst_content_value' => 'Nọi dung giá trị',
            'create_by' => 'Người tạo',
            'create_date' => 'Ngày tạo',
            'update_by' => 'Người sửa',
            'update_date' => 'Ngày sửa',
            'desc' => 'Mô tả',
            'image' => 'Hình Ảnh',
            'short_content' => 'Nội dung ngắn',
        ];
    }

    public function Parent($id)
    {
        return MSetting::find()->where(['mst_value'=>$id])->one();
    }
}
