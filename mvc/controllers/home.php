<?php 
class home extends Controllers {
    public function sayHi()
    {
        $model = $this->callModel('tryConnect');

        $array = $model->list();

        $this->structure($array);

        $this->callView('master1', [
            'arr' => $array
        ]);
    }
    public function xyz()
    {
        echo 'HOME - xyz';
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