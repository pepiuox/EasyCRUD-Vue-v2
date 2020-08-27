<?php
//This is temporal file only for add new row
if (isset($_POST["updatequeries"])) {
$grupo_id = $_POST['grupo_id'];
$sql0 = "UPDATE table_queries SET query='$grupo_id' WHERE tque_Id='20' ";
$conn->query($sql0);
$nombre_sub_grupo = $_POST['nombre_sub_grupo'];
$sql1 = "UPDATE table_queries SET query='$nombre_sub_grupo' WHERE tque_Id='21' ";
$conn->query($sql1);
echo "Record added successfully";
header("Location: querybuilder.php?w=editor&tbl=sub_grupos");
} 
?> 
