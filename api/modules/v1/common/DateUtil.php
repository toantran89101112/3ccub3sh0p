<?php
namespace api\modules\v1\common;
class DateUtil {

	public static function getCurrentDatetime($format = "Y-m-d H:i:s") {
		return date($format);
	}

	public static function getLastDateOfMonth($date) {
        return date("Y-m-t", strtotime($date));
    }

	public static function dateFromString($value, $format) {
		return DateTime::createFromFormat($format, $value);
	}

	public static function dateToArray($value, $format="Y-m-d", $isNowIfEmpty = false) {

		if(StringUtil::isNullOrEmpty($value)) {
            if ($isNowIfEmpty == true)
                return array(
                        "year" => date('Y')
                        , "month" => date('m')
                        , "day" => date('d')
                    );
			return array(
						"year" => ""
						, "month" => ""
						, "day" => ""
					);
		}
		$arrDate = explode("-", $value);
    	return array(
            "year" => $arrDate[0]
            , "month" => $arrDate[1]
            , "day" => $arrDate[2]
        );
	}
    
    public static function dateFormat($strdate, $currentformat, $format = 'Y-m-d H:i:s'){
        $date = DateUtil::dateFromString($strdate , $currentformat);
        if (!$date)
            return $strdate;
        return $date->format($format);
    }
    
    public static function yearmonthFormat($yearmonth){
        $yearmonth = substr($yearmonth, 0, 4) . '年' . substr($yearmonth, 4,2) . '月';
        return $yearmonth;
    }

    public static function PreviewDate($date){
        if(!StringUtil::isNullOrEmpty($date))
        {
            $date = str_replace('/', '-', $date);
            $dateArray = explode('-', $date);
            return $dateArray[0]."年&nbsp;". $dateArray[1].'月&nbsp;'.$dateArray[2].'日&nbsp;';
        }
        return null;
    }
    /* this function subtract(add) month of date by value
       date is String(yyyy-mm-dd)
       action (+,-);
       value 1..11
       return date(yyyy-mm-dd) affter calculate
    */
    public static function SubAddMonth($date,$action,$value){
        $date = new DateTime($date);
        $date->modify("$action$value month");
        return $date->format('Y-m-d');
    }
	
}


?>