<?php
include 'config.php';
$path = basename($_SERVER['REQUEST_URI']);
$file = basename($path);

$fileName = basename($_SERVER['PHP_SELF']);

function protect($string) {
    $protection = htmlspecialchars(trim($string), ENT_QUOTES);
    return $protection;
}

if ($file == $fileName) {
    header("Location: $fileName?view=select");
}
if (isset($_GET['view'])) {
    $view = protect($_GET['view']);
} else {
    header("Location: $fileName?view=select");
}
if (!empty($_GET["tbl"])) {
    $tbl = protect($_GET["tbl"]);
    $tble = ucfirst(str_replace('_', ' ', $tbl));
    if (substr($tbl, -1) == 's') {
        $coln = substr($tbl, 0, -1);
        $ucoln = ucfirst(substr($tbl, 0, -1));
    } else {
        $coln = $tbl;
        $ucoln = ucfirst($tbl);
    }

    $sql = "SELECT * FROM $tbl";
    $result = $conn->query($sql);
    $cname = array();
    $i = 0;
    while ($result->field_count > $i) {
        $nam = $result->fetch_field();
        if ($i == 0) {
            $idcol = $nam->name;
            $whre = $nam->name . " ='$" . $nam->name . "'";
            $vpost = "$" . $nam->name . " = \$_POST['" . $nam->name . "'];";
        }

        $cnames[] = $nam->name;
        $uposts[] = "$" . $nam->name . "= \$_POST['" . $nam->name . "'];" . "\n";
        if ($i != 0) {
            $varc[] = $nam->name . ' :""';
            $cols[] = $nam->name;
            $varnames[] = "'$" . $nam->name . "'";
            $upnames[] = $nam->name . " ='$" . $nam->name . "'";
            $cposts[] = "$" . $nam->name . "= \$_POST['" . $nam->name . "'];" . "\n";
        }
        $i = $i + 1;
    }
    $col = implode(" , ", $cols);
    $varname = implode(" , ", $varnames);
    $upname = implode(" , ", $upnames);
    $cli = implode(" , ", $varc);
    $upost = implode(" ", $uposts);
    $cpost = implode(" ", $cposts);

    $appfile = 'app.js';
    $myapp = fopen("$appfile", "w") or die("Unable to open file!");
    $appcontent = 'var app = new Vue({
                el: "#app",
                data: {
                    showmodaladd: false,
                    showmodaledit: false,
                    showmodaldelete: false,
                    successmessage: "",
                    errormessage: "",
                    datos: [],
                    newDato: {' . $cli . '},
                    clickedDato: {}

                },
                mounted: function () {
                    console.log("mounted");
                    this.getAllDatos();
                },
                methods: {
                    getAllDatos: function () {
                        axios.get("app.php?action=read")
                                .then(function (response) {
                                    // console.log(response);
                                    if (response.data.error) {
                                        app.errormessage = response.data.message;
                                    } else {
                                        app.datos = response.data.datos;
                                    }
                                });

                    },
                    saveDato: function () {
                        // console.log(app.newDato);
                        var formData = app.toformData(app.newDato);
                        axios.post("app.php?action=create", formData)
                                .then(function (response) {

                                    // app.newDato={' . $cli . '};

                                    if (response.data.error == true) {
                                        app.errormessage = response.data.message;
                                    } else {
                                        app.successmessage = response.data.message;
                                        app.getAllDatos();
                                    }
                                });
                    },
                    selectDato: function (dato) {
                        app.clickedDato = dato;
                    },
                    updateDato: function (dato) {
                        var formData = app.toformData(app.clickedDato);
                        axios.post("app.php?action=update", formData)
                                .then(function (response) {

                                    app.clickedDato = {};

                                    if (response.data.error) {
                                        app.errormessage = response.data.error;
                                    } else {
                                        app.successmessage = response.data.message;
                                        app.getAllDatos();
                                    }
                                });
                    },
                    deleteDato: function (dato) {
                        var formData = app.toformData(app.clickedDato);
                        axios.post("app.php?action=delete", formData)
                                .then(function (response) {

                                    app.clickedDato = {};

                                    if (response.data.error) {
                                        app.errormessage = response.data.message;
                                    } else {
                                        app.successmessage = response.data.message;
                                        app.getAllDatos();
                                    }
                                });
                    },
                    toformData: function (obj) {
                        var form_data = new FormData();
                        for (var key in obj) {
                            form_data.append(key, obj[key]);
                        }
                        return form_data;
                    },

                    clearMessage: function () {
                        app.successmessage = "";
                        app.errormessage = "";
                    }
                }

            });';
    fwrite($myapp, $appcontent);
    fclose($myapp);

    $apifile = 'app.php';
    $myapi = fopen("$apifile", "w") or die("Unable to open file!");
    $apicontent = '
<?php

include "config.php";
$res = array("error" => false);

$action = "read";


if (isset($_GET["action"])) {
    $action = $_GET["action"];
}

if ($action == "read") {
    $result = $conn->query("SELECT * FROM `' . $tbl . '`");
    $datos = array();
    while ($row = $result->fetch_assoc()) {
        array_push($datos, $row);
    }

    $res["datos"] = $datos;
}
// Create form

if ($action == "create") {

    ' . $cpost . '

    $result = $conn->query("INSERT INTO ' . $tbl . '(' . $col . ') VALUES (' . $varname . ')");


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
    ' . $upost . '

    $result = $conn->query("UPDATE ' . $tbl . ' SET ' . $upname . ' WHERE ' . $whre . ' ");

    if ($result) {
        $res["message"] = "dato updated successfully";
    } else {
        $res["error"] = true;
        $res["error"] = "dato not updated successfully";
    }
}

// end of update form

if ($action == "delete") {
    ' . $vpost . '

    $result = $conn->query("DELETE FROM `' . $tbl . '` WHERE ' . $whre . ' ");

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
';
    fwrite($myapi, $apicontent);
    fclose($myapi);
}
?>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <title>Easy CRUD Vue Axios PHP Mysql</title>
        <link rel="stylesheet" type="text/css" href="css/theme.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <link rel="stylesheet" type="text/css" href="css/line-awesome.min.css">
        <!-- <link rel="stylesheet" type="text/css" href="css/mystyle.css"> -->
        <script src="js/jquery.min.js"></script>
       <!--   <script src="js/popover.js"></script> -->
        <script src="js/vue.js"></script>

        <script src="js/bootstrap.min.js"></script>
        <script src="js/axios.min.js"></script>
        <style type="text/css">
            
            .my-form{
                padding: 60px;
            }
            .head{
                text-align: right;
                color: red;
                font-weight: bolder;
                padding: 10px;
                font-size: 18px;
            }
            .head span{
                text-align: left
            }
            .head i:hover{
                cursor: pointer;
                transform: rotate(180deg);
                transition: transform linear 260ms;

            }
            .my-btn button{
                float: right
            }
            .buttons button{
                float: right;
                margin-right: 8px;
            }
            .fade-enter-active, .fade-leave-active {
                transition: opacity .5s;
                /*transform: translateY(50%);
                  transition:transform ease-in-out 500ms;*/ 
            }
            .fade-enter, .fade-leave-to /* .fade-leave-active below version 2.1.8 */ {
                opacity: 0;
                /* transform: translateY(0%);*/
            }
            .bounce-enter-active {
                animation: bounce-in .5s;
            }
            .bounce-leave-active {
                animation: bounce-in .5s reverse;
            }
            @keyframes bounce-in {
                0% {
                    transform: scale(0);
                }
                50% {
                    transform: scale(1.3);
                }
                100% {
                    transform: scale(1);
                }
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container">
                <a class="navbar-brand" href="index.php">Easy CRUD Vue</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="index.php">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="index.php?view=select">Select Table</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Advance App
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="repos/index.php">Advance Crud</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Something else here</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link disabled" href="#">Disabled</a>
                        </li>
                    </ul>                    
                </div>
            </div>
        </nav>
        <?php
        if ($view === "select") {
            ?>            
            <div class="container">
                <div class="row py-3">                    
                    <div class="col-md-6">
                        <h3 id="fttl">Select a Table from your Database </h3>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <script>
                $(function () {
                    $("#selecttb").change(function () {
                        var selecttb = $(this).val();
                        //var path = $(location).attr('href');                        
                        var url = 'index.php?view=crud&tbl=' + selecttb;
                        $('#fttl').text('Table ' + selecttb);
                        window.location.replace(url);
                    });
                });
                            </script>
                            <label class="control-label" for="selecttb">Select Table</label>
                            <select id="selecttb" name="selecttb" class="form-control">
                                <option value="">Select Table</option>
                                <?php
                                /* Get table names */
                                $tableList = array();
                                $res = $conn->query("SHOW TABLES");
                                while ($row = $res->fetch_array()) {
                                    $tableList[] = $row[0];
                                }
                                foreach ($tableList as $tname) {
                                    $remp = str_replace("_", " ", $tname);
                                    echo '<option value="' . $tname . '">' . ucfirst($remp) . '</option>' . "\n";
                                }
                                ?>
                            </select>                               
                        </div>
                    </div>
                </div>
            </div>
            <?php
            /* View data in the selected table */
        } elseif ($view == "crud") {
            ?>
            <div class="container-fluid" id="app"> 
                <!-- row for messages -->
                <div class="row py-1">
                    <div class="w-100">
                        <div class="alert alert-success" role="alert" v-if="successmessage">
                            <h4 class="alert-heading" >{{successmessage}}</h4> 
                        </div>
                        <div class="alert alert-danger" role="alert" v-if="errormessage">
                            <h4 class="alert-heading" >{{errormessage}}</h4> 
                        </div>
                    </div>
                </div>

                <div class="row" >
                    <div class="col-md-2">
                        <a class="btn btn-secondary" href="index.php?view=select">Select a Table</a>
                    </div>
                    <div class="col-md-8">
                        <h5>List of <?php echo $tble; ?></h5>
                    </div>
                    <div class="col-md-2">
                        <button type="button" class="btn btn-primary " @click="showmodaladd=true" data-toggle="modal" data-target="#addModal">Add <i class="fa fa-plus" aria-hidden="true"></i></button>
                    </div>
                </div> <hr>
                <!-- row for table content -->
                <div class="row">
                    <table class="table table-sm">
                        <thead class="table-info">
                            <tr>
                                <th scope="col">Action</th>
                                <?php
                                foreach ($cnames as $cname) {
                                    $remp = str_replace("_", " ", $cname);
                                    echo '<th scope="col">' . ucfirst(str_replace(' id', '', $remp)) . '</th>' . "\n";
                                }
                                ?>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="dato in datos">
                                <td>
                                    <button type="button" class="btn btn-info"  @click="showmodaledit = true; selectDato(dato)" data-toggle="modal" data-target="#editModal"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button> &nbsp; 
                                    <button type="button" class="btn btn-danger" @click="showmodaldelete= true; selectDato(dato)" data-toggle="modal" data-target="#deleteModal"><i class="fa fa-times" aria-hidden="true"></i></button>
                                </td>
                                <?php
                                foreach ($cnames as $cname) {
                                    echo '<td scope="row">{{dato.' . $cname . '}}</td>' . "\n";
                                }
                                ?>


                            </tr>

                        </tbody>
                    </table> 
                    <!-- add modal -->
                    <transition name="fade">
                        <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content" v-if="showmodaladd">
                                    <div class="modal-header bg-info">
                                        <h5 class="modal-title">Add <i class="fa fa-plus" aria-hidden="true"></i></h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <i class="la la-times "  @click="showmodaladd= false"></i>
                                        </button>
                                    </div>
                                    <div class="modal-body">                                        
                                        <form method="post" class="my-form" action="javascript:void(0)">
                                            <?php
                                            foreach ($cnames as $key => $cname) {
                                                if ($key == 0) {
                                                    continue;
                                                } else {
                                                    $cinp = ucfirst(str_replace('_', ' ', $cname));
                                                    echo '<div class="form-group row">
                                <label for="' . $cname . '" class="col-sm-3 col-form-label">' . $cinp . '</label>
                                <div class="col-sm-9">
                                    <input type="text"  class="form-control" id="' . $cname . '" name="' . $cname . '" placeholder="' . $cinp . '" v-model="newDato.' . $cname . '">
                                </div>
                            </div>' . "\n";
                                                }
                                            }
                                            ?>

                                            <div class="col-sm-9">
                                                <button type="button" class="btn btn-info"  @click="showmodaladd = false; saveDato()">Add dato</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </transition>
                    <!-- end of add modal -->

                    <!-- edit modal -->
                    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content" v-if="showmodaledit">
                                <div class="modal-header bg-info">
                                    <h5 class="modal-title">Edit <i class="fa fa-pencil-square-o" aria-hidden="true"></i></h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <i class="la la-times "  @click="showmodaledit= false"></i>
                                    </button>
                                </div>
                                <div class="modal-body">                                    
                                    <form method="post" class="my-form">                                       
                                        <?php
                                        foreach ($cnames as $key => $cname) {
                                            if ($key == 0) {
                                                continue;
                                            } else {
                                                $cinp = ucfirst(str_replace('_', ' ', $cname));
                                                echo '<div class="form-group row">
                                <label for="' . $cname . '" class="col-sm-3 col-form-label">' . $cinp . '</label>
                                <div class="col-sm-9">
                                    <input type="text"  class="form-control" id="' . $cname . '" name="' . $cname . '" placeholder="' . $cinp . '" v-model="clickedDato.' . $cname . '">
                                </div>
                            </div>' . "\n";
                                            }
                                        }
                                        ?>

                                        <div class="form-group row">

                                            <div class="col-sm-9">
                                                <button type="button" class="btn btn-info"  @click="showmodaledit = false;updateDato(dato) ">
                                                    <i class="fas fa-pencil-alt"></i>
                                                    Update</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end of edit modal -->

                    <!-- Delete modal -->
                    <transition name="bounce">
                        <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content" v-if="showmodaldelete">
                                    <div class="modal-header  bg-info">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <i class="la la-times "  @click="showmodaldelete= false"></i>
                                        </button>
                                    </div>
                                    <div class="modal-body">                               

                                        <p class="text-center">You  are going to delete id {{clickedDato.<?php echo $idcol; ?>}}</p>
                                        <br>
                                        <div class="buttons container">
                                            <p></p>
                                            <button type="button" class="btn btn-success" @click="showmodaldelete = false; deleteDato(dato)">Yes</button> &nbsp;&nbsp;&nbsp;
                                            <button type="button" class="btn btn-info" @click="showmodaldelete = false">No</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </transition>
                    <!-- end of Delete modal -->
                </div>
            </div>

            <br>
            <script src="app.js" type="text/javascript"></script>
        <?php } ?>
    </body>
</html>
