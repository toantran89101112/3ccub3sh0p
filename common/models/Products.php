<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "products".
 *
 * @property integer $product_id
 * @property string $product_name
 * @property string $introduce
 * @property string $product_num
 * @property string $product_type
 * @property string $product_brand
 * @property integer $product_maker
 * @property integer $product_supplier
 * @property string $product_supplier_url
 * @property string $product_img_search
 * @property string $img_1
 * @property string $img_2
 * @property string $img_3
 * @property string $img_4
 * @property string $img_5
 * @property string $img_6
 * @property string $img_7
 * @property string $img_8
 * @property string $img_9
 * @property string $img_10
 * @property string $delivery_time
 * @property integer $transport_fee
 * @property integer $manufacturer_directly
 * @property integer $cod
 * @property string $extend_warranty
 * @property string $category
 * @property string $fix_category
 * @property string $description_text
 * @property string $description_html
 * @property string $time_get
 * @property integer $get_site
 * @property string $goods_lots_sd
 * @property string $size_and_capacity
 * @property string $standard
 * @property string $note
 * @property string $terms_of_delivery_netsea
 * @property string $delivery_order_netsea
 * @property string $payment_methods_netsea
 * @property string $regist_update_time_netsea
 * @property integer $totalimg
 * @property integer $pd_trade_direct_price
 * @property integer $pd_trade_price
 * @property integer $user_id
 *
 * @property User $user
 * 
 * @property ProductDetails $productDetails
 */
class Products extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'products';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['introduce', 'description_text', 'description_html', 'size_and_capacity', 'standard', 'note', 'terms_of_delivery_netsea', 'delivery_order_netsea'], 'string'],
            [['product_maker', 'product_supplier', 'transport_fee', 'manufacturer_directly', 'cod', 'get_site', 'totalimg', 'pd_trade_direct_price', 'pd_trade_price', 'user_id'], 'integer'],
            [['time_get'], 'safe'],
            [['product_name', 'product_num', 'product_type', 'product_brand', 'product_supplier_url', 'product_img_search', 'img_1', 'img_2', 'img_3', 'img_4', 'img_5', 'img_6', 'img_7', 'img_8', 'img_9', 'img_10', 'delivery_time', 'extend_warranty', 'category', 'fix_category', 'goods_lots_sd', 'regist_update_time_netsea','product_id_eccube'], 'string', 'max' => 255],
            [['payment_methods_netsea'], 'string', 'max' => 500]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'product_id' => Yii::t('app', 'Product ID'),
            'product_name' => Yii::t('app', 'Product Name'),
            'introduce' => Yii::t('app', 'Introduce'),
            'product_num' => Yii::t('app', 'Product Num'),
            'product_type' => Yii::t('app', 'Product Type'),
            'product_brand' => Yii::t('app', 'Product Brand'),
            'product_maker' => Yii::t('app', 'Product Maker'),
            'product_supplier' => Yii::t('app', 'Product Supplier'),
            'product_supplier_url' => Yii::t('app', 'Product Supplier Url'),
            'product_img_search' => Yii::t('app', 'Product Img Search'),
            'img_1' => Yii::t('app', 'Img 1'),
            'img_2' => Yii::t('app', 'Img 2'),
            'img_3' => Yii::t('app', 'Img 3'),
            'img_4' => Yii::t('app', 'Img 4'),
            'img_5' => Yii::t('app', 'Img 5'),
            'img_6' => Yii::t('app', 'Img 6'),
            'img_7' => Yii::t('app', 'Img 7'),
            'img_8' => Yii::t('app', 'Img 8'),
            'img_9' => Yii::t('app', 'Img 9'),
            'img_10' => Yii::t('app', 'Img 10'),
            'delivery_time' => Yii::t('app', 'Delivery Time'),
            'transport_fee' => Yii::t('app', 'Transport Fee'),
            'manufacturer_directly' => Yii::t('app', 'Manufacturer Directly'),
            'cod' => Yii::t('app', 'Cod'),
            'extend_warranty' => Yii::t('app', 'Extend Warranty'),
            'category' => Yii::t('app', 'Category'),
            'fix_category' => Yii::t('app', 'Fix Category'),
            'description_text' => Yii::t('app', 'Description Text'),
            'description_html' => Yii::t('app', 'Description Html'),
            'time_get' => Yii::t('app', 'Time Get'),
            'get_site' => Yii::t('app', 'Get Site'),
            'goods_lots_sd' => Yii::t('app', 'Goods Lots Sd'),
            'size_and_capacity' => Yii::t('app', 'Size And Capacity'),
            'standard' => Yii::t('app', 'Standard'),
            'note' => Yii::t('app', 'Note'),
            'terms_of_delivery_netsea' => Yii::t('app', 'Terms Of Delivery Netsea'),
            'delivery_order_netsea' => Yii::t('app', 'Delivery Order Netsea'),
            'payment_methods_netsea' => Yii::t('app', 'Payment Methods Netsea'),
            'regist_update_time_netsea' => Yii::t('app', 'Regist Update Time Netsea'),
            'totalimg' => Yii::t('app', 'Totalimg'),
            'pd_trade_direct_price' => Yii::t('app', 'Pd Trade Direct Price'),
            'pd_trade_price' => Yii::t('app', 'Pd Trade Price'),
            'user_id' => Yii::t('app', 'User ID'),
            'product_id_eccube' => Yii::t('app','product_id_eccube')
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProductDetails()
    {
        return $this->hasMany(ProductDetails::className(), ['product_id' => 'product_id']);
    }
}
