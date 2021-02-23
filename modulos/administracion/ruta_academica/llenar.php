<?php  
 //load_data.php  
 $output = '';  
 if(isset($_POST["brand_id"]))  
 {  
      if($_POST["brand_id"] != '')  
      {  
           $sql = "SELECT m.id, m.nombre as product_name FROM materias as m, vigencia as v, asignacion_materias as am, areas as a WHERE am.id_materia=m.id AND a.id_vigencia=v.id AND m.areas=a.id and a.id_vigencia = '".$_POST["brand_id"]."'";  
      }  
      else  
      {  
           $sql = "SELECT *, nombre as product_name FROM materias";  
      }  
      $result = mysqli_query($conn, $sql);  
      while($row = mysqli_fetch_array($result))  
      {  
           $output .= '<div class="col-md-3"><div style="border:1px solid #ccc; padding:20px; margin-bottom:20px;"><a 
           href="'.PAGE_ROOT.'gestion_materia">'.$row["product_name"].'</a></div></div>';  
      }  
      echo $output;  
 }  
 ?>  

