<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\MKeyConst;

/**
 * MKeyConstSearch represents the model behind the search form about `common\models\MKeyConst`.
 */
class MKeyConstSearch extends MKeyConst
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['key_id'], 'integer'],
            [['key_value', 'key_name', 'key_desc', 'create_time', 'update_time'], 'safe'],
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
        $query = MKeyConst::find();

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
            'key_id' => $this->key_id,
            'create_time' => $this->create_time,
            'update_time' => $this->update_time,
        ]);

        $query->andFilterWhere(['like', 'key_value', $this->key_value])
            ->andFilterWhere(['like', 'key_name', $this->key_name])
            ->andFilterWhere(['like', 'key_desc', $this->key_desc]);

        return $dataProvider;
    }
}
