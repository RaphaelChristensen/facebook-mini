<?php
class App
{
    protected $back_end_mvc = '/var/www/html/facebook_mini/mvc/';

    protected $controller = 'home';
    protected $action = 'sayHi';
    protected $params = [];

    public function __construct()
    {
        $url = $this->urlProcessing();
        $arr = explode('/', $url);

        //controller
        if (file_exists($this->back_end_mvc . 'controllers/' . $arr[0] . '.php')) {
            $this->controller = $arr[0];
            unset($arr[0]);
        }

        require_once $this->back_end_mvc  . 'controllers/' . $this->controller . '.php';
        $this->controller = new $this->controller;


        //action
        if (isset($arr[1])) {
            if (method_exists($this->controller, $arr[1])) {
                $this->action = $arr[1];
                unset($arr[1]);
            }
        }

        //params
        $this->params = $arr ? array_values($arr) : [];
        // $arr == [] ? $this->params = [] : array_push($this->params, $arr);

        call_user_func_array([$this->controller, $this->action], $this->params);
    }

    public function urlProcessing()
    {
        return trim(trim($_GET['url'], '/'));
    }

    public function structure($arr)
    {
        echo '<pre>';
        print_r($arr);
        echo '</pre>';
    }
}
