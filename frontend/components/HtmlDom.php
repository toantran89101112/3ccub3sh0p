<?php
    namespace frontend\components;


    use Yii;
    use yii\base\Component;
    use yii\base\InvalidConfigException;
    use keltstr\simplehtmldom\SimpleHTMLDom as SHD;

    class HtmlDom extends Component
    {
        private $url_vnpost = 'http://www.vnpost.vn/vi-vn/dinh-vi/buu-pham?key=';
        private $selector_vnpost = '.table-multi-tracking tbody tr';
        private $selector_vnpost_onerecord = '.table-tracking-info tbody tr';
        private $selector_single_vnpost = [
            'status_paypost'=>'.tracking-header-info .package-location strong',
            ''
        ];
        protected function checkOneRecord($strData){
            if (strpos($strData, ',') !== false) {
                return false;
            }
            else
                return true;
        }
        public function getContent($code)
        {
            $arr_data = [];
            if ( is_array($code) ):
                foreach($code as $key => $value):
                    $url = $this->url_vnpost . $value;

                    //$i = 0 ;
                    while(0==0){
                        $result = $this->request_page($url,$key);
                        $dom = new SHD();
                        $content = $dom->str_get_html($result);
                        if ($this->checkOneRecord($value) == true)
                            $data = $content->find($this->selector_vnpost_onerecord);
                        else
                            $data = $content->find($this->selector_vnpost);

                        if ($data) {
                            foreach($data as $element) {
                                if ( $element->find('td') != null ) {
                                    if ($this->checkOneRecord($value) == true)
                                    {
                                        print_r($element->innertext);    
                                    }
                                    else
                                    {
                                        $arr_data[] = [
                                            'code'=> trim($element->find('td',0)->plaintext),
                                            'date_input'=> trim($element->find('td',1)->plaintext),
                                            'status_output'=> trim($element->find('td',2)->plaintext),
                                            'date_output'=> trim($element->find('td',3)->plaintext),
                                            'adress'=> trim($element->find('td',4)->plaintext),
                                            'status_paypost'=> trim($element->find('td',5)->plaintext),
                                            'date_paypost'=> trim($element->find('td',6)->plaintext)
                                        ];   
                                    }



                                }

                            }
                            break;
                        }   


                        //$i++;   
                    }


                    endforeach;
                endif;
            /*else {
            $data = $content->find($this->selector_single_vnpost['status_paypost'],0);
            $arr_data[] = [
            'code'=>isset($data->plaintext)?$data->plaintext:''
            ];
            }*/
            /*echo '<pre/>';var_dump($arr_data);
            die; */

            return $arr_data;
        }

        public function getCodeExcel($filename) {
            $objPHPExcel = \PHPExcel_IOFactory::load(\Yii::$app->params['path_upload'].$filename);
            $sheetData = $objPHPExcel->getActiveSheet()->toArray(null,true,true,true);
            $list_code = '';
            $arr_listcode = [];
            if ( count($sheetData) == 1 ) {
                $list_code = $sheetData[1]['A'];
                $arr_listcode[] = $list_code;
            }
            else {
                $total = count($sheetData);
                $tmp_key = 1;
                foreach($sheetData as $key => $obj) {

                    if (empty($obj['A'])) {
                        $total--;
                        continue;
                    }
                    if ( $key > $tmp_key ) {
                        $key = $key -1;
                    }
                    else {
                        $tmp_key++;
                    }

                    if ($key == 1 || ($key-1)%5==0) 
                        $list_code = $obj['A'];
                    else
                        $list_code .= ','.$obj['A'];

                    if ($key%5==0) {
                        $arr_listcode[] = $list_code;
                        $list_code = '';
                    }
                    if ($total%5!=0 && $key == $total)
                        $arr_listcode[] = $list_code;
                }
            }
            //echo '<pre/>';var_dump($arr_listcode);die;
            return $arr_listcode;
        }
        protected function request_page($url,$prefix_cookie = '') {

            $filename = Yii::$app->session->getId().'-cookie.txt';
            $cookie = realpath(dirname(__FILE__).'/../../').'/cookies/'.$filename;
            //echo $cookie;die;
            $ch = curl_init($url);
            curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
            //curl_setopt($ch, CURLOPT_COOKIE, "ASP.NET_SessionId");

            if ($prefix_cookie == 0){

                curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
                curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 1);
                curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
                curl_setopt($ch, CURLOPT_COOKIEJAR,$cookie);
                curl_setopt($ch, CURLOPT_COOKIEFILE,$cookie);

            }
            else
            {
                //curl_setopt ($ch, CURLOPT_REFERER, $url);
                $buf2 = curl_exec($ch);
                curl_close($ch);
                return $this->request_page($url,0);   
            }


            //curl_setopt ($ch, CURLOPT_REFERER, $url);
            $buf2 = curl_exec($ch);

            curl_close($ch);
            return $buf2;
        }

    }


?>