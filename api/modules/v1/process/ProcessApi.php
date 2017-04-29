<?php

namespace api\modules\v1\process;

use Yii;
use common\models\ProductDetailsExt;
use common\models\Products;
use common\models\ProductDetails;

class ProcessApi 
{
    public static function postProductAll($params){
        
    }
    
    public static function saveProduct ($params)
    {
        $product = $params->products;
        
        
        $shop = Yii::$app->user->identity->id;
        $checkProduct = Products:: find()->where(['product_id_eccube' => ($shop.'_'.$product->product_id_eccube)])->one();
        if($checkProduct)
        {
            $model = $checkProduct;
        }
        else
            $model = new Products();

        $model->product_id_eccube = $shop.'_'.$product->product_id_eccube;
        $model->product_name = $product->product_name;
        $model->introduce = $product->introduce;
        $model->product_num = $product->product_num;
        $model->product_type = $product->product_type;
        $model->product_brand = $product->product_brand;
        $model->product_maker = $product->product_maker;
        $model->product_supplier = $product->product_supplier;
        $model->product_supplier_url = $product->product_supplier_url;
        $model->product_img_search = $product->product_img_search;
        for($i= 1 ; $i <= 10; $i ++)
        {               

            if($product->{"img_$i"} != ''){
                $path = Yii::getAlias('@dataupload').'/'.$shop.'/'.$product->product_id_eccube;
                base64_decode_image($model->product_id_eccube.'_'.time().'.jpg',$product->{"img_$i"}, $path);
                $model->{"img_$i"} = $shop.'/'.$product->product_id_eccube.'/'.$model->product_id_eccube.'_'.time().'.jpg';
            }
            else
                $model->{"img_$i"} = '';
        }
        
        $model->delivery_time = $product->delivery_time;
        $model->transport_fee = $product->transport_fee;
        $model->manufacturer_directly = $product->manufacturer_directly;
        $model->cod = $product->cod;
        $model->extend_warranty = $product->extend_warranty;
        $model->category = $product->category;
        $model->fix_category = $product->fix_category;
        $model->description_text = $product->description_text;
        $model->description_html = $product->description_html;
        $model->time_get = $product->time_get;
        $model->get_site = $product->get_site;
        $model->goods_lots_sd = $product->goods_lots_sd;
        $model->size_and_capacity = $product->size_and_capacity;
        $model->standard = $product->standard;
        
        $model->note = $product->note;
        $model->terms_of_delivery_netsea = $product->terms_of_delivery_netsea;
        $model->delivery_order_netsea = $product->delivery_order_netsea;
        $model->payment_methods_netsea = $product->payment_methods_netsea;
        $model->regist_update_time_netsea = $product->regist_update_time_netsea;
        $model->totalimg = $product->totalimg;
        
        $model->pd_trade_direct_price = $product->pd_trade_direct_price;
        $model->pd_trade_price = $product->pd_trade_price;
        $model->user_id = $product->user_id;
        /*echo "<pre>";
        print_r($model);die;*/
        if($model->save())
        {
           return $model->product_id;
        }
        else
            return $model->getErrors();

        
    }
    public static function saveProductDetail($params,$id_product_detail)
    {
        $productdetail = $params->products_detail;
        for($i = 0; $i< count($productdetail); $i++ )
        {
            $model = new ProductDetails();        
            
            $model->product_type = $productdetail[$i]->product_type;
            $model->product_num_extend = $productdetail[$i]->product_num_extend;
            $model->pd_trade_price = $productdetail[$i]->pd_trade_price;
            $model->pd_trade_price_tax = $productdetail[$i]->pd_trade_price_tax;
            $model->pd_sales_price = $productdetail[$i]->pd_sales_price;
            $model->product_id = $id_product_detail;
            $model->product_detail = $productdetail[$i]->product_detail;
            $model->pd_trade_direct_price = $productdetail[$i]->pd_trade_direct_price;
            $model->save_amazon = $productdetail[$i]->save_amazon;
            $model->save_yahooshop = $productdetail[$i]->save_yahooshop;
            $model->save_rakuten = $productdetail[$i]->save_rakuten;
            $model->product_detail_num = $productdetail[$i]->product_detail_num;
            $model->product_detail_jan = $productdetail[$i]->product_detail_jan;
            $model->regist_time = $productdetail[$i]->regist_time;
            $model->amazon_transfer_time = $productdetail[$i]->amazon_transfer_time;
            $model->yahooshop_transfer_time = $productdetail[$i]->yahooshop_transfer_time;
            $model->rakuten_transfer_time = $productdetail[$i]->rakuten_transfer_time;
            $model->priceformula = $productdetail[$i]->priceformula;
            
            $model->save();
          
        }

    }
    public static function postProductYahoo($params){
        //get data example here
        //$params = \yii\helpers\Json::decode($params);
        //return $params['param1'];
        //end get data here
        //$prd_detail_extend $str_ext_detail $title $description
        //Gia lap
        $id_product_detail = ProcessApi::saveProduct($params);
        
        ProcessApi::saveProductDetail($params,$id_product_detail);
        $prd_detail_id = 8807;
        $row = ProductDetailsExt::find()->where(['prd_detail_id' => $prd_detail_id])->asArray()->one();
        $_POST['rd_prod_detail'] = 1;
        //Gia lap
        $prd_detail_extend = '';
        $str_ext_detail = '';
        switch ($_POST['rd_prod_detail']){
            case 1:
                $prd_detail_extend = $row['product_detail'];
                $str_ext_detail = 'product_detail';
            break;
            case 2:
                $prd_detail_extend = $row['product_type'];
                $str_ext_detail = 'product_type';
            break;
            case 3:
                $prd_detail_extend = $row['product_detail_num'];
                $str_ext_detail = 'product_detail_num';
            break;
        }
        //$sql = 'select '.$str_ext_detail.' from product_details where product_id = ' . $row['product_id'];
        //$database = new OBJDATABASE();
        //$arraytype = $database->query($sql);
        $arraytype = ProductDetailsExt::find()->where(['product_id' => $row['product_id']])->select($str_ext_detail)->asArray()->all();
        $arraytype = ConvertArrayData($arraytype,$str_ext_detail);
        if (sizeof($arraytype) > 1)
            $title  = $row['product_name'] . ' ' . $row['product_brand'];
        else
            $title  = $prd_detail_extend . ' ' . $row['product_name'] . ' ' . $row['product_brand'];
        #Get All data CSV
        $insertArr = array();
        switch ($row['get_site']){
            case 1:
                $prefix = 'ns-';
                break;
            case 2:
                $prefix = 'sd-';
                break;
        }
        $database = new OBJDATABASE(2);
        $maker = $row['product_maker'];

        $sql = 'SELECT * FROM maker WHERE no = ' .$maker ;
        $result = $database->query($sql);
        $arrmaker = ConvertArrayList($result);
        $maker_name = $arrmaker[$maker];
        $shire = $row['product_supplier'];
        for($i=1;$i<=10;$i++){
            $insertArr = array_merge($insertArr,array("img$i" => $GLOBALS['SETTING']['rakuten']['domain'] . $row['img_' . $i]));
        }
        $description = '';
        //    
        if (isset($_POST['introduce_sd']) && $_POST['introduce_sd'] != '' && $row['introduce'] != '')
            $description .= '商品説明' . "\n" . $row['introduce'] . "\n";
        if (isset($_POST['goods_lots_sd']) && $_POST['goods_lots_sd'] != '' && $row['goods_lots_sd'] != '')
            $description .= '出荷' . "\n" . $row['goods_lots_sd'] . "\n";
        if (isset($_POST['size_and_capacity_sd']) && $_POST['size_and_capacity_sd'] != '' && $row['size_and_capacity'] != '')
            $description .= 'サイズ・容量' . "\n" . $row['size_and_capacity'] . "\n";
        if (isset($_POST['standard_sd']) && $_POST['standard_sd'] != '' && $row['standard'] != '')
            $description .= '規格' . "\n" . $row['standard'] . "\n";
        if (isset($_POST['note_sd']) && $_POST['note_sd'] != '' && $row['note'] != '')
            $description .= '注意事項' . "\n" . $row['note'] . "\n";
        //     
        if (isset($_POST['introduce_netsea']) && $_POST['introduce_netsea'] != '' && $row['introduce'] != '')
            $description .= '商品紹介' . "\n" . $row['introduce'] . "\n";
        if (isset($_POST['product_brand_netsea']) && $_POST['product_brand_netsea'] != '' && $row['product_brand'] != '')
            $description .= 'ブランド名' . "\n" . $row['product_brand'] . "\n";
        if (isset($_POST['size_and_capacity_netsea']) && $_POST['size_and_capacity_netsea'] != '' && $row['size_and_capacity'] != '')
            $description .= 'サイズ･容量' . "\n" . $row['size_and_capacity'] . "\n";
        if (isset($_POST['standard_netsea']) && $_POST['standard_netsea'] != '' && $row['standard'] != '')
            $description .= '規格' . "\n" . $row['standard'] . "\n";
        if (isset($_POST['note_netsea']) && $_POST['note_netsea'] != '' && $row['note'] != '')
            $description .= '注意事項' . "\n" . $row['note'] . "\n";
        if (isset($_POST['terms_of_delivery_netsea']) && $_POST['terms_of_delivery_netsea'] != '' && $row['terms_of_delivery_netsea'] != '')
        $description .= '出荷条件' . "\n" . $row['terms_of_delivery_netsea'] . "\n";
        $update_date = date('YmdHis');
        #END
        $csvarray_file_add = array();
        $daytime = DateUtil::dateFormat($row['time_get'],'Y-m-d H:i:s','Ymd');
        switch ($GLOBALS["MASTER"]['get_site'][$row['get_site']]){
            case 'netsea':
                $seconddir = "net_" . $row['product_num'];
                break;
            case 'superdelivery':
                $seconddir = "sd_" . $row['product_num'];
                break;
        }
        if ((int)$prdid == (int)array_keys($arritem)[0]){
            session_destroy();
            session_start();
            $_SESSION['datetext'] = date('YmdHi');
            $_SESSION['arrprd'] = array();
            deleteDirectory(ROOT_PATH . "/csv/yahoo/");
            mkdir(ROOT_PATH . "/csv/yahoo/");
            $file_add = fopen(ROOT_PATH . "/csv/yahoo/test_data_add".$_SESSION['datetext'].".csv", 'w');
        }
        else
        {
            $file_add = fopen(ROOT_PATH . "/csv/yahoo/test_data_add".$_SESSION['datetext'].".csv", 'a+');

        }

        ##Check Category
        $ishave = 0;
        $get_site = $row['get_site'];
        $arrcate = CommonData::getArrayAllCate($row['category'],$get_site,$ishave);
        if ($ishave == 0){
            if ((int)$prdid == (int)array_keys($arritem)[sizeof($arritem) - 1])
                goto nocategory;
            else
                die('<span style="color:red;font-weight:bold;">カテゴリー見つかりません</span>');
        }
        ##End Check Category
        ##Get And Check Price
        $price = $_POST['pricesale_' . $row['prd_detail_id']] ;
        /*if ($_POST['price_type'] == '2')
        $originalprice = $row['pd_trade_direct_price'];
        if ($_POST['price_type'] == '1')
        $originalprice = $row['pd_trade_price'];*/
        $originalprice = $row['pd_trade_direct_price'] * $GLOBALS['TAX'];
        if ($price == 0){
            if ((int)$prdid == (int)array_keys($arritem)[sizeof($arritem) - 1])
                goto originalprice;
            else
                die('<span style="color:red;font-weight:bold;">original price or price is empty</span>');
        }
        ##End Get And Check Price
        if (!in_array($row['product_id'], $_SESSION['arrprd'])) {
            if (empty($_SESSION['arrprd']))
                $csvarray_file_add[] = array("path","name","code","sub-code","original-price","price","sale-price","options","headline","caption","abstract","explanation","additional1","additional2","additional3","relevant-links","ship-weight","taxable","release-date","temporary-point-term","point-code","meta-key","meta-desc","template","sale-period-start","sale-period-end","sale-limit","sp-code","brand-code","person-code","yahoo-product-code","product-code","jan","isbn","delivery","product-category","spec1","spec2","spec3","spec4","spec5","display");
            ##get paths

            $paths = CommonData::getStringAllCate($row['category'],$get_site,':');
            ##end
            array_push($_SESSION['arrprd'],$row['product_id']);
            $_SESSION[$row['product_id'] . 'obj'] = $row;    
            $imgs = explode('/',$row['product_img_search']);
            $imgend = $imgs[sizeof($imgs) - 1];
            $img_search = $GLOBALS['SETTING']['rakuten']['domain'] . "/$maker/" . $imgend;
            $minfree = (isset($_POST['minfree']) && (int)$_POST['minfree'] > 0) ? (int)$_POST['minfree'] : 0;
            $postage = (isset($_POST['postage']) && $_POST['postage'] != '') ? (int)$_POST['postage'] : 0;
            if ($price > $minfree) 
                $postage = 0;
            $istax = $postage == 0 ? 1 : 3;
            $JAN = $row['product_detail_jan'];
            $title = FunctionString::RemoveString($title,'JAN：' . $JAN);
            /*$csvarray_file_add[] = array('',$title,'sd-' . $row['product_id'],$row['product_num'],$normal_price_direct,$normal_price,$price,'kohieu','kohieu',$row['introduce'],'kohieu',$description,'kohieu','kohieu','kohieu','kohieu','kohieu',$istax, $row['regist_update_time_netsea'],'kohieu','kohieu','kohieu',$title,'kohieu','kohieu','kohieu','kohieu','kohieu','kohieu','kohieu','kohieu','kohieu',$JAN,'kohieu',0,0,0,'kohieu',0);*/
            ##get options 
            $sql = 'select * from product_details where product_id = ' . $row['product_id'];
            $database = new OBJDATABASE();
            $arraytype = $database->query($sql);
            $i = 0;
            $options = '';
            $subcodes = '';
            foreach ($arraytype as $item){
                $prd_detail_extend = '';
                switch ($_POST['rd_prod_detail']){
                    case 1:
                        $prd_detail_extend = $item['product_detail'];
                        break;
                    case 2:
                        $prd_detail_extend = $item['product_type'];
                        break;
                    case 3:
                        $prd_detail_extend = $item['product_detail_num'];
                        break;
                }
                $product_type_no_space = removeAllSpace($prd_detail_extend);
                $i++;
                if ($i > 20)
                    break;
                $options .= $options == '' ? $product_type_no_space : ($product_type_no_space == '' ? '' : ' ' . $product_type_no_space);
                $subcodes .= $subcodes == '' ? ($product_type_no_space == '' ? '' : 'タイプ:' . $product_type_no_space . "=$prefix" . $row['product_id'] . "-$i") : ($product_type_no_space == '' ? '' : '&タイプ:' . $product_type_no_space . "=$prefix" . $row['product_id'] . "-$i");
            }

            ##Caption
            $caption = "<table style=border-top:solid 1px #C8C7C2;border-bottom:solid 1px #C8C7C2;width:600px;margin:auto;line-height:1.2em;font-size:1.2em;><tr><td style=width:120px;vertical-align:top;><img src=http://lib2.shopping.srv.yimg.jp/lib/gift-london/goodsmark.jpg width=17 height=14 alt= class=default_mark> 商品特徴</td><td> <table cellspacing=0 cellpadding=0 style=width:600px;line-height:1.4em;><tr><td><div>".$row['introduce']."</div></td></tr></table><br><b style=color:red;></b> </td></tr></table><table style=text-align:center;margin:auto;width:100%;>";

            for ($img=1;$img <= 10; $img++){
                if (!empty($row['img_' . $img])){
                    $imgs = explode('/',$row['img_' . $img]);
                    $imgend = $imgs[sizeof($imgs) - 1];
                    $imgend_rm = explode('_',$imgend)[1];
                    $imgend_rm = $prefix . $row['product_id'] . '_' . $imgend_rm;
                    $caption .= "<tr><td style=text-align:center;><img src=".$GLOBALS['SETTING']['yahoo']['domain'] . "/gift-london/$imgend_rm></td></tr>";
                }
            }
            $caption .= "</table>";
            ##END caption
            $options = $options == '' ? '' : 'タイプ ' . $options;
            $description = word_limit($description,500);
            ##end get options
            $csvarray_file_add[] = array($paths,$title,$prefix . $row['product_id'],$subcodes,$originalprice,$price,'',$options,'',$caption,'',$description,'','','','',$postage,0, $row['regist_update_time_netsea'],'','','',$title,'','','','','','','','','',$JAN,'',$istax,'', '','','','','',0);
            $csvarray_file_add = encodeSJIScsvarray($csvarray_file_add);
            foreach ($csvarray_file_add as $fields) {
                fputcsv($file_add, $fields);
            }
            fclose($file_add);
            ##End

        }

        $database = new OBJDATABASE();
        $insertArr = array();
        $insertArr['save_yahooshop'] = 1;
        $insertArr['yahooshop_transfer_time'] = date('Y-m-d H:i:s');
        $priceformula = $this->priceformula();

        $insertArr['priceformula'] = $priceformula;
        $database->UpdateData('product_details',$insertArr,array('prd_detail_id'=>$row['prd_detail_id']));
        originalprice:
        nocategory:
        if ((int)$prdid == (int)array_keys($arritem)[sizeof($arritem) - 1]) {
            $zip = new ZipArchive();
            $zip_lib = new ZipArchive();
            deleteDirectory(ROOT_PATH . "/img/yahoo/");
            mkdir(ROOT_PATH . "/img/yahoo/");
            $filename = ROOT_PATH . "/img/yahoo/test_img.zip";
            $filename_lib = ROOT_PATH . "/img/yahoo/test_lib_img.zip";
            if ($zip->open($filename, ZipArchive::CREATE)!==TRUE) {
                exit("cannot create <$filename>\n");
            }
            if ($zip_lib->open($filename_lib, ZipArchive::CREATE)!==TRUE) {
                exit("cannot create <$filename_lib>\n");
            }
            $zip->close();
            $zip_lib->close();
            //$zip->addFile(ROOT_PATH . "/csv/yahoo/data".$_SESSION['datetext'].".csv","data".$_SESSION['datetext'].".csv");
            foreach ($_SESSION['arrprd'] as $prdob){
                switch ($GLOBALS["MASTER"]['get_site'][$_SESSION[$prdob . 'obj']['get_site']]){
                    case 'netsea':
                        $seconddir = "net_" . $_SESSION[$prdob . 'obj']['product_num'];
                        break;
                    case 'superdelivery':
                        $seconddir = "sd_" . $_SESSION[$prdob . 'obj']['product_num'];
                        break;
                }
                $localdir = ROOT_PATH . "/img/$daytime/$seconddir/";
                $in = 0;
                for ($img=1;$img <= 10; $img++){
                    if (!empty($_SESSION[$prdob . 'obj']['img_' . $img])){

                        if ($zip->open($filename, ZipArchive::CREATE)!==TRUE) {
                            exit("cannot create <$filename>\n");
                        }
                        if ($zip_lib->open($filename_lib, ZipArchive::CREATE)!==TRUE) {
                            exit("cannot create <$filename_lib>\n");
                        }
                        $imgs = explode('/',$_SESSION[$prdob . 'obj']['img_' . $img]);
                        $imgend = $imgs[sizeof($imgs) - 1];
                        $imgend_rm = explode('_',$imgend)[1];
                        $imgend_rm = $prefix . $prdob . '_' . $imgend_rm;
                        $imgend_cur = explode('.',$imgend_rm);
                        $img_current = $imgend_cur[1];
                        $in++;
                        if ($in == 1){
                            $img_current = $prefix . $prdob . '.' . $img_current;
                            $zip->addFile($localdir . $imgend,$img_current);
                        }
                        if ($in <= 5)
                            $zip->addFile($localdir . $imgend,$imgend_rm);
                        $zip_lib->addFile($localdir . $imgend,$imgend_rm);
                        $zip->close();
                        $zip_lib->close();
                    }
                }

            }

            $localdir = ROOT_PATH . "/img/yahoo/";
            $fullpath = "/";
            $_server =  $GLOBALS['SETTING']['yahoo']['server_ftp'];
            $_user_name = $GLOBALS['SETTING']['yahoo']['user_name'];
            $_user_pass = $GLOBALS['SETTING']['yahoo']['user_pass'];
            if (!ImageUtil::moveFolderImg($_server,$_user_name,$_user_pass,$localdir, $fullpath))
                die('<span style="color:red;font-weight:bold;">Failed</span>');
            $localdir = ROOT_PATH . "/csv/yahoo/";
            #luu log
            $logdir = ROOT_PATH . "/log/csv/yahoo/";
            recurse_copy($localdir,$logdir);
            #end luu log
            if (!ImageUtil::moveFolderImg($_server,$_user_name,$_user_pass,$localdir, $fullpath))
                die('<span style="color:red;font-weight:bold;">Failed</span>');
            session_destroy();
            if ($ishave == 0)
                die('<span style="color:red;font-weight:bold;">カテゴリー見つかりません</span>');
            if ($price == 0)
                die('<span style="color:red;font-weight:bold;">original price or price is empty</span>');


        }    
    }   
    public static function postProductRakuten($params){
        $prd_detail_extend = '';
        $str_ext_detail = '';
        switch ($_POST['rd_prod_detail']){
            case 1:
                $prd_detail_extend = $row['product_detail'];
                $str_ext_detail = 'product_detail';
            break;
            case 2:
                $prd_detail_extend = $row['product_type'];
                $str_ext_detail = 'product_type';
            break;
            case 3:
                $prd_detail_extend = $row['product_detail_num'];
                $str_ext_detail = 'product_detail_num';
            break;
        }
        $sql = 'select '.$str_ext_detail.' from product_details where product_id = ' . $row['product_id'];
        $database = new OBJDATABASE();
        $arraytype = $database->query($sql);
        
        $arraytype = ConvertArrayData($arraytype,$str_ext_detail);
        if (sizeof($arraytype) > 1)
            $title = $title_zen = $row['product_name'] . ' ' . $row['product_brand'];
        else
            $title = $title_zen = $prd_detail_extend . ' ' . $row['product_name'] . ' ' . $row['product_brand'];
        #Get All data CSV
        $insertArr = array();
        switch ($row['get_site']){
            case 1:
                $prefix_site = 'ns-';
                break;
            case 2:
                $prefix_site = 'sd-';
                break;
        }
        $database = new OBJDATABASE(2);
        $maker = $row['product_maker'];

        $sql = 'SELECT * FROM maker WHERE no = ' .$maker ;
        $result = $database->query($sql);
        $arrmaker = ConvertArrayList($result);
        $maker_name = $arrmaker[$maker];
        $shire = $row['product_supplier'];

        
        for($i=1;$i<=10;$i++){
            $insertArr = array_merge($insertArr,array("img$i" => $GLOBALS['SETTING']['rakuten']['domain'] . $row['img_' . $i]));
        }
        $description = '';
        //    
        if (isset($_POST['introduce_sd']) && $_POST['introduce_sd'] != '' && $row['introduce'] != '')
            $description .= '商品説明' . '<br>' . nl2br($row['introduce']) . '<br><br>';
        if (isset($_POST['goods_lots_sd']) && $_POST['goods_lots_sd'] != '' && $row['goods_lots_sd'] != '')
            $description .= '出荷' . '<br>' . nl2br($row['goods_lots_sd']) . '<br><br>';
        if (isset($_POST['size_and_capacity_sd']) && $_POST['size_and_capacity_sd'] != '' && $row['size_and_capacity'] != '')
            $description .= 'サイズ・容量' . '<br>' . nl2br($row['size_and_capacity']) . '<br><br>';
        if (isset($_POST['standard_sd']) && $_POST['standard_sd'] != '' && $row['standard'] != '')
            $description .= '規格' . '<br>' . nl2br($row['standard']) . '<br><br>';
        if (isset($_POST['note_sd']) && $_POST['note_sd'] != '' && $row['note'] != '')
            $description .= '注意事項' . '<br>' . nl2br($row['note']) . '<br><br>';
        //     
        if (isset($_POST['introduce_netsea']) && $_POST['introduce_netsea'] != '' && $row['introduce'] != '')
            $description .= '商品紹介' . '<br>' . nl2br($row['introduce']) . '<br><br>';
        if (isset($_POST['product_brand_netsea']) && $_POST['product_brand_netsea'] != '' && $row['product_brand'] != '')
            $description .= 'ブランド名' . '<br>' . nl2br($row['product_brand']) . '<br><br>';
        if (isset($_POST['size_and_capacity_netsea']) && $_POST['size_and_capacity_netsea'] != '' && $row['size_and_capacity'] != '')
            $description .= 'サイズ･容量' . '<br>' . nl2br($row['size_and_capacity']) . '<br><br>';
        if (isset($_POST['standard_netsea']) && $_POST['standard_netsea'] != '' && $row['standard'] != '')
            $description .= '規格' . '<br>' . nl2br($row['standard']) . '<br><br>';
        if (isset($_POST['note_netsea']) && $_POST['note_netsea'] != '' && $row['note'] != '')
            $description .= '注意事項' . '<br>' . nl2br($row['note']) . '<br><br>';
        if (isset($_POST['terms_of_delivery_netsea']) && $_POST['terms_of_delivery_netsea'] != '' && $row['terms_of_delivery_netsea'] != '')
            $description .= '出荷条件' . '<br>' . nl2br($row['terms_of_delivery_netsea']) . '<br><br>';
        $update_date = date('YmdHis');
        $description = ereg_replace('[[:space:]]+', ' ', trim($description));
        #END
        $csvarray_file_item = array();
        $csvarray_file_select = array();
        $daytime = DateUtil::dateFormat($row['time_get'],'Y-m-d H:i:s','Ymd');
        switch ($GLOBALS["MASTER"]['get_site'][$row['get_site']]){
            case 'netsea':
                $seconddir = "net_" . $row['product_num'];
                break;
            case 'superdelivery':
                $seconddir = "sd_" . $row['product_num'];
                break;
        }
        if ((int)$prdid == (int)array_keys($arritem)[0]){
            session_destroy();
            session_start();
            $_SESSION['arrprd'] = array();
            $_SESSION['count_item'] = 0;
            $csvarray_file_select[] = array('項目選択肢用コントロールカラム','商品管理番号（商品URL）','選択肢タイプ','Select/Checkbox用項目名','Select/Checkbox用選択肢');
            deleteDirectory(ROOT_PATH . "/csv/rakuten/");
            mkdir(ROOT_PATH . "/csv/rakuten/");
            $file_item = fopen(ROOT_PATH . "/csv/rakuten/$maker"."_item.csv", 'w');
            $file_select = fopen(ROOT_PATH . "/csv/rakuten/$maker"."_select.csv", 'w');
        }
        else
        {
            $file_item = fopen(ROOT_PATH . "/csv/rakuten/$maker"."_item.csv", 'a+');
            $file_select = fopen(ROOT_PATH . "/csv/rakuten/$maker"."_select.csv", 'a+');

        }

        ##Check exist category id 
        $ishave = 0;
        $get_site = $row['get_site'];
        $arrcate = CommonData::getArrayAllCate($row['category'],$get_site,$ishave);
        if ($ishave == 0){
            if ((int)$prdid == (int)array_keys($arritem)[sizeof($arritem) - 1])
                goto nocategory;
            else
                die('<span style="color:red;font-weight:bold;">カテゴリー見つかりません</span>');
        }
        ##End Check exist category id    
        ##Get And Check Price
        $price = $_POST['pricesale_' . $row['prd_detail_id']] ;
        /*if ($_POST['price_type'] == '2')
            $originalprice = $row['pd_trade_direct_price'];
        if ($_POST['price_type'] == '1')
            $originalprice = $row['pd_trade_price'];*/
        $normal_price = $row['pd_trade_direct_price'] * $GLOBALS['TAX'];
        if ($price == 0){
            if ((int)$prdid == (int)array_keys($arritem)[sizeof($arritem) - 1])
                goto originalprice;
            else
                die('<span style="color:red;font-weight:bold;">original price or price is empty</span>');
        }
        ##End Get And Check Price
        if (!in_array($row['product_id'], $_SESSION['arrprd'])) {
            if (empty($_SESSION['arrprd']))
                $csvarray_file_item[] = array('コントロールカラム','商品管理番号（商品URL）','商品番号','全商品ディレクトリID','タグID','PC用キャッチコピー','モバイル用キャッチコピー','商品名','販売価格','表示価格','PC用商品説明文','モバイル用商品説明文','スマートフォン用商品説明文','PC用販売説明文','商品画像URL','送料','個別送料','共通説明文（大）','在庫切れ時納期管理番号','倉庫指定');
            
            $category_rakuten = $arrcate['rakuten_cateid'];
            
                
            array_push($_SESSION['arrprd'],$row['product_id']);
            $_SESSION['count_item'] = (int)$_SESSION['count_item'] + (int)$row['totalimg'];
            $folder_number = ceil($_SESSION['count_item']/1000);
            $_SESSION[$row['product_id'] . 'obj'] = $row;
            ##process $file_item
            $special = '<div style="text-align:center;width:720px;margin:auto;padding:10px;">';
            for ($img=1;$img <= 10; $img++){
                if (!empty($row['img_' . $img])){
                    $imgs = explode('/',$row['img_' . $img]);
                    $imgend = $imgs[sizeof($imgs) - 1];
                    $special .= "<img src=".$GLOBALS['SETTING']['rakuten']['domain'] . "/$maker"."_"."$folder_number/" . $imgend."><br>";
                }
            }
            //<img src=http://image.rakuten.co.jp/nigaoe-komachi/画像URL><br>
            $special .= '</div><table style="border-top:solid 1px #C8C7C2;border-bottom:solid 1px #C8C7C2;width:97%;margin:auto;line-height:1.2em;font-size:1.2em;"><tr><td style="width:120px;vertical-align:top;"><img src="http://image.rakuten.co.jp/nigaoe-komachi/cabinet/goods_mark.jpg" width="17" height="14" alt="" class="default_mark">商品特徴</td><td> <table cellspacing="0" cellpadding="0"><tr><td><div class="ex_td"><b style=color:red;>※この商品はメーカー直送品のため、代金引換でのご注文はご利用いただけません。代金引換でご注文頂いた場合は、銀行振込に変更してご入金依頼をさせて頂きますことご了承ください。 </b><br><br>' . $description . '</div></td></tr></table></td></tr></table>';
            $imgs = explode('/',$row['product_img_search']);
            $imgend = $imgs[sizeof($imgs) - 1];
            $img_search = $GLOBALS['SETTING']['rakuten']['domain'] . "/$maker"."_"."$folder_number/" . $imgend;
            $minfree = (isset($_POST['minfree']) && (int)$_POST['minfree'] > 0) ? (int)$_POST['minfree'] : 0;
            $postage = (isset($_POST['postage']) && $_POST['postage'] != '') ? (int)$_POST['postage'] : 0;
            $isfree = 0;
            if ($price > $minfree) 
                $isfree = 1;
            else
                $isfree = 0;
            $postage = $isfree == 1 ? '' : $postage;
            $JAN = $row['product_detail_jan'];
            $title = FunctionString::RemoveString($title,'JAN：' . $JAN);
            if ($isfree == 1)
               $title = '【送料無料】' . $title; 
            $description_mobi = word_limit($description,450);
            
            
            $strcate = CommonData::getStrCate12($row['category'],$get_site);
            ##end xu ly category

            $csvarray_file_item[] = array('n',$prefix_site . $row['product_id'],$prefix_site . $row['product_id'],$category_rakuten,'','[' . $row['fix_category'] . ']' . $strcate,'[' . $row['fix_category'] . ']' . $strcate,$title,$price,$normal_price,$description,$description_mobi,$description_mobi,$special,$img_search,$isfree,$postage,'照明用',"1","1");
            //chua ro $special,850(個別送料),送料,共通説明文（大）("ten category"),,在庫切れ時納期管理番号("1") 
            $csvarray_file_item = encodeSJIScsvarray($csvarray_file_item);
            foreach ($csvarray_file_item as $fields) {
                fputcsv($file_item, $fields);
            }
            fclose($file_item);
            ##End

        }
        $prd_id = $row['product_id']; 
        $sql = 'SELECT count(prd_detail_id) as total from product_details where product_id = ' . $prd_id;
        $database = new OBJDATABASE();
        $result = $database->query($sql);
        foreach ($result as $rs){
            $total_row = $rs['total'];
        }
        if ((int)$total_row > 1){
            ##Process $file_select
            $csvarray_file_select[] = array('n',$prefix_site . $row['product_id'],'s','商品タイプ',$prd_detail_extend);
            $csvarray_file_select = encodeSJIScsvarray($csvarray_file_select);
            foreach ($csvarray_file_select as $fields) {
                fputcsv($file_select, $fields);
            }
            fclose($file_select);

            //if ((int)$prdid == (int)array_keys($arritem)[sizeof($arritem) - 1]) {

            //}
            ##End process file select
        }
        $database = new OBJDATABASE();
        $insertArr = array();
        $insertArr['save_rakuten'] = 1;
        $insertArr['rakuten_transfer_time'] = date('Y-m-d H:i:s');
        $priceformula = $this->priceformula();

        $insertArr['priceformula'] = $priceformula;
        $database->UpdateData('product_details',$insertArr,array('prd_detail_id'=>$row['prd_detail_id']));
        originalprice:
        nocategory:
        if ((int)$prdid == (int)array_keys($arritem)[sizeof($arritem) - 1]) {
            $localdir = ROOT_PATH . "/csv/rakuten/";
            $fullpath = "/ritem/batch/";
            $_server =  $GLOBALS['SETTING']['rakuten']['server_ftp'];
            $_user_name = $GLOBALS['SETTING']['rakuten']['user_name'];
            $_user_pass = $GLOBALS['SETTING']['rakuten']['user_pass'];
            #luu log
            $logdir = ROOT_PATH . "/log/csv/rakuten/";
            recurse_copy($localdir,$logdir);
            #end luu log
            if (!ImageUtil::moveCSV($_server,$_user_name,$_user_pass,$localdir, $fullpath))
                die('<span style="color:red;font-weight:bold;">Failed</span>');
            $_SESSION['count_item'] = 0;    
            foreach ($_SESSION['arrprd'] as $prdob){
                switch ($GLOBALS["MASTER"]['get_site'][$_SESSION[$prdob . 'obj']['get_site']]){
                    case 'netsea':
                        $seconddir = "net_" . $_SESSION[$prdob . 'obj']['product_num'];
                        break;
                    case 'superdelivery':
                        $seconddir = "sd_" . $_SESSION[$prdob . 'obj']['product_num'];
                        break;
                }
                $_SESSION['count_item'] = (int)$_SESSION['count_item'] + $_SESSION[$prdob . 'obj']['totalimg'];
                $folder_number = ceil($_SESSION['count_item']/1000);
                $localdir = ROOT_PATH . "/img/$daytime/$seconddir/";
                $photodir = "/cabinet/images/$maker"."_"."$folder_number/";
                $fullpath = "/cabinet/images/$maker"."_"."$folder_number/";
                $_server = $GLOBALS['SETTING']['rakuten']['server_ftp'];
                $_user_name = $GLOBALS['SETTING']['rakuten']['user_name'];
                $_user_pass = $GLOBALS['SETTING']['rakuten']['user_pass'];
                if (!ImageUtil::moveFolder($_server,$_user_name,$_user_pass,$localdir, $fullpath, $photodir))
                    die('<span style="color:red;font-weight:bold;">Failed</span>');
            }
            session_destroy();
            if ($ishave == 0)
                die('<span style="color:red;font-weight:bold;">カテゴリー見つかりません</span>');
            if ($price == 0)
                die('<span style="color:red;font-weight:bold;">original price or price is empty</span>');
        }    
    }   
    public static function postProductAmazon($params){
        
    } 
}
