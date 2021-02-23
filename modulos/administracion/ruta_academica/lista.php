<script type="text/javascript" src="<?php echo WEB_ROOT ?>js/tinymce/js/tinymce/tinymce.js"></script>

<script type="text/javascript">
tinymce.init({
    selector: "textarea",
    plugins: [
        "advlist autolink lists link image charmap print preview anchor",
        "searchreplace visualblocks code fullscreen",
        "insertdatetime media table contextmenu paste textcolor colorpicker",
    ],
    toolbar: "insertfile undo redo | styleselect | bold italic | " +
             "alignleft aligncenter alignright alignjustify | " +
             "bullist numlist outdent indent | link image" +
             " forecolor backcolor",
   
    language: "es",
    entity_encoding: "raw",
    
});
</script>
<!-- <link rel="stylesheet" href="<?php echo WEB_ROOT ?>plantilla/assets/plugins/bootstrap/css/bootstrap.min.css"> -->
<!-- Custom Css -->

<?php  
 //load_data.php  
 $output = '';  
 if(isset($_POST["brand_id"]))  
 {  
      if($_POST["brand_id"] != '')  
      {  
           // $sql = "SELECT m.id, m.nombre as product_name FROM materias as m, vigencia as v, asignacion_materias as am, areas as a WHERE am.id_materia=m.id AND a.id_vigencia=v.id AND m.areas=a.id and a.id_vigencia = '".$_POST["brand_id"]."'";
           $sql ="SELECT pe.nombre as nomperi ,pe.id as ids, ra.temas  FROM socrates.ruta_academica ra, socrates.periodos pe, socrates.materias m, socrates.cursos c WHERE ra.id_periodo ='$_POST[brand_id]' AND ra.id_materia=m.id AND ra.id_periodo = pe.id AND ra.id_cursos = c.id";
    $rs = mysqli_query($conn, $sql); //or die(mysqli_error());
    $rw = mysqli_fetch_assoc($rs);
    $descripcion=$rw["temas"];
    $descripcion2=$rw["nomperi"];  
      }  
      else  
      {  
           // $sql = "SELECT *, nombre as product_name FROM materias";  
        $descripcion=""; 
      }  
      // $result = mysqli_query($conn, $sql);  
      // while($row = mysqli_fetch_array($result))  
      // {  
           $output .= '<textarea  style="height:300px;width:99%">'.$descripcion.'</textarea>
           <br>
           <div style="text-align:right">
  <input type="submit" class="btn btn-primary" name="guardar" value="Guardar" />
</div>';
             // $output .= '<input type="text" value="'.$descripcion2.'">';
      // }  
      echo $output;  
 }  
 ?>  

