<div id="layoutSidenav_nav">
	<nav class="sb-sidenav" id="sidenavAccordion">
		<div class="sb-sidenav-menu">
			<div class="nav">
				<div class="sb-sidenav-menu-heading"></div>
				<a class="nav-link" href="index.jsp">
					<div class="sb-nav-link-icon">
						<i class="fas fa-tachometer-alt"></i>
					</div> DashBoard
				</a>
				<div class="sb-sidenav-menu-heading">ANÁLISIS DE SISTEMAS</div>
				<!-- Estudiantes AS -->
				<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
					data-bs-target="#collapseUsuarios" aria-expanded="false"
					aria-controls="#collapseUsuarios">
					<div class="sb-nav-link-icon">
						<i class="fa-solid fa-user"></i>
					</div> Listado
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="collapseUsuarios"
					aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
					<nav class="sb-sidenav-menu-nested nav">
						<a class="nav-link" href="asstudent.jsp">Lista</a>
						<a class="nav-link" href="asstudentEliminados.jsp">Inactivos</a>
					</nav>
				</div>
				<!-- Pagos de Estudiantes de AS -->
				<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
					data-bs-target="#collapseReservas" aria-expanded="false"
					aria-controls="#collapseReservas">
					<div class="sb-nav-link-icon">
						<i class="fa-solid fa-calendar-days"></i>
					</div> Pagos
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="collapseReservas"
					aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
					<nav class="sb-sidenav-menu-nested nav">
						<a class="nav-link" href="">Deuda</a>
						<a class="nav-link" href="">Cancelado</a>
					</nav>
				</div>
				
				<!-- PRODUCCIÓN AGRARIA -->
				<div class="sb-sidenav-menu-heading">PRODUCCIÓN AGRARIA</div>
				<!-- Estudiantes PA -->
				<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
					data-bs-target="#collapseAutores" aria-expanded="false"
					aria-controls="#collapseAutores">
					<div class="sb-nav-link-icon">
						<i class="fa-solid fa-address-book"></i>
					</div> Listado
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="collapseAutores"
					aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
					<nav class="sb-sidenav-menu-nested nav">
						<a class="nav-link" href="pastudent.jsp">Lista</a>
						<a class="nav-link" href="pastudentEliminados.jsp">Inactivos</a>
					</nav>
				</div>
				<!-- Pagos de Estudiantes PA -->
				<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
					data-bs-target="#collapseLibros" aria-expanded="false"
					aria-controls="#collapseLibros">
					<div class="sb-nav-link-icon">
						<i class="fa-solid fa-book"></i>
					</div> Pagos
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="collapseLibros"
					aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
					<nav class="sb-sidenav-menu-nested nav">
						<a class="nav-link" href="">Deuda</a>
						<a class="nav-link" href="">Cancelado</a>
					</nav>
				</div>
			</div>
		</div>
	</nav>
</div>