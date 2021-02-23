<?php require 'conexion.php'; ?>
<!DOCTYPE html>
<html>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 --><body>
    
    <br>

    <table  class="table table-striped">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Nombre completo</th>
            


            <th scope="col" style="text-align: center;">Acciones</th>
        </tr>
    </tr>

        </thead>
        <tbody>
        <?php
        
    
        $sql= "SELECT id, nombre  
                FROM areas 
                
                ";
                

        $result= mysqli_query($conn,$sql);

        while($mostrar=mysqli_fetch_array($result)){
            ?>
        

        <tr>
            <td><?php echo $mostrar['nombre'] ?></td>
            
            
            <td style="text-align: center;">
                    <button class="btn btn-sm btn-warning" onclick="modificar('<?php echo $mostrar['person'] ?>')">
                        <i class="fas fa-edit"></i>
                    </button>


                    <button class="btn btn-sm btn-danger" onclick="eliminar('<?php echo $mostrar['person'] ?>')">
                        <i class="fas fa-trash"></i>
                    </button>
                 </td>
            </tr>
        <?php
        }
        ?>
    </tbody>
</table>