<?php
    function  uploadfile($cuploadfile,$directory,$width=0,$height=0,$quality=100)
    {
        header("Content-Type: text/html; charset=utf-8"); 
        if (!empty($cuploadfile)) {
            checkPath($directory);
            $result = $cuploadfile->saveAs($directory.'/'.$cuploadfile->name);  
            if ($width != 0 && $height != 0){
                yii\imagine\Image::thumbnail($directory.'/'.$cuploadfile->name, $width, $height)
                ->save($directory.'/'.$cuploadfile->name, ['quality' => $quality]);
            }
            return $result;
        }
        return false;
    }
    function checkPath($directory) {   
        $parts = explode('/', rtrim($directory, '/'));
        $i = 0;                    

        $path = implode('/', array_slice($parts, 0, count($parts) - $i));     
        while (!file_exists($path)) {
            $i++;
            $path = implode('/', array_slice($parts, 0, count($parts) - $i));
        }
        $i--;         
        $path = implode('/', array_slice($parts, 0, count($parts) - $i));
        while ($i >= 0) {
            mkdir($path, 0777);
            $i--;
            $path = implode('/', array_slice($parts, 0, count($parts) - $i));
            //            $t = array_values($parts);
            //            array_splice($t, count($parts)-$i, $i);
            //            $path = implode('/', $t);
        }
    }
    function to_slug($str) {
        $str = trim(mb_strtolower($str));
        $str = preg_replace('/(à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ)/', 'a', $str);
        $str = preg_replace('/(è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ)/', 'e', $str);
        $str = preg_replace('/(ì|í|ị|ỉ|ĩ)/', 'i', $str);
        $str = preg_replace('/(ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ)/', 'o', $str);
        $str = preg_replace('/(ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ)/', 'u', $str);
        $str = preg_replace('/(ỳ|ý|ỵ|ỷ|ỹ)/', 'y', $str);
        $str = preg_replace('/(đ)/', 'd', $str);
        $str = preg_replace('/[^a-z0-9-\s]/', '', $str);
        $str = preg_replace('/([\s]+)/', '-', $str);
        return $str;
    }

    function DeleteD($path)
    {
        if (is_dir($path) === true)
        {
            $files = new RecursiveIteratorIterator(new RecursiveDirectoryIterator($path), RecursiveIteratorIterator::CHILD_FIRST);

            foreach ($files as $file)
            {
                if (in_array($file->getBasename(), array('.', '..')) !== true)
                {
                    if ($file->isDir() === true)
                    {
                        @rmdir($file->getPathName());
                    }

                    else if (($file->isFile() === true) || ($file->isLink() === true))
                    {
                        @unlink($file->getPathname());
                    }
                }
            }

            return @rmdir($path);
        }

        else if ((is_file($path) === true) || (is_link($path) === true))
        {
            return @unlink($path);
        }

        return false;
    }
    
    function ConvertArrayData($params,$str){
        $result = array();
        foreach ($params as $item){
            $result[] = $item[$str];
        }
        return $result;
    }

    
    
    function convertCategory($value){
        if ((int)$value == 0) 
            return '';
        elseif ((int)$value < 10)
            return '00' . $value; 
        else
            return '0' . $value;
    }
    function ConvertHtml($value){
        $value = str_replace('<p>&nbsp;</p>',"<br>",$value);
        $value = preg_replace("/<br.*?>/", "<br>", $value);
        $value = preg_replace("/<div>/", "<br>", $value);
        $value = preg_replace("/<p>/","<br>",$value);
        $value = str_replace('</p>',"",$value);
        $value = str_replace('</div>',"",$value);
        $value = str_replace('<br>',"\n",$value);
        $value = str_replace('<br/>',"\n",$value);
        $value = strip_tags($value);
        return $value;
    }
    function ConvertTag($value){
        $value = str_replace('<p>&nbsp;</p>',"<br>",$value);
        $value = preg_replace("/<br.*?>/", "<br>", $value);
        $value = preg_replace("/<div>/", "<br>", $value);
        $value = preg_replace("/<p>/","<br>",$value);
        $value = str_replace('</p>',"",$value);
        $value = str_replace('</div>',"",$value);
        return $value;
    }
    function ConvertArrayList($arrobject){
        $result = array();
        foreach ($arrobject as $object){
            $result[$object['no']] = $object['name'];
        }
        return $result;
    }
    function convertprdnum($str){
        return substr($str,3,strlen($str) - 6);
    }
    function convert_to ( $source, $target_encoding )
    {
    // detect the character encoding of the incoming file
    $encoding = mb_detect_encoding( $source, "auto" );
      
    // escape all of the question marks so we can remove artifacts from
    // the unicode conversion process
    $target = str_replace( "?", "[question_mark]", $source );
      
    // convert the string to the target encoding
    $target = mb_convert_encoding( $target, $target_encoding, $encoding);
      
    // remove any question marks that have been introduced because of illegal characters
    $target = str_replace( "?", "", $target );
      
    // replace the token string "[question_mark]" with the symbol "?"
    $target = str_replace( "[question_mark]", "?", $target );
  
    return $target;
    }
    function encodeSJIScsvarray($arrays){
        foreach ($arrays as &$array){
            foreach ($array as &$item){
                $item = convert_to($item,'SJIS');
                //$item = mb_convert_encoding($item, 'SJIS', 'UTF-8');
            }
        }
        return $arrays;
    }
    function word_limit($chuoi, $gioihan) {
        $chuoi = strip_tags($chuoi);
        if (strlen($chuoi) <= $gioihan) {
            return $chuoi;
        } else {
            /*
            so sánh vị trí cắt
            với kí tự khoảng trắng đầu tiên trong chuỗi ban đầu tính từ vị trí cắt
            nếu vị trí khoảng trắng lớn hơn
            thì cắt chuỗi tại vị trí khoảng trắng đó
            */
            if (strpos($chuoi, " ", $gioihan) > $gioihan) {
                $new_gioihan = strpos($chuoi, " ", $gioihan);
                $new_chuoi = substr($chuoi, 0, $new_gioihan) . "...";
                return $new_chuoi;
            }
            // trường hợp còn lại không ảnh hưởng tới kết quả
            $new_chuoi = substr($chuoi, 0, $gioihan) . "...";
            return $new_chuoi;
        }

    }
    function deleteDirectory($dir) {
        if (!file_exists($dir)) {
            return true;
        }

        if (!is_dir($dir)) {
            return unlink($dir);
        }

        foreach (scandir($dir) as $item) {
            if ($item == '.' || $item == '..') {
                continue;
            }

            if (!deleteDirectory($dir . DIRECTORY_SEPARATOR . $item)) {
                return false;
            }

        }

        return rmdir($dir);
    }
    function recurse_copy($src,$dst) { 
        $dir = opendir($src); 
        @mkdir($dst); 
        while(false !== ( $file = readdir($dir)) ) { 
            if (( $file != '.' ) && ( $file != '..' )) { 
                if ( is_dir($src . '/' . $file) ) { 
                    recurse_copy($src . '/' . $file,$dst . '/' . $file); 
                } 
                else { 
                    copy($src . '/' . $file,$dst . '/' . $file); 
                } 
            } 
        } 
        closedir($dir); 
    } 
    function removeAllSpace($string){
        $string = str_replace('　','',$string);
        $string = preg_replace('/\s+/', '', $string);
        return $string;
    }
    function base64_encode_image ($filename=string,$filetype=string) {
        if ($filename) {
            $imgbinary = fread(fopen($filename, "r"), filesize($filename));
            return 'data:image/' . $filetype . ';base64,' . base64_encode($imgbinary);
        }
    }
    function base64_decode_image($output_file=string,$base64_string = string, $path){
        if ($base64_string) {
            checkPath($path);
            $ifp = fopen($path.'/'.$output_file, "wb"); 
            $data = explode(',', $base64_string);
            fwrite($ifp, base64_decode($data[1])); 
            fclose($ifp);
            
        }
    }