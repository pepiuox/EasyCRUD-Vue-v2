
<?php

include "config.php";
$res = array("error" => false);

$action = "read";


if (isset($_GET["action"])) {
    $action = $_GET["action"];
}

if ($action == "read") { $result = $conn->query("SELECT * FROM `grupos`");
        $datos = array();
        while ($row = $result->fetch_assoc()) {
            array_push($datos, $row);
        }

        $res["datos"] = $datos;
    
    
}
// Create form

if ($action == "create") {

    $nombre_grupo= $_POST['nombre_grupo'];


    $result = $conn->query("INSERT INTO grupos(nombre_grupo) VALUES ('$nombre_grupo')");


    if ($result) {
        $res["message"] = "dato agregado exitosamente";
    } else {
        $res["error"] = true;
        $res["message"] = "dato no se agrego exitosamente";
    }

    // $res["datos"] =$datos;
}
// end of create form
// update form

if ($action == "update") {
    $idGrp= $_POST['idGrp'];
 $nombre_grupo= $_POST['nombre_grupo'];


    $result = $conn->query("UPDATE grupos SET nombre_grupo ='$nombre_grupo' WHERE idGrp ='$idGrp' ");

    if ($result) {
        $res["message"] = "dato actualizado con éxito";
    } else {
        $res["error"] = true;
        $res["error"] = "dato no se actualizo con éxito";
    }
}

// end of update form

if ($action == "delete") {
    $idGrp = $_POST['idGrp'];

    $result = $conn->query("DELETE FROM `grupos` WHERE idGrp ='$idGrp' ");

    if ($result) {
        $res["message"] = "dato borrado exitosamente";
    } else {
        $res["error"] = true;
        $res["message"] = "dato no se borro exitosamente";
    }
    // $res["datos"] =$datos;
}

$conn->close();
header("content-type:application/json");
echo json_encode($res);
die();
?>
