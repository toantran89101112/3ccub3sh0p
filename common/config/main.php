<?php
return [
    'vendorPath' => dirname(dirname(__DIR__)) . '/vendor',
    'components' => [
        'cache' => [
            'class' => 'yii\caching\FileCache',
        ],
        'htmldom'=> [
        	'class'=>'frontend\components\HtmlDom'
        ]
    ],
    'language' => 'vi-VI',
    'sourceLanguage' => 'vi-VI',
];
