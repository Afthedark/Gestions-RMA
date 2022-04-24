
<?php
session_start();
  $alert='';
  if(!empty($_SESSION['active']))
  {
      header('location: index.php');   
  }
  else
  {


  if(!empty($_POST))
  {
    if(empty($_POST['usuario'])|| empty($_POST['clave']))
    {
      $alert='Ingrese su usuario y clave';
    }
    else
    {
      require_once"conexion.php";

      $user=mysqli_real_escape_string($conection,$_POST['usuario']);
      $pass=md5(mysqli_real_escape_string($conection,$_POST['clave']));

      $query=mysqli_query($conection,"select * from usuario where ci='$user'and clave='$pass'");
      mysqli_close($conection);
      $result=mysqli_num_rows($query);
      if ($result > 0)
      {
        $data=mysqli_fetch_array($query);
          
        $_SESSION['active']=true;
        $_SESSION['idUser']=$data['id_usuario'];
        $_SESSION['nombre']=$data['nombre'];
        $_SESSION['apellido']=$data['apellidos'];        
        $_SESSION['user']=$data['ci'];
        $_SESSION['rol']=$data['id_rol'];

        header('location: inicio.php');
      }
      else
      {
        $alert='Usuario y/o contraseña no válido';
        session_destroy();
      }
    }
  }
  }
?>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>login sistema de RMA</title>

</head>
<body>

  
<div id="wrap">
  <div id="regbar">

    <div id="navthing" align="center" style="margin-left: 30%; margin-right: 30%; margin-top: 10%; border: 3px solid black;">
      <div class="card-header text-center">
      <center><img src="logo/logo ONECOMPANY color.png" width="300" height="150">
<h5>Ingrese sus Datos para Iniciar Sesion</h5>  
      </center>
      
    </div>
       <section id="container">
         <form action="" method="post">
          <input type="text" name="usuario" placeholder="Usuario" required> *
          <br>
          <br> 
          <input type="password" name="clave" placeholder="Clave" required> *
          <br>
           <?php 
            echo '<span style="color:red">'.$alert.'</span>';
           ?>  
           <br>
           
          <button type="submit" >Ingresar</button>
          
          <br>
          <br>
           
        </form>
      </section> 
    </div>
    <div>
      
       
    </div>
  </div>
</div>
</body>
</html>