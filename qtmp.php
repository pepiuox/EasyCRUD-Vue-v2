<?php
//This is temporal file only for add new row
if (isset($_POST["updatequeries"])) {
$titulo_categoria = $_POST['titulo_categoria'];
$sql0 = "UPDATE table_queries SET query='$titulo_categoria' WHERE tque_Id='22' ";
$conn->query($sql0);
$img_categoria = $_POST['img_categoria'];
$sql1 = "UPDATE table_queries SET query='$img_categoria' WHERE tque_Id='23' ";
$conn->query($sql1);
echo "Record added successfully";
header("Location: querybuilder.php?w=editor&tbl=categorias");
} 
?> 
