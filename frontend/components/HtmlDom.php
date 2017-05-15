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
        protected function getMultiCode($element) {

            $code = $element->find('td',0);
            $date_input = $element->find('td',1);
            $status_output = $element->find('td',2);
            $date_output = $element->find('td',3);
            $address = $element->find('td',4);
            $status_paypost = $element->find('td',5);
            $date_paypost = $element->find('td',6);
            $result = [
                        'code'=> isset($code)?trim($code->plaintext):'',
                        'date_input'=> isset($date_input)?trim($date_input->plaintext):'',
                        'status_output'=> isset($status_output)?trim($status_output->plaintext):'',
                        'date_output'=> isset($date_output)?trim($date_output->plaintext):'',
                        'address'=> isset($address)?trim($address->plaintext):'',
                        'status_paypost'=> isset($status_paypost)?trim($status_paypost->plaintext):'',
                        'date_paypost'=> isset($date_paypost)?trim($date_paypost->plaintext):''
            ];

            return $result;

        }

        protected function getSingleCode($result) {
            $dom = new SHD();
            $content = $dom->str_get_html($result);
            $data = $content->find('.main-wrapper',0);

            $result = [];
            if ($data) {
                $code = $data->find('.tracking-header-info .package-code strong',0);

                // get list time
                $time = $data->find('.timeline-list-item ul li');
                $arr_time = [];
                foreach($time as $element) {

                    $arr_time[] = [
                        'time'=>$this->cleanStr($element->find('.label-time',0)->plaintext),
                        'note'=>$this->cleanStr(preg_replace('/(\[COD\])|(\d.*)/','',$element->find('.block-span',0)->plaintext)),
                        'location'=>$this->cleanStr($element->find('.block-span span',0)->plaintext),
                    ];
                }

                $date_input = $data->find('.timeline-list-item ul li',1)->find('.label-time',0);
                $status_output = $data->find('.tracking-header-info .package-location strong',0);
                $date_output = $data->find('.table-done tbody tr',1)->find('td',0);
                $address = $data->find('.table-done tbody tr',1)->find('td',1);

                $result = [
                        'code'=> isset($code)?trim($code->plaintext):'',
                        'date_input'=> isset($date_input)?trim($date_input->plaintext):'',
                        'status_output'=> isset($status_output)?trim($status_output->plaintext):'',
                        'date_output'=> isset($date_output)?$this->cleanStr($date_output):'',
                        'address'=> isset($address)?trim($address->plaintext):'',
                        'status_paypost'=> $arr_time[0]['note'],
                        'date_paypost'=> $arr_time[0]['time'],
                        'list_time'=>json_encode($arr_time)
                ];
            }
            return $result;

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
                        $isOneCode = $this->checkOneRecord($value);
                        if ($isOneCode == true)
                            $data = $content->find($this->selector_vnpost_onerecord);
                        else
                            $data = $content->find($this->selector_vnpost);

                        if ($data) {
                            foreach($data as $element) {
                                if ($isOneCode != true) {
                                    if ( $element->find('td') != null )
                                        $arr_data[] = $this->getMultiCode($element);
                                }
                                else {
                                     $arr_data[] = $this->getSingleCode($result);
                                     break;
                                }
                            }
                            break;
                        }   
                        //$i++;   
                    } // end while
                    endforeach;
                else: 
                    $url = $this->url_vnpost . $code;
                    while(0==0) {
                         $result = $this->request_page($url);
                         $data = $this->getSingleCode($result);
                         if (!empty($data)) {
                            $arr_data[] = $data;
                            break;
                         }
                    }
                endif;

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
                if (empty($arr_listcode) && !empty($list_code))
                    $arr_listcode[] = $list_code;
            }
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

        protected function cleanStr($string) {
            $string = html_entity_decode($string);
            $string = preg_replace('/\s{2,}/', '', $string);
            return trim($string);
        }

    }


?>