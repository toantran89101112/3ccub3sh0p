<?php
/**
 * @link http://www.yiiframework.com/
 * @copyright Copyright (c) 2008 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 */

namespace frontend\assets;

use yii\web\AssetBundle;

/**
 * @author Qiang Xue <qiang.xue@gmail.com>
 * @since 2.0
 */
class AppAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [
 
        
    ];
    public $js = [
    /*   'template/Login/js/jquery.min.js',
       'template/Login/js/jquery.form.js ',
       'template/Login/js/custom.js',
       'template/Login/js/jquery.requestAnimationFrame.min.js',
       'template/Login/js/jquery.nanoscroller.min.js',
       'template/Login/js/Sortable.min.js',
       'template/Login/js/_con.min.js',
       'template/Login/js/prettify.js',
       'template/Login/js/validate/jquery.validate.min.js',
       'template/Login/js/validate/messages_vi.min.js',
       'template/Login/js/tooltipster/jquery.tooltipster.js',*/
    ];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap\BootstrapAsset',
    ];
}
