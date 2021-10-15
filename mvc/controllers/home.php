<?php 
class home extends Controllers {
    public function sayHi()
    {
        //Database
        $model = $this->callModel('tryConnect');
        $array = $model->list();

        //View
        $this->callView('login', [
            'arr' => $array,
            'css_file' => '/facebook_mini/public/css/login.css',
            'title' => 'Login Form',
        ]);
    }
    public function xyz()
    {
        //Database
        $model = $this->callModel('tryConnect');
        $array = $model->list();

        //Show Data of Fetched Database
        $this->structure($array);

        //View the Data
        $this->callView('login', [
            'arr' => $array
        ]);
    }
    
    public function sum($arr)
    {
        $tong = 0;
        foreach($arr as $val) {
            $tong += $val;
        }
        echo $tong;
    }
}
?>