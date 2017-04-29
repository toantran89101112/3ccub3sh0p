<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "product_details".
 *
 * @property integer $prd_detail_id
 * @property string $product_type
 * @property string $product_num_extend
 * @property integer $pd_trade_price
 * @property integer $pd_trade_price_tax
 * @property integer $pd_sales_price
 * @property integer $product_id
 * @property string $product_detail
 * @property integer $pd_trade_direct_price
 * @property integer $save_amazon
 * @property integer $save_yahooshop
 * @property integer $save_rakuten
 * @property string $product_detail_num
 * @property string $product_detail_jan
 * @property string $regist_time
 * @property string $amazon_transfer_time
 * @property string $yahooshop_transfer_time
 * @property string $rakuten_transfer_time
 * @property string $priceformula
 *
 * @property Products $product
 */
class ProductDetails extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'product_details';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['pd_trade_price', 'pd_trade_price_tax', 'pd_sales_price', 'product_id', 'pd_trade_direct_price', 'save_amazon', 'save_yahooshop', 'save_rakuten'], 'integer'],
            [['product_id'], 'required'],
            [['amazon_transfer_time', 'yahooshop_transfer_time', 'rakuten_transfer_time'], 'safe'],
            [['product_type', 'product_num_extend', 'product_detail'], 'string', 'max' => 255],
            [['product_detail_num', 'product_detail_jan'], 'string', 'max' => 50],
            [['regist_time'], 'string', 'max' => 20],
            [['priceformula'], 'string', 'max' => 500]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'prd_detail_id' => Yii::t('app', 'Prd Detail ID'),
            'product_type' => Yii::t('app', 'Product Type'),
            'product_num_extend' => Yii::t('app', 'Product Num Extend'),
            'pd_trade_price' => Yii::t('app', 'Pd Trade Price'),
            'pd_trade_price_tax' => Yii::t('app', 'Pd Trade Price Tax'),
            'pd_sales_price' => Yii::t('app', 'Pd Sales Price'),
            'product_id' => Yii::t('app', 'Product ID'),
            'product_detail' => Yii::t('app', 'Product Detail'),
            'pd_trade_direct_price' => Yii::t('app', 'Pd Trade Direct Price'),
            'save_amazon' => Yii::t('app', 'Save Amazon'),
            'save_yahooshop' => Yii::t('app', 'Save Yahooshop'),
            'save_rakuten' => Yii::t('app', 'Save Rakuten'),
            'product_detail_num' => Yii::t('app', 'Product Detail Num'),
            'product_detail_jan' => Yii::t('app', 'Product Detail Jan'),
            'regist_time' => Yii::t('app', 'Regist Time'),
            'amazon_transfer_time' => Yii::t('app', 'Amazon Transfer Time'),
            'yahooshop_transfer_time' => Yii::t('app', 'Yahooshop Transfer Time'),
            'rakuten_transfer_time' => Yii::t('app', 'Rakuten Transfer Time'),
            'priceformula' => Yii::t('app', 'Priceformula'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProduct()
    {
        return $this->hasOne(Products::className(), ['product_id' => 'product_id']);
    }
}
