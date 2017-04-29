<?php

namespace common\models;

use common\models\User;

class UserExt extends User
{
    public function getUsername($id)
    {
        if($id !='')
        {
            $user = User::find()->where(['id'=>$id])->one();
            $userName =  $user->username;
        }
        else
        {
            $userName = '';
        }
        return $userName;
        
    }
}
