<?php 
class tryConnect extends DB {
    public function list()
    {
        $sql = <<<EOSQL
            SELECT * FROM products
        EOSQL;

        $query = $this->pdo->prepare($sql);

        $query->execute();

        //Return an Array
        return $query->fetchAll();
    }
}
?>