<?php session_start();
require  'php/func.php';
if ((isset($_POST["id_car"])))
    $rez = delete_car($_POST["id_car"]);
if (!isset($_SESSION['login'])) Header('Location: sign_in.php?user=false');
$table = table_for_cars_user();
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Тачка.ру: Личный кабинет</title>
    <link rel="icon" href="pictures/favicon.png">
    <link href="bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="css/css_main.css" rel="stylesheet">
  </head>

  <body>

    <header>
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="index.php">Тачка.ру <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="index_salon.php">Салоны<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="index_car.php">Автомобили<span class="sr-only">(current)</span></a>
                </li>
                <?php if (!isset($_SESSION["login"])) {  ?>
                    <li class="nav-item active">
                        <a class="nav-link" href="sign_in.php">Войти <span class="sr-only">(current)</span></a>
                    </li>
                <?php } ?>
                <?php if (isset($_SESSION["login"])) { ?>
                    <li class="nav-item active">
                        <a class="nav-link" href="user.php"><?php echo $_SESSION['login']; ?><span class="sr-only">(current)</span></a>
                    </li>
                <?php } ?>
            </ul>
            <form class="form-inline mt-md-0">
                <input class="form-control mr-sm-2" type="text" name="find" placeholder="Поиск" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Найти</button>
            </form>
          
        </div>
      </nav>
    </header>

    <main role="main">
      <div class="container">
        <div class="row">
            <?php if ((isset($_GET["find"]))) find($_GET) ?>
          <div class="col-md-4 order-md-1" >
          <img  src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Аватарка" width="300" height="300">
            <h3> 
              <?php 
                echo $_SESSION['login'];
              ?>
            </h3>
              <div>
                  <a href="php/logout.php" class="btn btn-secondary">Выйти</a>
          </div>
          </div>
          <div class="col-md-5 order-md-2">
              <?php if (isset($_GET["user"]) and (($_GET["user"]) == "out")) {?>
              <div class="alert alert-warning" role="alert">
                  "Чтобы зарагестрироваться,<br>нужно сначала выйти<br>из личного кабинета."
              </div>
              <?php } ?>
              <?php if(!$table){?>
              <div class="mb-3">
                  <div class="alert alert-warning " role="alert">
                      Добавленных автомобилей пока нет!<br>
                  </div>
              </div>
              <?php } ?>

                  <h4 class="justify-content-between align-items-center mb-3">
                      <?php if(!$table){?>
                          <div class="mb-3">
                              <div class="alert alert-warning " role="alert">
                                  Добавленных автомобилей пока нет!<br>
                                  Либо несущесвтует автосалон.
                              </    div>
                          </div>
                      <?php } else { if (!isset($_GET["mark"])) {?>
                          <span class="text">Все добавленные автомобили</span>
                      <?php } else { ?>
                          <span class="text">Добавленные автомобили в <?php echo $_GET["mark"]; ?></span>
                      <?php } ?>
                      <span class=" badge badge-secondary badge-pill"><?php echo count($table);?></span>
                  </h4>
                  <div class="mb-3">
                      <?php if ((isset($rez1) and ($rez1 === 1)) and (!isset($rez))) {  ?>
                          <div class="alert alert-success" role="alert">
                              Действие произошло успешно!
                          </div>
                      <?php } ?>
                      <?php if ((((isset($_GET["edit"])) and ($_GET["edit"] == "1")) or ((isset($_GET["rez"] )) and ($_GET["rez"] == "1"))) and (!isset($rez))) {  ?>
                          <div class="alert alert-success" role="alert">
                              Действие произошло успешно!
                          </div>
                      <?php } ?>
                      <?php if (((((isset($_GET["edit"] )) and ($_GET["edit"] == "-1")) or ((isset($_GET["rez"] )) and ($_GET["rez"] == "-1")))) and (!isset($rez))) { ?>
                          <div class="alert alert-danger" role="alert">
                              Действие произошло с ошибкой!
                          </div>
                      <?php } ?>
                      <?php if(isset($rez) and ($rez == 1)) { ?>
                          <div class="alert alert-success" role="alert">
                              Удаление произошло успешно.
                          </div>
                      <?php } ?>
                      <?php if ((isset($rez)) and ($rez == -1)) { ?>
                          <div class="alert alert-danger" role="alert">
                              Удаление произошло с ошибкой!
                          </div>
                      <?php } ?>
                      <?php } ?>
                  </div>
              <?php if ($table) make_table_for_car_on_user($table, $_GET); ?>

              <div class="col-md-8 offset-sm-7">
                      <a href="car_add.php?user" class="btn btn-primary offset-11" id="add_salon">Добавить автомобиль</a>

              </div>
          </div>

        </div>
          <form hidden id="car_delete" method="POST">
              <input name="id_car" id="id_car">
          </form>
      </div>
        <footer class="container  ">
            <hr class="featurette-divider">
            <p class="float-right">
                <a href="#">На верх</a></p>
            <p>© 2019
        </footer>
    </main>


    <script type="text/javascript" src="js/delete_car.js"></script>
    <script src="bootstrap/bootstrap.min.js"></script>
  </body>
</html>