<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\MSetting;

/**
 * MsettingSearch represents the model behind the search form about `common\models\Msetting`.
 */
class MsettingSearch extends MSetting
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['mst_id', 'mst_kubun', 'mst_id_parent', 'mst_value', 'create_by', 'update_by'], 'integer'],
            [['mst_key', 'mst_display_value', 'mst_content_value', 'create_date', 'update_date', 'desc'], 'safe'],
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
        $query = MSetting::find();

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
            'mst_id' => $this->mst_id,
            'mst_kubun' => $this->mst_kubun,
            'mst_id_parent' => $this->mst_id_parent,
            'mst_value' => $this->mst_value,
            'create_by' => $this->create_by,
            'create_date' => $this->create_date,
            'update_by' => $this->update_by,
            'update_date' => $this->update_date,
        ]);

        $query->andFilterWhere(['like', 'mst_key', $this->mst_key])
            ->andFilterWhere(['like', 'mst_display_value', $this->mst_display_value])
            ->andFilterWhere(['like', 'mst_content_value', $this->mst_content_value])
            ->andFilterWhere(['like', 'desc', $this->desc]);

        return $dataProvider;
    }
}
