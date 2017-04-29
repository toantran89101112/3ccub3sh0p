<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\ProductDetailsExt;

/**
 * ProductDetailsExtSearch represents the model behind the search form about `common\models\ProductDetailsExt`.
 */
class ProductDetailsExtSearch extends ProductDetailsExt
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['prd_detail_id', 'pd_trade_price', 'pd_trade_price_tax', 'pd_sales_price', 'product_id', 'pd_trade_direct_price', 'save_amazon', 'save_yahooshop', 'save_rakuten'], 'integer'],
            [['product_type', 'product_num_extend', 'product_detail', 'product_detail_num', 'product_detail_jan', 'regist_time', 'amazon_transfer_time', 'yahooshop_transfer_time', 'rakuten_transfer_time', 'priceformula'], 'safe'],
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
        $query = ProductDetailsExt::find();

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
            'prd_detail_id' => $this->prd_detail_id,
            'pd_trade_price' => $this->pd_trade_price,
            'pd_trade_price_tax' => $this->pd_trade_price_tax,
            'pd_sales_price' => $this->pd_sales_price,
            'product_id' => $this->product_id,
            'pd_trade_direct_price' => $this->pd_trade_direct_price,
            'save_amazon' => $this->save_amazon,
            'save_yahooshop' => $this->save_yahooshop,
            'save_rakuten' => $this->save_rakuten,
            'amazon_transfer_time' => $this->amazon_transfer_time,
            'yahooshop_transfer_time' => $this->yahooshop_transfer_time,
            'rakuten_transfer_time' => $this->rakuten_transfer_time,
        ]);

        $query->andFilterWhere(['like', 'product_type', $this->product_type])
            ->andFilterWhere(['like', 'product_id', $this->product_id])
            ->andFilterWhere(['like', 'product_num_extend', $this->product_num_extend])
            ->andFilterWhere(['like', 'product_detail', $this->product_detail])
            ->andFilterWhere(['like', 'product_detail_num', $this->product_detail_num])
            ->andFilterWhere(['like', 'product_detail_jan', $this->product_detail_jan])
            ->andFilterWhere(['like', 'regist_time', $this->regist_time])
            ->andFilterWhere(['like', 'priceformula', $this->priceformula]);

        return $dataProvider;
    }
}
