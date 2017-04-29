<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace common\widgets;

use yii\helpers\ArrayHelper;

use iutbay\yii2kcfinder\KCFinderAsset;
use iutbay\yii2kcfinder\KCFinder;
use Yii;
class CKEditor extends \dosamigos\ckeditor\CKEditor
{

    public $enableKCFinder = true;

    /**
     * Registers CKEditor plugin
     */
    protected function registerPlugin()
    {
        if ($this->enableKCFinder)
        {
            $this->registerKCFinder();
        }

        parent::registerPlugin();
    }

    /**
     * Registers KCFinder
     */
    protected function registerKCFinder()
    {
        $register = KCFinderAsset::register($this->view);
        $kcfinderUrl = $register->baseUrl;

        $browseOptions = [
            'filebrowserBrowseUrl' => $kcfinderUrl . '/browse.php?opener=ckeditor&type=files',
            'filebrowserUploadUrl' => $kcfinderUrl . '/upload.php?opener=ckeditor&type=files',
        ];
        
        $this->clientOptions = ArrayHelper::merge($browseOptions, $this->clientOptions);
        $kcfOptions = array_merge(KCFinder::$kcfDefaultOptions, [
            //'uploadURL' => Yii::getAlias('@web').'/upload',
            'uploadURL' => Yii::$app->params['ckeditorUpload'],
            'uploadDir' => "../../../../ckupload",
            'access' => [
                'files' => [
                    'upload' => true,
                    'delete' => true,
                    'copy' => true,
                    'move' => true,
                    'rename' => true,
                ],
                'dirs' => [
                    'create' => true,
                    'delete' => true,
                    'rename' => true,
                ],
            ],
        ]);
        
        // Set kcfinder session options
        Yii::$app->session->set('KCFINDER', $kcfOptions);
    }

}