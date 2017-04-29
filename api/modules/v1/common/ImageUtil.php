<?php
    namespace api\modules\v1\common;
    class ImageUtil
    {

        function __construct()
        {

        }
        public static function saveImage($path,$fullpath,$urlimage){
            checkPath($path);
            $data = file_get_contents($urlimage);
            return file_put_contents($fullpath,$data);
        }
        public static function recreate($_server, $_user_name, $_user_pass,$remotefile){
            // set up basic connection
            $_conn_id = ftp_connect($_server);
            // login with username and password
            $_login_result = ftp_login($_conn_id, $_user_name, $_user_pass);

            // check connection
            if ((!$_conn_id) || (!$_login_result)) {
                die('1');
                $_error = "FTP connection has failed!";
                $_error .= "Attempted to connect to $_server for user $_user_name";
                $result = false;
            } else {
                $_error = "Connected to $_server, for user $_user_name";
                $result = true;
            }
            $conn_id = $_conn_id;
            if (@ftp_chdir($conn_id,$remotefile)){
                @ftp_rmdir($conn_id, $remotefile);
            }
        }
        public static function moveFile($_server, $_user_name, $_user_pass, $localfile, $remotefile, $remotepath)
        {
            $ftp_conn = ftp_connect($_server) or die("Could not connect to $_server");
            $login = ftp_login($ftp_conn, $_user_name, $_user_pass);


            // upload file
            ftp_chdir($ftp_conn, $remotepath);
            try {
                ftp_put($ftp_conn, $remotefile, $localfile, FTP_ASCII);
            } catch (Exception $e) {
                echo   $e->getMessage();die;
            }

            // close connection
            ftp_close($ftp_conn);

        }
        public static function moveFolderImg($_server, $_user_name, $_user_pass, $local_dir, $remote_dir) {
            // set up basic connection
            $_conn_id = ftp_connect($_server);
            // login with username and password
            $_login_result = ftp_login($_conn_id, $_user_name, $_user_pass);

            // check connection
            if ((!$_conn_id) || (!$_login_result)) {
                die('1');
                $_error = "FTP connection has failed!";
                $_error .= "Attempted to connect to $_server for user $_user_name";
                $result = false;
            } else {
                $_error = "Connected to $_server, for user $_user_name";
                $result = true;
            }
            $conn_id = $_conn_id;
            if (!@ftp_chdir($conn_id,$remote_dir)){
                @ftp_mkdir($conn_id, $remote_dir);
            }

            @ftp_pasv($conn_id, true);
            $handle = opendir($local_dir);
            while (($file = readdir($handle)) !== false) {
                if (($file != '.') && ($file != '..')) {
                    if (is_dir($local_dir . $file)) {
                        //recursive call
                        self::moveFolder($conn_id, $local_dir . $file . '/', $remote_dir . $file . '/');
                    } else
                        $f[] = $file;
                }
            }
            closedir($handle);
            if (count($f)) {
                sort($f);
                ftp_chdir($conn_id, $remote_dir);
                foreach ($f as $files) {
                    $from = fopen("$local_dir$files", 'r');
                    $i = 1;
                    upload:
                    $moveFolder = ftp_fput($conn_id, $files, $from, FTP_BINARY);
                    // check upload status
                    if (!$moveFolder) {
                        /*if ($i<=3)
                        {
                        $i++;
                        goto upload;
                        }*/
                        //echo "FTP upload has failed! From: " . $local_dir . " To: " . $remote_dir . "<br>";
                        $result = false;
                    } else {
                        //echo  "Uploaded $local_dir to $remote_dir as" . $_server . "<br>";
                        $result = true;
                    }
                }
            }
            return $result;


        }
        public static function moveCSV($_server, $_user_name, $_user_pass, $local_dir, $remote_dir) {
            // set up basic connection
            $_conn_id = ftp_connect($_server);
            // login with username and password
            $_login_result = ftp_login($_conn_id, $_user_name, $_user_pass);

            // check connection
            if ((!$_conn_id) || (!$_login_result)) {
                die('1');
                $_error = "FTP connection has failed!";
                $_error .= "Attempted to connect to $_server for user $_user_name";
                $result = false;
            } else {
                $_error = "Connected to $_server, for user $_user_name";
                $result = true;
            }
            $conn_id = $_conn_id;
            if (!@ftp_chdir($conn_id,$remote_dir)){
                @ftp_mkdir($conn_id, $remote_dir);
            }

            @ftp_pasv($conn_id, true);
            $handle = opendir($local_dir);
            while (($file = readdir($handle)) !== false) {
                if (($file != '.') && ($file != '..')) {
                    if (is_dir($local_dir . $file)) {
                        //recursive call
                        self::moveFolder($conn_id, $local_dir . $file . '/', $remote_dir . $file . '/');
                    } else
                        $f[] = $file;
                }
            }
            closedir($handle);
            if (count($f)) {
                sort($f);
                ftp_chdir($conn_id, $remote_dir);
                foreach ($f as $files) {
                    $from = fopen("$local_dir$files", 'r');
                    $i = 1;
                    upload:
                    $moveFolder = ftp_fput($conn_id, $files, $from, FTP_BINARY);
                    // check upload status
                    if (!$moveFolder) {
                        /*if ($i<=3)
                        {
                        $i++;
                        goto upload;
                        }*/
                        //echo "FTP upload has failed! From: " . $local_dir . " To: " . $remote_dir . "<br>";
                        $result = false;
                    } else {
                        //echo  "Uploaded $local_dir to $remote_dir as" . $_server . "<br>";
                        $result = true;
                    }
                }
            }
            return $result;


        }
        public static function moveFolder($_server, $_user_name, $_user_pass, $local_dir, $remote_dir, $photodir) {
            // set up basic connection
            $_conn_id = ftp_connect($_server);
            // login with username and password
            $_login_result = ftp_login($_conn_id, $_user_name, $_user_pass);

            // check connection
            if ((!$_conn_id) || (!$_login_result)) {
                die('1');
                $_error = "FTP connection has failed!";
                $_error .= "Attempted to connect to $_server for user $_user_name";
                $result = false;
            } else {
                $_error = "Connected to $_server, for user $_user_name";
                $result = true;
            }
            $conn_id = $_conn_id;
            if ($remote_dir == $photodir)
            {
                if (!@ftp_chdir($conn_id,$remote_dir)){
                    @ftp_mkdir($conn_id, $remote_dir);
                }
            }
            else
            {
                if (!@ftp_chdir($conn_id,$photodir)){
                    @ftp_mkdir($conn_id, $photodir);
                }
                if (@ftp_chdir($conn_id,$remote_dir))
                    @ftp_rmdir($conn_id,$remote_dir);
                @ftp_mkdir($conn_id, $remote_dir);
            }

            @ftp_pasv($conn_id, true);
            $handle = opendir($local_dir);
            if ($handle == false){
                echo '<span style="color:red;font-weight:bold;">No Image - </span>';
                return false;
            }
            while (($file = readdir($handle)) !== false) {
                if (($file != '.') && ($file != '..')) {
                    if (is_dir($local_dir . $file)) {
                        //recursive call
                        self::moveFolder($conn_id, $local_dir . $file . '/', $remote_dir . $file . '/');
                    } else
                        $f[] = $file;
                }
            }
            closedir($handle);
            if (count($f)) {
                sort($f);
                ftp_chdir($conn_id, $remote_dir);
                foreach ($f as $files) {
                    $from = fopen("$local_dir$files", 'r');
                    $i = 1;
                    upload:
                    $moveFolder = ftp_fput($conn_id, $files, $from, FTP_BINARY);
                    // check upload status
                    if (!$moveFolder) {
                        /*if ($i<=3)
                        {
                        $i++;
                        goto upload;
                        }*/
                        //echo "FTP upload has failed! From: " . $local_dir . " To: " . $remote_dir . "<br>";
                        $result = false;
                    } else {
                        //echo  "Uploaded $local_dir to $remote_dir as" . $_server . "<br>";
                        $result = true;
                    }
                }
            }
            return $result;


        }
    }
?>