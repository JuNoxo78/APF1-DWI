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
			<h4 class="h4 text-center text-muted">Resumen de Reserva</h4>
		</header>
	</div>

    <div class="row justify-content-center">
        <div class="col-5">
            <div class="card shadow-sm">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-sm align-middle">
                            <colgroup>
                                <col style="width: 35%;">
                                <col style="width: 65%;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row" class="table-success pe-3">Nombres</th>
                                    <td class="ps-3"><c:out value="${requestScope.nombres}"/></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="table-success pe-3">Apellidos</th>
                                    <td class="ps-3"><c:out value="${requestScope.apellidos}"/></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="table-success pe-3">DNI</th>
                                    <td class="ps-3"><c:out value="${requestScope.dni}"/></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="table-success pe-3">Correo</th>
                                    <td class="ps-3"><c:out value="${requestScope.email}"/></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="table-success pe-3">Cantidad de Entradas</th>
                                    <td class="ps-3"><c:out value="${requestScope.cantidadEntradas}"/></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="table-success pe-3">Película</th>
                                    <td class="ps-3"><c:out value="${requestScope.pelicula}"/></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="table-success pe-3">Horario</th>
                                    <td class="ps-3"><c:out value="${requestScope.horasDisponibles}"/></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="table-success pe-3">Metodo de Pago</th>
                                    <td class="ps-3"><c:out value="${requestScope.metodoPago}"/></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="table-success pe-3">Total a Pagar</th>
                                    <td class="ps-3">S/<c:out value="${requestScope.totalPagar}"/></td>
                                </tr>
                        </tbody>
                        </table>

                        <div class="d-grid gap-2 d-sm-flex justify-content-sm-end">
                            <a class="btn btn-outline-success" href="<%= request.getContextPath() %>/">Volver al formulario</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
