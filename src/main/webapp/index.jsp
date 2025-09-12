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
			<h1 class="h3 text-center">Cineplanet</h1>
			<p class="text-center text-muted mb-0">Reserva de entradas</p>
		</header>

		<div class="row justify-content-center">
			<div class="col-12 col-md-10 col-lg-8">
				<div class="card shadow-sm">
					<div class="card-body">
						<form action="" method="post" novalidate>

							<div class="row g-3">
								<div class="col-md-6">
									<label for="nombres" class="form-label">Nombres</label>
									<input type="text" class="form-control" id="nombres" name="nombres" value="" required>
								</div>
								<div class="col-md-6">
									<label for="apellidos" class="form-label">Apellidos</label>
									<input type="text" class="form-control" id="apellidos" name="apellidos" value="" required>
								</div>
								<div class="col-md-4">
									<label for="dni" class="form-label">DNI</label>
									<input type="text" class="form-control" id="dni" name="dni" maxlength="8"
										pattern="\d{8}" title="Debe tener exactamente 8 dígitos" value="" required>
								</div>
								<div class="col-md-5">
									<label for="correo" class="form-label">Correo</label>
									<input type="email" class="form-control" id="correo" name="correo"
										placeholder="Ej: usuario@dominio.com" value="" required>
								</div>
								<div class="col-md-5">
									<label for="cantidadEntradas" class="form-label">Cantidad de Entradas</label>
									<input type="number" class="form-control" id="cantidadEntradas" name="cantidadEntradas"
										value="" required>
								</div>
								<div class="col-md-4">
									<label for="pelicula" class="form-label">Película</label>
                                    <select id="pelicula" name="pelicula" class="form-select" required>
                                            <option disabled>
                                                Seleccionar...
                                            </option>
                                    </select>
								</div>
								<div class="col-md-4">
									<label for="horasDisponibles" class="form-label">Horarios Disponibles</label>
                                    <select id="horasDisponibles" name="horasDisponibles" class="form-select" required>
                                            <option disabled>
                                                Seleccionar...
                                            </option>
                                    </select>
								</div>
								<div class="col-md-4">
									<label for="metodoPago" class="form-label">Método de Pago</label>
                                    <select id="metodoPago" name="metodoPago" class="form-select" required>
                                            <option disabled>
                                                Seleccionar...
                                            </option>
                                    </select>
								</div>
							</div>
							<div class="form-check my-3">
								<input class="form-check-input" type="checkbox" value="1" id="terminos" name="terminos"
									required>
								<label class="form-check-label" for="terminos">
									Acepto los términos y condiciones
								</label>
							</div>

                            <%-- <c:if test="${not empty errors}">
                                <div class="alert alert-info" role="alert">
                                    <h4>Error en formulario</h4>
                                        <ol class="mb-0">
                                            <c:forEach var="error" items="${errors.values()}">
                                                <li>${error}</li>
                                            </c:forEach>
                                        </ol>
                                </div>
                            </c:if> --%>

							<div class="d-grid gap-2 d-sm-flex justify-content-sm-end">
								<button type="reset" class="btn btn-outline-secondary">Limpiar</button>
								<button type="submit" class="btn btn-primary">Reservar</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
