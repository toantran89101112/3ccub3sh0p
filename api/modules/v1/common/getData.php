<?php
    namespace api\modules\v1\common;
    include_once(ROOT_PATH . '/common/library/CRestFull.php');

    class GETDATA
    {
        private function __construct()
        {

        }
        public static function Login($site='superdelivery'){
            set_time_limit(0);
            ignore_user_abort(true);
            $syspath = dirname(__FILE__);
            switch ($site){
                case 'superdelivery':
                    $cookie_path = "$syspath/cookie_sup.txt";
                    touch($cookie_path);
                    $URL1 = "https://www.superdelivery.com/p/login.do";
                    $params = array(
                        'continuity' => true,
                        'identification' => 'dits-8748',
                        //'location' => $url,
                        'password' => 'takuro3060',
                        'x' => 81,
                        'y' => 10
                    );
                    $ch = curl_init();
                    curl_setopt($ch, CURLOPT_URL, $URL1);
                    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
                    curl_setopt($ch, CURLOPT_HEADER, TRUE);
                    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
                    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
                    curl_setopt($ch, CURLOPT_COOKIEFILE, $cookie_path);
                    curl_setopt($ch, CURLOPT_COOKIEJAR, $cookie_path);
                    curl_setopt($ch, CURLOPT_POST, TRUE);
                    curl_setopt($ch, CURLOPT_POSTFIELDS, $params);
                    curl_exec($ch) or die('error ' . curl_error($ch)); 
                    curl_close($ch);
                    break;
                case 'netsea':
                    $cookie_path = "$syspath/cookie_net.txt";
                    touch($cookie_path);
                    $params = array( 
                        "login_id" => 'kadenryohan', 
                        "password" => '1474123', 
                        'bookmarkItemRegistFlg' => 'Y',
                        //'refererURL' => $url
                    ); 
                    $URL1 = "https://www.netsea.jp/dap/sv/Login";
                    $ch = curl_init();
                    curl_setopt($ch, CURLOPT_URL, $URL1);
                    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
                    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
                    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, TRUE);
                    curl_setopt($ch, CURLOPT_COOKIEFILE, $cookie_path);
                    curl_setopt($ch, CURLOPT_COOKIEJAR, $cookie_path);
                    curl_exec($ch) or die('error ' . curl_error($ch)); 
                    curl_close($ch);

                    //ログインIDとパスワードを転送して認証されればトップページを開く
                    $URL2 = "https://www.netsea.jp/dap/sv/LoginProc";

                    $ch = curl_init();
                    curl_setopt($ch, CURLOPT_URL, $URL2);
                    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
                    curl_setopt($ch, CURLOPT_HEADER, TRUE);
                    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
                    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
                    curl_setopt($ch, CURLOPT_COOKIEFILE, $cookie_path);
                    curl_setopt($ch, CURLOPT_COOKIEJAR, $cookie_path);
                    curl_setopt($ch, CURLOPT_POST, TRUE);
                    curl_setopt($ch, CURLOPT_POSTFIELDS, $params);
                    curl_exec($ch) or die('error ' . curl_error($ch)); 
                    curl_close($ch);

                    /*die('fsdfsdfsdf');*/
                    break;
            }
        }
        public static function getdata($method,$url,$params = null,$site=''){
            $html = '';
            switch ($method)
            {
                case 'get':
                    if ($site != '')
                    {
                        $syspath = dirname(__FILE__);
                        switch ($site){
                            case 'superdelivery':
                                $cookie_path = "$syspath/cookie_sup.txt";
                                $ch=curl_init();
                                curl_setopt($ch,CURLOPT_URL,$url);
                                curl_setopt($ch,CURLOPT_HEADER,FALSE);
                                curl_setopt($ch,CURLOPT_COOKIEFILE, $cookie_path);
                                curl_setopt($ch,CURLOPT_RETURNTRANSFER,TRUE);
                                curl_setopt($ch,CURLOPT_FOLLOWLOCATION,TRUE);
                                $html=curl_exec($ch);
                                curl_close($ch);
                                break;
                            case 'netsea':
                                $cookie_path = "$syspath/cookie_net.txt";
                                $ch=curl_init();
                                curl_setopt($ch,CURLOPT_URL,$url);
                                curl_setopt($ch,CURLOPT_HEADER,FALSE);
                                curl_setopt($ch,CURLOPT_COOKIEFILE, $cookie_path);
                                curl_setopt($ch,CURLOPT_RETURNTRANSFER,TRUE);
                                curl_setopt($ch,CURLOPT_FOLLOWLOCATION,TRUE);
                                $html=curl_exec($ch);
                                curl_close($ch);
                                /*die('fsdfsdfsdf');*/
                                break;
                        }

                    }
                    else
                        $html = CRestFull::get($url)->getResponse();
                    break;
                case 'post':
                    $html = CRestFull::post($url, $params)->getResponse();
                    break;
            }
            mb_language('Japanese');
            return mb_convert_encoding($html,'utf8','auto');
        }
        public static function loadHtml($html){
            $docProduct = new DOMDocument();
            $docProduct->loadHTML(mb_convert_encoding($html, 'HTML-ENTITIES', 'UTF-8'));
            return $docProduct;
        }
        public static function getUrlRequestFromPage($url,$page){
            $pos = strpos($url, '?');
            if ($pos === false) {
                $requesturl = $url . '?page=' . $page;
            } else {
                $requesturl = $url . '&page=' . $page;
            }
            return $requesturl;
        }
    }
?>