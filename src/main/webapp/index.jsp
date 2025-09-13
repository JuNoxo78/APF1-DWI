<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cineplanet</title>
	<!-- Bootstrap 5 (CDN) -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
    <body class="bg-light">
	<div class="container py-4">
		<header class="mb-4">
            <img src="assets/logo.svg" class="d-block mx-auto mb-4" alt="Logo Cineplanet" width="300">
			<h4 class="h4 text-center text-muted">Reserva de entradas</h4>
		</header>


		<div class="row justify-content-center">
			<div class="col-12 col-md-10 col-lg-8">
				<div class="card shadow-sm">
					<div class="card-body">
                        <div class="alert alert-info">
                            <p class="mb-0">* La cantidad máxima de entradas a reservar es de 3.</p>
                            <p class="mb-0">* El costo por entrada es de S/10</p>
                        </div>

						<form action="FormularioServlet" method="post" novalidate>

							<div class="row g-3">
								<div class="col-md-6">
                                    <c:set var="nombres" value="${param.nombres != null ? param.nombres : ''}"/>
									<label for="nombres" class="form-label">Nombres</label>
                                    <input type="text" class="form-control" id="nombres" name="nombres" value="${nombres}" required>
                                    <span class="text-danger">
                                        <c:out value="${requestScope.nombresError}"/>
                                    </span>
								</div>
								<div class="col-md-6">
                                    <c:set var="apellidos" value="${param.apellidos != null ? param.apellidos : ''}"/>
									<label for="apellidos" class="form-label">Apellidos</label>
                                    <input type="text" class="form-control" id="apellidos" name="apellidos" value="${apellidos}" required>
                                    <span class="text-danger">
                                        <c:out value="${requestScope.apellidosError}"/>
                                    </span>
								</div>
								<div class="col-md-6">
                                    <c:set var="dni" value="${param.dni != null ? param.dni : ''}"/>
									<label for="dni" class="form-label">DNI</label>
									<input type="text" class="form-control" id="dni" name="dni" maxlength="8"
										pattern="\d{8}" title="Debe tener exactamente 8 dígitos" value="${dni}" required>
                                    <span class="text-danger">
                                        <c:out value="${requestScope.dniError}"/>
                                    </span>
								</div>
								<div class="col-md-6">
                                    <c:set var="email" value="${param.email != null ? param.email : ''}"/>
									<label for="email" class="form-label">Correo</label>
									<input type="email" class="form-control" id="email" name="email"
										placeholder="Ej: usuario@dominio.com" value="${email}" required>
                                    <span class="text-danger">
                                        <c:out value="${requestScope.emailError}"/>
                                    </span>
								</div>
								<div class="col-md-6">
                                    <c:set var="cantidadEntradas" value="${param.cantidadEntradas != null ? param.cantidadEntradas : ''}"/>
									<label for="cantidadEntradas" class="form-label">Cantidad de Entradas (máx. 3)</label>
									<input type="number" class="form-control" id="cantidadEntradas" name="cantidadEntradas"
										value="${cantidadEntradas}" min="1" max="3" required>
                                    <span class="text-danger">
                                        <c:out value="${requestScope.cantidadEntError}"/>
                                    </span>
								</div>
								<div class="col-md-6">
                                    <%
                                        List<String> peliculas = new ArrayList<>();
                                        peliculas.add("Dune 2");
                                        peliculas.add("Deadpool 3");
                                        peliculas.add("Intensamente 2");
                                        peliculas.add("Venom 3");
                                        pageContext.setAttribute("peliculas", peliculas);
                                    %>
									<label for="pelicula" class="form-label">Película</label>
                                    <select id="pelicula" name="pelicula" class="form-select" required>
                                        <option disabled ${empty param.pelicula ? 'selected' : ''}>
                                            Seleccionar...
                                        </option>
                                        <c:forEach var="entry" items="${peliculas}">
                                            <option value="${entry}" ${param.pelicula == entry ? 'selected' : ''}>${entry}</option>
                                        </c:forEach>
                                    </select>
                                    <span class="text-danger">
                                        <c:out value="${requestScope.peliculaError}"/>
                                    </span>
								</div>
								<div class="col-md-6">
                                    <%
                                        List<String> horariosDisp = new ArrayList<>();
                                        horariosDisp.add("10:00 AM");
                                        horariosDisp.add("01:00 PM");
                                        horariosDisp.add("04:00 PM");
                                        horariosDisp.add("07:00 PM");
                                        pageContext.setAttribute("horariosDisp", horariosDisp);
                                    %>
									<label for="horasDisponibles" class="form-label">Horarios Disponibles</label>
                                    <select id="horasDisponibles" name="horasDisponibles" class="form-select" required>
                                        <option disabled ${empty param.horasDisponible ? 'selected' : ''}>
                                            Seleccionar...
                                        </option>
                                        <c:forEach var="entry" items="${horariosDisp}">
                                            <option value="${entry}" ${param.horasDisponibles == entry ? 'selected' : ''}>${entry}</option>
                                        </c:forEach>
                                    </select>
                                    <span class="text-danger">
                                        <c:out value="${requestScope.horasDisponiblesError}"/>
                                    </span>
								</div>
								<div class="col-md-6">
                                    <%
                                        List<String> metodosPago = new ArrayList<>();
                                        metodosPago.add("Efectivo");
                                        metodosPago.add("Tarjeta");
                                        pageContext.setAttribute("metodosPago", metodosPago);
                                    %>
									<label for="metodoPago" class="form-label">Método de Pago</label>
                                    <select id="metodoPago" name="metodoPago" class="form-select" required>
                                        <option disabled ${empty param.metodoPago ? 'selected' : ''}>
                                            Seleccionar...
                                        </option>
                                        <c:forEach var="entry" items="${metodosPago}">
                                            <option value="${entry}" ${param.metodoPago == entry ? 'selected' : ''}>${entry}</option>
                                        </c:forEach>
                                    </select>
                                    <span class="text-danger">
                                        <c:out value="${requestScope.metodoPagoError}"/>
                                    </span>
								</div>
							</div>
							<div class="form-check my-3">
                                <c:set var="terminos" value="${param.terminos != null ? param.terminos : null}"/>
                                <input class="form-check-input" type="checkbox" value="1" id="terminos" name="terminos"
                                    required ${terminos != null ? 'checked' : ''}>
								<label class="form-check-label" for="terminos">
									Acepto los términos y condiciones
								</label>
                                <span class="text-danger">
                                    <c:out value="${requestScope.terminosError}"/>
                                </span>
							</div>

							<div class="d-grid gap-2 d-sm-flex justify-content-sm-end">
								<button type="submit" class="btn btn-primary">Reservar</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
