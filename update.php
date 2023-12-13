<?php
include "../connection.php";

    $mhsNpm       = $_POST['mhsNpm'];
    $mhsNama   = $_POST['mhsNama'];
    $mhsAlamat       = $_POST['mhsAlamat'];
    $mhsFakultas       = $_POST['mhsFakultas'];
    $MhsProdi       = $_POST['MhsProdi'];


$sql = "
        UPDATE mahasiswa 
        SET 
        mhsNama = '$mhsNama'
        ,mhsAlamat = '$mhsAlamat'
        ,mhsFakultas = '$mhsFakultas'
        ,MhsProdi = '$MhsProdi'
        WHERE
        mhsNpm = '$mhsNpm'
        ";

$result = $connect->query($sql);
echo json_encode(array(
    "success" => $result
));
