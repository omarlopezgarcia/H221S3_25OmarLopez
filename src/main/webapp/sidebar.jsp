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
				<div class="sb-sidenav-menu-heading">DERECHOS</div>
				<a class="nav-link" href="duty.jsp">
					<div class="sb-nav-link-icon">
						<i class="fas fa-list"></i>
					</div> Vista de Derechos
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
						<a class="nav-link" href="asstudent.jsp">Deuda</a>
						<a class="nav-link" href="asstudentEliminados.jsp">Cancelado</a>
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
						<a class="nav-link" href="pastudent.jsp">Deuda</a>
						<a class="nav-link" href="pastudentEliminados.jsp">Cancelado</a>
					</nav>
				</div>
			</div>
		</div>
	</nav>
</div>