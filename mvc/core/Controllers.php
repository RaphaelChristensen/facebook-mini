<?php 
class Controllers {
    protected $back_end_mvc = '/var/www/html/facebook_mini/mvc/';

    public function callModel($model_name)
    {
        require_once $this->back_end_mvc . 'models/' . $model_name . '.php';

        return new $model_name;
    }

    public function callView($view_name, $data = [])
    {
        require_once $this->back_end_mvc . 'views/' . $view_name . '.php';
    }

    public function structure($arr)
    {
        echo '<pre>';
        print_r($arr);
        echo '</pre>';
    }
}
