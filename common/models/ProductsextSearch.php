<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\ProductsExt;

/**
 * ProductsextSearch represents the model behind the search form about `common\models\ProductsExt`.
 */
class ProductsextSearch extends ProductsExt
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['product_id', 'product_maker', 'product_supplier', 'transport_fee', 'manufacturer_directly', 'cod', 'get_site', 'totalimg', 'pd_trade_direct_price', 'pd_trade_price', 'user_id'], 'integer'],
            [['product_name', 'introduce', 'product_num', 'product_type', 'product_brand', 'product_supplier_url', 'product_img_search', 'img_1', 'img_2', 'img_3', 'img_4', 'img_5', 'img_6', 'img_7', 'img_8', 'img_9', 'img_10', 'delivery_time', 'extend_warranty', 'category', 'fix_category', 'description_text', 'description_html', 'time_get', 'goods_lots_sd', 'size_and_capacity', 'standard', 'note', 'terms_of_delivery_netsea', 'delivery_order_netsea', 'payment_methods_netsea', 'regist_update_time_netsea'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = ProductsExt::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'product_id' => $this->product_id,
            'product_maker' => $this->product_maker,
            'product_supplier' => $this->product_supplier,
            'transport_fee' => $this->transport_fee,
            'manufacturer_directly' => $this->manufacturer_directly,
            'cod' => $this->cod,
            'time_get' => $this->time_get,
            'get_site' => $this->get_site,
            'totalimg' => $this->totalimg,
            'pd_trade_direct_price' => $this->pd_trade_direct_price,
            'pd_trade_price' => $this->pd_trade_price,
            'user_id' => $this->user_id,
        ]);

        $query->andFilterWhere(['like', 'product_name', $this->product_name])
            ->andFilterWhere(['like', 'introduce', $this->introduce])
            ->andFilterWhere(['like', 'product_num', $this->product_num])
            ->andFilterWhere(['like', 'product_type', $this->product_type])
            ->andFilterWhere(['like', 'product_brand', $this->product_brand])
            ->andFilterWhere(['like', 'product_supplier_url', $this->product_supplier_url])
            ->andFilterWhere(['like', 'product_img_search', $this->product_img_search])
            ->andFilterWhere(['like', 'img_1', $this->img_1])
            ->andFilterWhere(['like', 'img_2', $this->img_2])
            ->andFilterWhere(['like', 'img_3', $this->img_3])
            ->andFilterWhere(['like', 'img_4', $this->img_4])
            ->andFilterWhere(['like', 'img_5', $this->img_5])
            ->andFilterWhere(['like', 'img_6', $this->img_6])
            ->andFilterWhere(['like', 'img_7', $this->img_7])
            ->andFilterWhere(['like', 'img_8', $this->img_8])
            ->andFilterWhere(['like', 'img_9', $this->img_9])
            ->andFilterWhere(['like', 'img_10', $this->img_10])
            ->andFilterWhere(['like', 'delivery_time', $this->delivery_time])
            ->andFilterWhere(['like', 'extend_warranty', $this->extend_warranty])
            ->andFilterWhere(['like', 'category', $this->category])
            ->andFilterWhere(['like', 'fix_category', $this->fix_category])
            ->andFilterWhere(['like', 'description_text', $this->description_text])
            ->andFilterWhere(['like', 'description_html', $this->description_html])
            ->andFilterWhere(['like', 'goods_lots_sd', $this->goods_lots_sd])
            ->andFilterWhere(['like', 'size_and_capacity', $this->size_and_capacity])
            ->andFilterWhere(['like', 'standard', $this->standard])
            ->andFilterWhere(['like', 'note', $this->note])
            ->andFilterWhere(['like', 'terms_of_delivery_netsea', $this->terms_of_delivery_netsea])
            ->andFilterWhere(['like', 'delivery_order_netsea', $this->delivery_order_netsea])
            ->andFilterWhere(['like', 'payment_methods_netsea', $this->payment_methods_netsea])
            ->andFilterWhere(['like', 'regist_update_time_netsea', $this->regist_update_time_netsea]);

        return $dataProvider;
    }
}
