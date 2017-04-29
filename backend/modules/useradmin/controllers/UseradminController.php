<?php

namespace backend\modules\useradmin\controllers;

use Yii;
use backend\modules\useradmin\models\UserAdmin;
use backend\modules\useradmin\models\UseradminSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use common\models\LoginForm;
use common\models\User;
use yii\filters\AccessControl;

/**
 * UseradminController implements the CRUD actions for Useradmin model.
 */
class UseradminController extends Controller
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
     * Lists all Useradmin models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new UseradminSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Useradmin model.
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
     * Creates a new Useradmin model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new UserAdmin();

        if ($model->load(Yii::$app->request->post())) {
            $model->auth_key = Yii::$app->security->generateRandomString();
            $model->password_hash = Yii::$app->security->generatePasswordHash($model->password_hash);
            $model->status = 10;
            $model->created_at = time();
            $model->updated_at = time();
            if($model->save())
                return $this->redirect(['view', 'id' => $model->id]);
            else {
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
     * Updates an existing Useradmin model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        $pass = $model->password_hash;
        if ($model->load(Yii::$app->request->post())) {
            if($model->password_hash != $pass)
                $model->password_hash = Yii::$app->security->generatePasswordHash($model->password_hash);
                $model->updated_at = time();
            if($model->save())
                return $this->redirect(['view', 'id' => $model->id]);
            else
            {
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
    
    public function actionChangepass()
    {
        $model = $this->findModel(Yii::$app->user->identity->id);
        $pass = $model->password_hash;
        $model->password_hash='';
        if ($model->load(Yii::$app->request->post())) {
            $user = User::findIdentity(Yii::$app->user->identity->id);
            $check = $user->validatePassword($model->password_hash);
            $cpass = $model->new_password;
            if($check && !empty($model->new_password))
            {
                $model->password_hash = Yii::$app->security->generatePasswordHash($model->new_password);
                $model->new_password = '';
                $model->updated_at = time();
                if($model->save())
                {
                     \Yii::$app->getSession()->setFlash('success', 'đổi mật khẩu thành công');
                     $model->password_hash='';
                     return $this->render('changepass', [
                        'model' => $model,
                    ]);
                }
                else
                {
                    if(!$check)
                        \Yii::$app->getSession()->setFlash('error', 'mật khẩu hiện tại không đúng');
                    if(empty($cpass))
                        \Yii::$app->getSession()->setFlash('error', 'mật khẩu mới không được để trống');
                    return $this->render('changepass', [
                        'model' => $model,
                    ]);
                }
            }{
                 if(!$check)
                        \Yii::$app->getSession()->setFlash('error', 'mật khẩu hiện tại không đúng');
                    if(empty($cpass))
                        \Yii::$app->getSession()->setFlash('error', 'mật khẩu mới không được để trống');
                    return $this->render('changepass', [
                        'model' => $model,
                    ]);
            }
        }else{
                return $this->render('changepass', [
                    'model' => $model,
                ]);            
        }
    }

    /**
     * Deletes an existing Useradmin model.
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
     * Finds the Useradmin model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Useradmin the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = UserAdmin::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
