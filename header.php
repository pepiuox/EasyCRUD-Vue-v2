<header>
    <!-- Static navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="index.php">Easy CRUD Vue</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.php">Inicio <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="index.php?view=select">Seleccionar Tabla</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Advance App
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="querybuilder.php">Relacionar Tablas</a>
                            <a class="dropdown-item" href="table_config.php">Configurar Tablas</a>
                            
                        </div>
                    </li>
                    <?php
                $tq = "SELECT * FROM table_config WHERE tcon_Id='1'";
                $rTQ = $conn->query($tq);
                $nr = $rTQ->num_rows;
                if ($nr > 0) {
                    ?>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Tablas
                        </a>
                         <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <?php
                            $rwtq = $rTQ->fetch_array();
                            $mtq = explode(",", $rwtq['table_name']);
                            foreach ($mtq as $v) {
                                $rv = str_replace("_", " ", $v);
                                echo'<a class="dropdown-item" href="index.php?view=list&tbl=' . $v . '">' . ucfirst($rv) . '</a>';
                            }
                            ?>
                        </div>
                    </li>
                    <?php
                }
                ?>          
                    <li class="nav-item">
                        <a class="nav-link" href="search.php">Buscar</a>
                    </li>
                </ul>                    
            </div>
        </div>
    </nav>
</header>
