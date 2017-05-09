<?php
return [
    'adminEmail' => 'admin@example.com',
    'supportEmail' => 'support@example.com',
    'user.passwordResetTokenExpire' => 3600,
    'yahooSetting'  => [
        'domain' => 'http://shopping.c.yimg.jp/lib',
        'server_ftp' => 'yjftp.yahoofs.jp',
        'user_name' => 'store-gift-london',
        'user_pass' => 'pZ2o68k7',
    ],
    'rakutenSetting' => [
        'domain' => 'http://image.rakuten.co.jp/nigaoe-komachi/cabinet',
        'server_ftp' => 'upload.rakuten.ne.jp',
        'user_name' => 'nigaoe-komachi',
        'user_pass' => 'pQk4fe2S',
    ],
    'path_upload'=> realpath(dirname(__FILE__).'/../../').'/uploads/'
];
