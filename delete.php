<?php
include "../connection.php";

$mhsNpm = $_POST['mhsNpm'];

$sql = "
        DELETE FROM mahasiswa 
        WHERE
        mhsNpm = '$mhsNpm'
        ";
$result = $connect->query($sql);

echo json_encode(array(
    "success" => $result
));

?>