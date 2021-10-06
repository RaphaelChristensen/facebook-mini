<?php 
class DB {
    protected const DB_HOST = '127.0.0.1';
    protected const DB_USER = 'root';
    protected const DB_PASSWORD = 'Welcome123#@';
    protected const DB_NAME = 'facebook_mini';

    public $pdo = null;

    public function __construct()
    {
        try {
            $conStr = sprintf('mysql:host=%s;dbname=%s', self::DB_HOST, self::DB_NAME);
            $this->pdo = new PDO($conStr, self::DB_USER, self::DB_PASSWORD);

            $this->pdo->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
            $this->pdo->setAttribute(
                PDO::ATTR_ERRMODE,
                PDO::ERRMODE_EXCEPTION
            );
        } catch (Exception $ex) {
            die('Could NOT connect to Database') . $ex->getMessage();
        }
    }

    public function __destruct()
    {
        $this->pdo = null;
    }
}
