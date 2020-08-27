
<?php

include "db.php";
$res = array("error" => false);

$action = "read";


if (isset($_GET["action"])) {
    $action = $_GET["action"];
}

if ($action == "read") { $result = $conn->query("SELECT * FROM `familias`");
        $datos = array();
        while ($row = $result->fetch_assoc()) {
            array_push($datos, $row);
        }

        $res["datos"] = $datos;
    
    
}
// Create form

if ($action == "create") {

    $familia= $_POST['familia'];


    $result = $conn->query("INSERT INTO familias(familia) VALUES ('$familia')");


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
    $idFam= $_POST['idFam'];
 $familia= $_POST['familia'];


    $result = $conn->query("UPDATE familias SET familia ='$familia' WHERE idFam ='$idFam' ");

    if ($result) {
        $res["message"] = "dato actualizado con éxito";
    } else {
        $res["error"] = true;
        $res["error"] = "dato no se actualizo con éxito";
    }
}

// end of update form

if ($action == "delete") {
    $idFam = $_POST['idFam'];

    $result = $conn->query("DELETE FROM `familias` WHERE idFam ='$idFam' ");

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
