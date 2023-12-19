<?php 
    include "../connection.php";

    $sql = "";

    $result = $connect->query($sql);
    
    if($result->num_rows > 0){
       $mahasiswa = array();
       while($row = $result->fetch_assoc()){
        $mahasiswa[] = $row;
       }

       echo json_encode(array(
        "success"=> true,
        "mahasiswa"=>$mahasiswa,
       ));
    }else{
    echo json_encode(array(
        "success" => false,
    ));
    }
?>

    
