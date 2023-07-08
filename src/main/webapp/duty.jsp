<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>ValleGrande - Pagos</title>
<link href="css/styles.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<script src="https://unpkg.com/xlsx/dist/xlsx.full.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/PapaParse/5.3.0/papaparse.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.68/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.68/vfs_fonts.js"></script>
</head>
<body class="sb-nav-fixed">
	<jsp:include page="navbar.jsp"></jsp:include>
	<div id="layoutSidenav">
		<jsp:include page="sidebar.jsp"></jsp:include>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">LISTADO DE DERECHOS</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item">DERECHOS</li>
						<li class="breadcrumb-item active">Listado</li>
					</ol>
					<div class="card-body">
						<form method="post" action="#">
							<div class="mb-2 row">
								<div class="col-sm d-none">
									<button type="button" class="btn d-none" id="btnActualizar"
										name="btnActualizar">Actualizar</button>
								</div>
							</div>
						</form>
					</div>
					<div class="card mb-4" id="divResultado">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> Derechos
						</div>
						<div class="card-body">
							<table class="table caption-top">
								<thead>
									<tr>
										<th scope="col">#</th>
										<th scope="col">Titulo del Derecho</th>
										<th scope="col">Fecha</th>
										<th scope="col">Monto</th>
									</tr>
								</thead>
								<tbody id="detalleTabla">
								</tbody>
							</table>
						</div>
					</div>
					<div class="card" id="divRegistro" style="display: none;">
						<div class="card-header">
							<i class="fa-solid fa-list"></i> Formulario
						</div>
						<div class="card-body">
							<form class="row g-3 needs-validation" novalidate>
								<input type="hidden" id="accion" name="accion">
								<div class="col-md-4 d-none">
									<label for="frmIdentifier" class="form-label">ID</label> <input
										type="text" class="form-control" id="frmIdentifier" required>
								</div>
								<div class="col-md-4">
									<label for="frmNames" class="form-label">Nombre</label> <input
										type="text" class="form-control" id="frmNames" value="" required>
									<div class="valid-feedback">¡Se ve bien!</div>
									<div class="invalid-feedback">Por favor, coloque algo válido.</div>
								</div>
								<div class="col-md-4">
									<label for="frmLast_name" class="form-label">Apellido</label>
									<input type="text" class="form-control" id="frmLast_name"
										required>
									<div class="valid-feedback">¡Se ve bien!</div>
									<div class="invalid-feedback">Por favor, coloque algo válido.</div>
								</div>
								<div class="col-md-3">
									<label for="frmDocument_type" class="form-label">Tipo de Documento</label>
									<select class="form-select" id="frmDocument_type" required>
										<option selected disabled value="">Elige...</option>
										<option value="DNI">DNI</option>
										<option value="CNE">CNE</option>
									</select>
									<div class="invalid-feedback">Seleccione un tipo de documento.</div>
								</div>
								<div class="col-md-3">
									<label for="frmDocument_number" class="form-label">Nro. Documento</label>
									<input type="text" class="form-control" id="frmDocument_number"
										required>
									<div class="valid-feedback">¡Se ve bien!</div>
									<div class="invalid-feedback">Por favor, coloque algo válido.</div>
								</div>
								
								<div class="col-md-3">
									<label for="frmCareer" class="form-label">Carrera</label>
									<select class="form-select" id="frmCareer" required>
										<option selected disabled value="">Elige...</option>
										<option value="AS">AS</option>
									</select>
									<div class="invalid-feedback">Por favor, elija la carrera.</div>
								</div>
								<div class="col-md-2">
									<label for="frmSemester" class="form-label">Semestre</label>
									<select class="form-select" id="frmSemester" required>
										<option selected disabled value="">Elige...</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
									</select>
									<div class="invalid-feedback">Seleccione el semestre que corresponda.</div>
								</div>
								<div class="col-12">
									<button class="btn btn-primary" id="btnProcesar" type="submit">Enviar
										formulario</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</main>
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>

	// Arreglo de registros
	let arreglo = [];
	
	// Acceder a los controles
	let btnActualizar = document.getElementById("btnActualizar");
	
	// Campos del formulario
	let accion = document.getElementById('accion');
	let frmIdentifier = document.getElementById('frmIdentifier');
	let frmTitle = document.getElementById('frmTitle');
	let frmDates = document.getElementById('frmDates');
	let frmAmount = document.getElementById('frmAmount');

	// Programar los controles
	btnActualizar.addEventListener("click", fnBtnActualizar);

	
	function fnBtnActualizar() {
		let xhttp = new XMLHttpRequest();
		xhttp.open("GET", "DutyActualizar", true);
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				let respuesta = xhttp.responseText;
				arreglo = JSON.parse(respuesta);
				let detalleTabla = "";
				arreglo.forEach(function(item) {
							detalleTabla += "<tr>";
							detalleTabla += "<td>" + item.identifier + "</td>";
							detalleTabla += "<td>" + item.title + "</td>";
							detalleTabla += "<td>" + item.dates + "</td>";
							detalleTabla += "<td>" + item.amount + "</td>";
							detalleTabla += "</tr>";
						});
				document.getElementById("detalleTabla").innerHTML = detalleTabla;
				document.getElementById("divResultado").style.display = "block";
				document.getElementById("divRegistro").style.display = "none";
			}
		};
		xhttp.send();
	}
	
	fnBtnActualizar();
	
	function fnCargarForm(identifier){
		arreglo.forEach(function(item) {
			if(item.identifier == identifier){
				frmIdentifier.value = item.identifier;
				frmTitle.value = item.title;
				frmDates.value = item.dates;
				frmAmount.value = item.amount;
				return true;
			}
		});
	}
	
	function fnEstadoFormulario(estado){
		frmTitle.disabled = (estado==ACCION_ELIMINAR)
		frmDates.disabled = (estado==ACCION_ELIMINAR)
		frmAmount.disabled = (estado==ACCION_ELIMINAR)
		if(estado==ACCION_NUEVO){
			frmIdentifier.value = "0";
			frmTitle.value = "";
			frmDates.value = "";
			frmAmount.value = "";
		}
	}
	
	function fnValidar(){
		
		return true;
	}
	
</script>
</body>
</html>