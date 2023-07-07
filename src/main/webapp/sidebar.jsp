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
					data-bs-target="#collapseListadoAS" aria-expanded="false"
					aria-controls="#collapseListadoAS">
					<div class="sb-nav-link-icon">
						<i class="fa-solid fa-user"></i>
					</div> Listado
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="collapseListadoAS"
					aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
					<nav class="sb-sidenav-menu-nested nav">
						<a class="nav-link" href="asstudent.jsp">Lista</a>
						<a class="nav-link" href="asstudentEliminados.jsp">Inactivos</a>
					</nav>
				</div>
				<!-- Pagos de Estudiantes de AS -->
				<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
					data-bs-target="#collapsePagosAS" aria-expanded="false"
					aria-controls="#collapsePagosAS">
					<div class="sb-nav-link-icon">
						<i class="fa-solid fa-calendar-days"></i>
					</div> Pagos
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="collapsePagosAS"
					aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
					<nav class="sb-sidenav-menu-nested nav">
						<a class="nav-link" href="asd">Deuda</a>
						<a class="nav-link" href="asd">Cancelado</a>
					</nav>
				</div>
				
				<!-- PRODUCCIÓN AGRARIA -->
				<div class="sb-sidenav-menu-heading">PRODUCCIÓN AGRARIA</div>
				<!-- Estudiantes PA -->
				<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
					data-bs-target="#collapseListadoPA" aria-expanded="false"
					aria-controls="#collapseListadoPA">
					<div class="sb-nav-link-icon">
						<i class="fa-solid fa-address-book"></i>
					</div> Listado
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="collapseListadoPA"
					aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
					<nav class="sb-sidenav-menu-nested nav">
						<a class="nav-link" href="pastudent.jsp">Lista</a>
						<a class="nav-link" href="pastudentEliminados.jsp">Inactivos</a>
					</nav>
				</div>
				<!-- Pagos de Estudiantes PA -->
				<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
					data-bs-target="#collapsePagosPA" aria-expanded="false"
					aria-controls="#collapsePagosPA">
					<div class="sb-nav-link-icon">
						<i class="fa-solid fa-book"></i>
					</div> Pagos
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="collapsePagosPA"
					aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
					<nav class="sb-sidenav-menu-nested nav">
						<a class="nav-link" href="asd">Deuda</a>
						<a class="nav-link" href="asd">Cancelado</a>
					</nav>
				</div>
			</div>
		</div>
	</nav>
</div>