<?php
 $server="localhost";
 $usuario="root";
 $password="";
 $dataBase="apprender";

    try{
        $connection=new PDO("jdbc:mysql://localhost:3306/apprender" ,"root",""); 
    }catch(PDOExeptio $error){
        die('error en la conexion:',$e ->getMessage()); 
    }

?>