<?php
$params = array_merge(
    require(__DIR__ . '/../../common/config/params.php'),
    require(__DIR__ . '/../../common/config/params-local.php'),
    require(__DIR__ . '/params.php'),
    require(__DIR__ . '/params-local.php')
);

return [
    'name' => 'API SYSTEM MANAGER',
    'id' => 'app-backend',
    'basePath' => dirname(__DIR__),
    'controllerNamespace' => 'backend\controllers',
    'bootstrap' => ['log'],
    'modules' => [
        'productdetail' => [
            'class' => 'backend\modules\productdetail\Productdetail',
        ],
        'products' => [
            'class' => 'backend\modules\products\Products',
        ],
        'admin' => [
            'class' => 'backend\modules\admin\Admin',
        ],
        
        /*'user' => [

            'class' => 'backend\modules\useradmin\Useradmin',

        ],*/
        'msetting' => [

            'class' => 'backend\modules\msetting\Msetting',

        ],
        
        'mkeyconst' => [

            'class' => 'backend\modules\mkeyconst\Mkeyconst',

        ],
    ],
    'components' => [
        'user' => [
            'identityClass' => 'common\models\User',
            'enableAutoLogin' => true,
            'loginUrl' => ['site/login'],
        ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],
        'view' => [
            'theme' => [
                'pathMap' => [
                   '@app/views' => '@vendor/dmstr/yii2-adminlte-asset/example-views/yiisoft/yii2-app'
                ],
            ],
        ],
    ],
    'params' => $params,
];
