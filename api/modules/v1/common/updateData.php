<?php
    namespace api\modules\v1\common;
    class OBJDATABASE
    {
        private $stmt;
        private $dbh;
        function __construct($int = 1)
        {
            include(ROOT_PATH . '/config/config.php');
            switch ($int){
                case 1:
                    $this->dbh = $dbh;
                break;
                case 2:
                    $this->dbh = $dbh2;
                break;
            }
        }
        public function CheckData(){

        }
        public function InsertData($table, $params, $uniqueparams = array(), $keyid = 'item_id',$isedit=0){
            $querycount = 0;
            if ($uniqueparams != array())
            {
                $keytable = null;
                $where = '';
                foreach ($uniqueparams as $key => $value){
                    $value_after =  $this->convert_value($value,$isedit);
                    $keytable = $key;
                    $where .= ($where == '') ? "$key = '$value_after'" : " AND $key = '$value_after'";
                }
                $sql = "select $keyid from $table where $where";
                $this->stmt = $this->dbh->prepare($sql);
                $this->stmt->execute();
                $result = $this->stmt->fetch(PDO::FETCH_ASSOC);
                $keyid = ($result != array() && isset($result[$keyid]) && $result[$keyid] != '') ? $result[$keyid] : '';
                $querycount =  ($keyid != '') ? 1 : 0;
            }
            if ($querycount == 0){
                $sql_value = '';
                $sql_key = '';
                foreach($params as $key => $value){
                    $value_after =  $this->convert_value($value,$isedit);
                    $sql_key .= ($sql_key == '') ? $key : ",".$key;
                    $sql_value .= ($sql_value == '') ? "'".$value_after."'" : ",'".$value_after."'";
                }
                $sql = "insert into $table ($sql_key) values ($sql_value)";
                $this->stmt = $this->dbh->prepare($sql);
                $this->stmt->execute();
                $lastId = $this->dbh->lastInsertId();
                return $lastId;
            }
            else
            {
                $this->UpdateData($table,$params,$uniqueparams,$isedit);
                return $keyid;
            }
        }
        public function UpdateData($table,$params,$uniqueparams = array(), $isedit=0){
            //UPDATE table_name
            //        SET column1=value1,column2=value2,...
            //        WHERE some_column=some_value;
            if ($uniqueparams != array())
            {
                $keytable = null;
                $where = '';
                foreach ($uniqueparams as $key => $value){
                    $value_after =  $this->convert_value($value,$isedit);
                    $keytable = $key;
                    $where .= ($where == '') ? "$key = '$value_after'" : " AND $key = '$value_after'";
                }

            }
            $set = '';
            foreach ($params as $key => $value){
                $value_after =  $this->convert_value($value,$isedit);
                $set .= ($set == '') ? "$key='$value_after'" : ",$key='$value_after'";
            }
            $sql = "UPDATE $table SET $set where $where";
            $this->stmt = $this->dbh->prepare($sql);
            $this->stmt->execute();
        }
        public function query($sql){
            $this->stmt = $this->dbh->prepare($sql);
            $this->stmt->execute();
            return $this->stmt;
        }
        public function convert_value($value,$isedit=0){
            $value =  trim(html_entity_decode($value)) ;
            $value = ereg_replace("'", "&#039;", $value);
            $value = ereg_replace("&", "&amp;", $value);
            $value = ereg_replace("\"", "&quot;", $value);
            $value = str_replace('&nbsp;',' ',$value);
            if ($isedit == 0)
                $value = ereg_replace('[[:space:]]+', ' ', trim($value));
            $value = ConvertHtml($value);
            //$value = mysql_escape_string($value);
            return $value;
        }

    }
?>