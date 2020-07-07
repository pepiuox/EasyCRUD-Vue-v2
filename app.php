
<?php

include "config.php";
$res = array("error" => false);

$action = "read";


if (isset($_GET["action"])) {
    $action = $_GET["action"];
}

if ($action == "read") {
    $result = $conn->query("SELECT * FROM `productos`");
    $datos = array();
    while ($row = $result->fetch_assoc()) {
        array_push($datos, $row);
    }

    $res["datos"] = $datos;
}
// Create form

if ($action == "create") {

    $codigo= $_POST['codigo'];
 $unidad= $_POST['unidad'];
 $capacidad= $_POST['capacidad'];
 $grupo= $_POST['grupo'];
 $sub_grupo= $_POST['sub_grupo'];
 $producto= $_POST['producto'];
 $puntos= $_POST['puntos'];
 $gerente= $_POST['gerente'];
 $asistente_gerente= $_POST['asistente_gerente'];
 $supevisor= $_POST['supevisor'];
 $asistente_supervisor= $_POST['asistente_supervisor'];
 $cliente_novus= $_POST['cliente_novus'];
 $descripcion= $_POST['descripcion'];
 $detalle= $_POST['detalle'];
 $uso_sugerido= $_POST['uso_sugerido'];
 $contenido= $_POST['contenido'];
 $ingredientes= $_POST['ingredientes'];
 $imagen= $_POST['imagen'];


    $result = $conn->query("INSERT INTO productos(codigo , unidad , capacidad , grupo , sub_grupo , producto , puntos , gerente , asistente_gerente , supevisor , asistente_supervisor , cliente_novus , descripcion , detalle , uso_sugerido , contenido , ingredientes , imagen) VALUES ('$codigo' , '$unidad' , '$capacidad' , '$grupo' , '$sub_grupo' , '$producto' , '$puntos' , '$gerente' , '$asistente_gerente' , '$supevisor' , '$asistente_supervisor' , '$cliente_novus' , '$descripcion' , '$detalle' , '$uso_sugerido' , '$contenido' , '$ingredientes' , '$imagen')");


    if ($result) {
        $res["message"] = "dato added successfully";
    } else {
        $res["error"] = true;
        $res["message"] = "dato not added successfully";
    }

    // $res["datos"] =$datos;
}
// end of create form
// update form

if ($action == "update") {
    $idPro= $_POST['idPro'];
 $codigo= $_POST['codigo'];
 $unidad= $_POST['unidad'];
 $capacidad= $_POST['capacidad'];
 $grupo= $_POST['grupo'];
 $sub_grupo= $_POST['sub_grupo'];
 $producto= $_POST['producto'];
 $puntos= $_POST['puntos'];
 $gerente= $_POST['gerente'];
 $asistente_gerente= $_POST['asistente_gerente'];
 $supevisor= $_POST['supevisor'];
 $asistente_supervisor= $_POST['asistente_supervisor'];
 $cliente_novus= $_POST['cliente_novus'];
 $descripcion= $_POST['descripcion'];
 $detalle= $_POST['detalle'];
 $uso_sugerido= $_POST['uso_sugerido'];
 $contenido= $_POST['contenido'];
 $ingredientes= $_POST['ingredientes'];
 $imagen= $_POST['imagen'];


    $result = $conn->query("UPDATE productos SET codigo ='$codigo' , unidad ='$unidad' , capacidad ='$capacidad' , grupo ='$grupo' , sub_grupo ='$sub_grupo' , producto ='$producto' , puntos ='$puntos' , gerente ='$gerente' , asistente_gerente ='$asistente_gerente' , supevisor ='$supevisor' , asistente_supervisor ='$asistente_supervisor' , cliente_novus ='$cliente_novus' , descripcion ='$descripcion' , detalle ='$detalle' , uso_sugerido ='$uso_sugerido' , contenido ='$contenido' , ingredientes ='$ingredientes' , imagen ='$imagen' WHERE idPro ='$idPro' ");

    if ($result) {
        $res["message"] = "dato updated successfully";
    } else {
        $res["error"] = true;
        $res["error"] = "dato not updated successfully";
    }
}

// end of update form

if ($action == "delete") {
    $idPro = $_POST['idPro'];

    $result = $conn->query("DELETE FROM `productos` WHERE idPro ='$idPro' ");

    if ($result) {
        $res["message"] = "dato deleted successfully";
    } else {
        $res["error"] = true;
        $res["message"] = "dato not deleted successfully";
    }
    // $res["datos"] =$datos;
}

$conn->close();
header("content-type:application/json");
echo json_encode($res);
die();
?>
