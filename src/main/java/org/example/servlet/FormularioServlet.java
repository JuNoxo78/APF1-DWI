package org.example.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

@WebServlet("/FormularioServlet")
public class FormularioServlet extends HttpServlet {

    private Map<String, String> e;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException {
        processRequest(req, res);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        e = new LinkedHashMap<>();

        String nombres = request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos");
        String horasDisponibles = request.getParameter("horasDisponibles");
        String metodoPago = request.getParameter("metodoPago");
        String terminos = request.getParameter("terminos");
        String email = request.getParameter("email");
        String dni = request.getParameter("dni");
        String pelicula = request.getParameter("pelicula");
        String cantidadEntStr = request.getParameter("cantidadEntradas");

        if (nombres == null || nombres.trim().isEmpty()) {
            e.put("nombresError", "El nombre es obligatorio.");
        }
        if (apellidos == null || apellidos.trim().isEmpty()) {
            e.put("apellidosError", "El apellido es obligatorio.");
        }
        if (horasDisponibles == null || horasDisponibles.trim().isEmpty()) {
            e.put("horasDisponiblesError", "Debe seleccionar un horario.");
        }
        if (metodoPago == null || metodoPago.trim().isEmpty()) {
            e.put("metodoPagoError", "Debe seleccionar un método de pago.");
        }
        if (terminos == null) {
            e.put("terminosError", "(Debe aceptar)");
        }
        if (email == null || email.isEmpty()) {
            e.put("emailError", "El correo es obligatorio.");
        } else if (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            e.put("emailError", "Formato de correo inválido (ej: usuario@dominio.com).");
        }

        if (dni == null || !dni.matches("\\d{8}")) {
            e.put("dniError", "El DNI debe contener exactamente 8 dígitos numéricos.");
        }

        Integer cantidadEnt = null;
        if (cantidadEntStr == null || cantidadEntStr.trim().isEmpty()) {
            e.put("cantidadEntError", "Es necesario colocar la cantidad de entradas.");
        } else {
            try {
                cantidadEnt = Integer.parseInt(cantidadEntStr);
                if (cantidadEnt < 1 || cantidadEnt > 3) {
                    e.put("cantidadEntError", "Se pueden reservar de  1 a 3 entradas");
                }
            } catch (NumberFormatException n) {
                e.put("cantidadEntError", "La edad debe ser un número válido");
            }
        }

        if (pelicula == null || pelicula.trim().isEmpty()) {
            e.put("peliculaError", "Debe seleccionar una película.");
        }

        if (!e.isEmpty()) {
            e.forEach(
                (k,v) -> request.setAttribute(k, v)
            );
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }

        int totalPagar = cantidadEnt * 10;

        request.setAttribute("nombres", nombres);
        request.setAttribute("apellidos", apellidos);
        request.setAttribute("email", email);
        request.setAttribute("dni", dni);
        request.setAttribute("pelicula", pelicula);
        request.setAttribute("cantidadEntradas", cantidadEntStr);
        request.setAttribute("horasDisponibles", horasDisponibles);
        request.setAttribute("metodoPago", metodoPago);
        request.setAttribute("totalPagar", totalPagar);
        request.getRequestDispatcher("resumen.jsp").forward(request, response);
    }
}
