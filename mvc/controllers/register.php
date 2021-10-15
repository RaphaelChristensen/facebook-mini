<?php 
class register extends Controllers {
    public function sayHi()
    {
        //Database
        $model = $this->callModel('tryConnect');
        $array = $model->list();

        //View
        $this->callView('register', [
            'arr' => $array,
            'title' => 'Register Form',
            'css_file' => '/facebook_mini/public/css/register.css',
            'js_file' => '/facebook_mini/public/js/registerForm.js',
        ]);
    }
}
?>