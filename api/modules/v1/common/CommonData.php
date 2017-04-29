<?php
    namespace api\modules\v1\common;

    class CommonData
    {

        function __construct()
        {

        }
        public static function getStringAllCate($category_id,$get_site,$char = ':')
        {
            $arraycate = self::getArrayAllCate($category_id,$get_site);
            $cate = array();
            $cate[1] = self::getParentCate(convertCategory($arraycate['msys_cateid1']));
            $cate[2] = self::getCate(convertCategory($arraycate['msys_cateid1']),convertCategory($arraycate['msys_cateid2']));
            $cate[3] = self::getCate(convertCategory($arraycate['msys_cateid2']),convertCategory($arraycate['msys_cateid3']));
            $cate[4] = self::getCate(convertCategory($arraycate['msys_cateid3']),convertCategory($arraycate['msys_cateid4']));
            $str = '';
            for($int = 1;$int <= 4;$int++){
                $str .= $str == '' ? $cate[$int] : ($cate[$int] == '' ? $cate[$int] : $char . $cate[$int]);
            }
            return $str;
        }
        public static function getStrCate12($category_id,$get_site,$char = ' '){
            $arraycate = self::getArrayAllCate($category_id,$get_site);
            $cate[1] = self::getParentCate(convertCategory($arraycate['msys_cateid1']));
            $cate[2] = self::getCate(convertCategory($arraycate['msys_cateid1']),convertCategory($arraycate['msys_cateid2']));
            $str = '';
            for($int = 1;$int <= 2;$int++){
                $str .= $str == '' ? $cate[$int] : ($cate[$int] == '' ? $cate[$int] : $char . $cate[$int]);
            }
            return $str;
        }
        public static function getArrayAllCate($category_id,$get_site,&$ishave =0){
            $database = new OBJDATABASE(2);
            $sql = 'select * from merge_category where shire_cateid = ' . $category_id . ' AND type = ' . $get_site;
            $resultarr = $database->query($sql);
            $result = array();
            foreach ($resultarr as $rs)
            {
                $result = $rs;
                $ishave = 1;
            }
            return $result;
        }
        public static function getParentCate($category_id){
            $database = new OBJDATABASE(2);
            $sql = 'select name from category where no = "'.$category_id.'" and parent_or_no = "parent"';
            $resultarr = $database->query($sql);
            foreach ($resultarr as $rs){
                $str = $rs['name'];
            }
            return $str;
        }
        public static function getCate($category_id1,$category_id2){
            $database = new OBJDATABASE(2);
            $sql = 'select name from category where parent_or_no = "'.$category_id1.'" and no = "'.$category_id2.'"';
            $resultarr = $database->query($sql);
            $str = '';
            foreach ($resultarr as $rs){
                $str = $rs['name'];
            }
            return $str;
        }
        public static function getMaker(){
            $database = new OBJDATABASE(2);
            $sql = 'SELECT * FROM maker WHERE no = ' .$maker ;
            $result = $database->query($sql);
            $arrmaker = ConvertArrayList($result);
            return $arrmaker;
        }
    }
?>