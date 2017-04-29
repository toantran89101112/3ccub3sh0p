<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\Customer;

/**
 * CustomerSearch represents the model behind the search form about `common\models\Customer`.
 */
class CustomerSearch extends Customer
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['customer_id', 'customer_gender'], 'integer'],
            [['customer_code', 'customer_name', 'customer_email', 'customer_mobi', 'customer_login_password', 'customer_avatar', 'customer_birthday', 'customer_register_date', 'customer_last_active', 'customer_ip_connect_api', 'customer_accesstoken'], 'safe'],
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
        $query = Customer::find();

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
            'customer_id' => $this->customer_id,
            'customer_birthday' => $this->customer_birthday,
            'customer_gender' => $this->customer_gender,
            'customer_register_date' => $this->customer_register_date,
            'customer_last_active' => $this->customer_last_active,
        ]);

        $query->andFilterWhere(['like', 'customer_code', $this->customer_code])
            ->andFilterWhere(['like', 'customer_name', $this->customer_name])
            ->andFilterWhere(['like', 'customer_email', $this->customer_email])
            ->andFilterWhere(['like', 'customer_mobi', $this->customer_mobi])
            ->andFilterWhere(['like', 'customer_login_password', $this->customer_login_password])
            ->andFilterWhere(['like', 'customer_avatar', $this->customer_avatar])
            ->andFilterWhere(['like', 'customer_ip_connect_api', $this->customer_ip_connect_api])
            ->andFilterWhere(['like', 'customer_accesstoken', $this->customer_accesstoken]);

        return $dataProvider;
    }
}
