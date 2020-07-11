<?php
include 'config.php';
$tbl = 'productos';
$cname = 'grupo';
$sql = "SELECT * FROM $tbl";
$result = $conn->query($sql);
$qnames = array();
$num = $result->field_count;
if ($num > 0) {
    while ($nam = $result->fetch_field()) {
        $qnames[] = $nam->name;
    }
    foreach ($qnames as $qname) {
        $ths[] = '<th>' . $qname . '</th>' . "\n";
    }
} else {
    echo 'Esta tabla si tiene columnas o contenido' . '<br>';
}

function getJoin($tbl, $cname) {
    global $conn;
    $joinquery = $conn->query("SELECT * FROM table_queries WHERE name_table='$tbl' AND col_name='$cname'");
    if ($joinquery->num_rows > 0) {
        $resjoin = $joinquery->fetch_assoc();
        $coln = $resjoin['j_value'];
        if (!empty($coln)) {
            return $coln;
        } else {
            return $cname;
        }
    } else {
        return $cname;
    }
}

$sql1 = "SELECT * FROM table_queries WHERE name_table='$tbl'";
$result1 = $conn->query($sql1);

if ($result1->num_rows > 0) {
    while ($qtb = $result1->fetch_array()) {
        $colcs[] = getJoin($tbl, $qtb['col_name']);
        if (empty($qtb['joins'])) {
            continue;
        } else {
            $ljoins[] = $qtb['joins'] . ' ' . $qtb['j_table'] . ' ON ' . $tbl . '.' . $qtb['col_name'] . ' = ' . $qtb['j_table'] . '.' . $qtb['j_id'];
        }
    }
}

$rjoin = implode(" ", $ljoins);
$joinquery = $conn->query("SELECT * FROM $tbl $rjoin");
$list = '';
$list .= '<table class="table">'
        . '<thead>' . "\n";
$list .= implode(" ", $ths);
$list .= '</thead>'
        . '<tbody>' . "\n";
$i = 1;
while ($jrw = $joinquery->fetch_array()) {
    $list .= '<tr>' . "\n";
    $list .= '<td>' . $i++ . '</td>' . "\n";
    foreach ($colcs as $clc) {
        $list .= '<td>' . $jrw[$clc] . '</td>' . "\n";
    }
    $list .= '</tr>' . "\n";
}
$list .= '</tbody></table>' . "\n";
include 'top.php';
?>
</head>
<body>
    <?php

    function optsel($jtable, $jid, $jvalue) {
        global $conn;
        $sels = $conn->query("SELECT * FROM $jtable");
        while ($sel = $sels->fetch_array()) {
            echo '<option value="' . $sel[$jid] . '">' . $sel[$jvalue] . '</option>';
        }
    }

    function inpSel($tbl, $cname) {
        global $conn;
        $qsl = $conn->query("SELECT * FROM table_queries WHERE name_table='$tbl' AND col_name='$cname'");
        while ($row = $qsl->fetch_array()) {
            if (!empty($row['joins'])) {
                $jtable = $row['j_table'];
                $jvalue = $row['j_value'];
                $jid = $row['j_id'];
                echo'<select class="form-control" id="' . $cname . '" name="' . $cname . '" v-model="newDato.' . $cname . '">';
                optsel($jtable, $jid, $jvalue);
                echo '</select>' . "\n";
            } else {
                echo '<input type="text"  class="form-control" id="' . $cname . '" name="' . $cname . '" placeholder="' . stringUf($cname) . '" v-model="newDato.' . $cname . '">';
            }
        }
    }

    inpSel($tbl, $cname)
    ?>
    <?php echo $list; ?>

</body>
</html>



