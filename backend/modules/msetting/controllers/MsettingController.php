<?php

namespace backend\modules\msetting\controllers;

use Yii;
use common\models\MSetting;
use common\models\MsettingSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use yii\web\UploadedFile;
/**
 * MsettingController implements the CRUD actions for Msetting model.
 */
class MsettingController extends Controller
{
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
                ],
            ],
            'access' => [
            'class' => AccessControl::className(),
            'rules' => [
                [
                    'actions' => ['login', 'error'],
                    'allow' => true,
                ],
                [
                    'actions' => ['logout', 'index', 'create', 'view', 'update', 'delete'], // add all actions to take guest to login page
                    'allow' => true,
                    'roles' => ['@'],
                ],
            ],
        ],
        ];
    }

    /**
     * Lists all Msetting models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new MsettingSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Msetting model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Msetting model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new MSetting();
        $mstValue = $model->find()->select('mst_value')->orderBy('mst_value DESC')->one();
        $model->mst_value = $mstValue->mst_value+1;
        $model->create_by = Yii::$app->user->identity->id;
        date_default_timezone_set('Asia/Ho_Chi_Minh');
        $model->create_date = date('Y-m-d H:i:s');
        if ($model->load(Yii::$app->request->post()))
        {
            $baseUrlUpload = Yii::getAlias('@uploads').'/setting';
            $cutImage = UploadedFile::getInstance($model,"image");
            if($model->validate())
            {
                $model->save();
                if(isset($cutImage))
                {
                    $extCut = $cutImage->getExtension();
                    $cutImage->name = to_slug($cutImage->baseName).time().'.'.$extCut;
                    uploadfile($cutImage, $baseUrlUpload);
                    $model->image = $cutImage->name;
                    $model->update();
                }
                return $this->redirect(['view', 'id' => $model->mst_id]);
            }
            else
            {
                return $this->render('create', [
                    'model' => $model,
                ]);
            }
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Msetting model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        $oldimage = $model->image;
        if ($model->load(Yii::$app->request->post())) 
        {
            $model->update_by = Yii::$app->user->identity->id;
            date_default_timezone_set('Asia/Ho_Chi_Minh');
            $model->update_date = date('Y-m-d H:i:s');
            $cutImages = UploadedFile::getInstance($model,"image");
            $baseUrlUpload = Yii::getAlias('@uploads').'/setting';
            if($model->validate())
            {            
                if(isset($cutImages))
                {
                    $extCut = $cutImages->getExtension();
                    $cutImages->name = to_slug($cutImages->baseName).time().'.'.$extCut;
                    uploadfile($cutImages, $baseUrlUpload);
                    $model->image = $cutImages->name;
                }
                else
                {
                    $model->image = $oldimage;
                }

                $model->save();
                return $this->redirect(['view', 'id' => $model->mst_id]);
            }
            else {
                return $this->render('update', [
                    'model' => $model,
                ]);    
            }
            
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing Msetting model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Msetting model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Msetting the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = MSetting::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
