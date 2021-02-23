<?php
require_once("php/tcpdf/tcpdf.php");
require_once("php/tcpdf_reporte.php");

class Formulario extends Base {
    function validar() {
        $v = new Validation($_POST);

        $result = $v->validate();

        if ($result['messages'] == "") {//No hay errores de validacion
            return true;
        } else { //Errores de validación
            $r['error'] = true;
            $r['msg'] = $result['messages'];
            $r['bad_fields'] = $result['bad_fields'];
            $r['errors'] = $result['errors'];
            echo json_encode($r);
            exit(0);
        }
        return true;
    }

    function mostrar() {
        global $DRAW_COLOR, $FILL_COLOR, $FILL_COLOR_TITULO;
        $db = $this->db;

        $sql = "
                Select * from general.persona
                ";

        $rs = $db->query($sql);
        ob_start();
        ?>

        <table style="font-family:'Times New Roman', Times, serif; font-size:8.5pt; 
               border-collapse:collapse" border="1" bordercolor="<?php echo BORDE_HTML ?>" 
               cellpadding="1" cellspacing="0">
            <thead>
                <!-- TODO LO QUE VA AQUI SE REPITE EN EL ENCABEZADO -->
                <tr style="font-weight:bold; text-align:left; background-color:<?= FONDO_HTML_TITULO ?>">
                    <th style="width: 30pt">NO</th>
		<th style="width: 100pt">ID</th>
		<th style="width: 100pt">USER</th>
		<th style="width: 100pt">IDENTIFICA</th>
		<th style="width: 100pt">TIPOIDE</th>
		<th style="width: 100pt">APELLIDO1</th>
		<th style="width: 100pt">APELLIDO2</th>
		<th style="width: 100pt">NOMBRE1</th>
		<th style="width: 100pt">NOMBRE2</th>
		<th style="width: 100pt">CORREO</th>
		<th style="width: 100pt">CLAVE</th>
		<th style="width: 100pt">ESTADO</th>
		<th style="width: 100pt">FECHA</th>
		<th style="width: 100pt">FOTO</th>
		<th style="width: 100pt">FIRMA</th>
		<th style="width: 100pt">PROFESION_ID</th>
		<th style="width: 100pt">SEXO_ID</th>

                </tr>
            </thead>
            <tbody>
                <?php
                while ($rw = $db->fetch_assoc($rs)) {
                    $fondo = ($fondo == "#fff" ? FONDO_HTML : "#fff");
                    ?>
                    <tr style="text-align:left; background-color:<?= $fondo ?>" >
                        <td style="width: 30pt"> <?= ++$x ?> </td>
			<td style="width: 100pt"> <?php echo $rw["id"] ?></td>
			<td style="width: 100pt"> <?php echo $rw["user"] ?></td>
			<td style="width: 100pt"> <?php echo $rw["identifica"] ?></td>
			<td style="width: 100pt"> <?php echo $rw["tipoide"] ?></td>
			<td style="width: 100pt"> <?php echo $rw["apellido1"] ?></td>
			<td style="width: 100pt"> <?php echo $rw["apellido2"] ?></td>
			<td style="width: 100pt"> <?php echo $rw["nombre1"] ?></td>
			<td style="width: 100pt"> <?php echo $rw["nombre2"] ?></td>
			<td style="width: 100pt"> <?php echo $rw["correo"] ?></td>
			<td style="width: 100pt"> <?php echo $rw["clave"] ?></td>
			<td style="width: 100pt"> <?php echo $rw["estado"] ?></td>
			<td style="width: 100pt"> <?php echo $rw["fecha"] ?></td>
			<td style="width: 100pt"> <?php echo $rw["foto"] ?></td>
			<td style="width: 100pt"> <?php echo $rw["firma"] ?></td>
			<td style="width: 100pt"> <?php echo $rw["profesion_id"] ?></td>
			<td style="width: 100pt"> <?php echo $rw["sexo_id"] ?></td>

                    </tr>
                    <?php
                }
                ?>
            </tbody>
        </table>

        <?php
        $html = ob_get_contents();
        ob_clean();
        ob_flush();

        
        $nombre_archivo = "reporte";
        
        $formato = $_POST['formato'];
       
        if ($formato == "XLS") {
            header("Content-Type: application/force-download");
            header("Content-Type: application/octet-stream");
            header("Content-Type: application/download");
            header("Content-Disposition: attachment; filename={$nombre_archivo}.xls;");
            echo $html;
        } else if ($formato == "DOC") {
            header("Content-Type: application/force-download");
            header("Content-Type: application/octet-stream");
            header("Content-Type: application/download");
            header("Content-Disposition: attachment; filename={$nombre_archivo}.doc;");
            echo $html;
        } else if ($formato == "PDF") {
            $p = new TCPDF_REPORTE("P", "pt", "LETTER", true);
            
            $_SESSION['ancho_header'] = 580; // SI ES   P (VERTICAL)
            //$_SESSION['ancho_header'] = 740; // SI ES   L (HORIZONTAL)
            $p->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);
            //$p->SetMargins(20, 100, 20);// SI ES   L (HORIZONTAL)
            $p->SetMargins(20, 80, 20);// SI ES   P (VERTICAL)

            $p->SetFooterMargin(30);
            $p->SetAutoPageBreak(TRUE, 45);

            $p->setPrintHeader(true);
            $p->setPrintFooter(true);
            $p->SetDisplayMode(100);
            $p->setImageScale(PDF_IMAGE_SCALE_RATIO);

            $p->SetDrawColorArray($DRAW_COLOR);
            $p->SetFillColorArray($FILL_COLOR);

            //$p->SetLeftData(EMPRESA, EMPRESA_NIT, "CONTROL DE TERMINOS", "TITULO DE REPORTE");
            //$p->SetRightData("TITULO 1", "TITULO 2", "TITULO 3", "TITULO 4");

            $p->AddPage();

            $p->SetFont("times", "", 5);
            $p->writeHTML($html, true, 0, true, 0);   
            $p->Output("{$archivo}.pdf", PDF_MODO_IMPRESION);
        } else {
            //Formato = HTML
            echo $html;
        }
    }
 
}
 
$accion = ACCION;
$f = new Formulario();
$f->$accion();
?>