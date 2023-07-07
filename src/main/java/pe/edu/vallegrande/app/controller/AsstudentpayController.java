package pe.edu.vallegrande.app.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import pe.edu.vallegrande.app.model.Asstudentpay;
import pe.edu.vallegrande.app.service.CrudAsstudentpayService;

@WebServlet({ "/AsstudentpayBuscar", "/AsstudentpayProcesar", "/AsstudentpayActualizar", "/AsstudentpayHistorial" })
public class AsstudentpayController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private CrudAsstudentpayService service = new CrudAsstudentpayService();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getServletPath();
		switch (path) {
		case "/AsstudentpayBuscar":
			buscar(request, response);
			break;
		case "/AsstudentpayProcesar":
			procesar(request, response);
			break;
		case "/AsstudentpayActualizar":
			actualizar(request, response);
			break;
		case "/AsstudentpayHistorial":
			historial(request, response);
			break;
		}
	}

	private void procesar(HttpServletRequest request, HttpServletResponse response) {
		// Datos
		String accion = request.getParameter("accion");
		Asstudentpay bean = new Asstudentpay();
		bean.setIdentifier(Integer.parseInt(request.getParameter("identifier")));
		bean.setAmount(request.getParameter("amount"));
		bean.setAsstudent_identifier(request.getParameter("asstudent_identifier"));
		bean.setDuty_identifier(request.getParameter("duty_identifier"));
		// Proceso
		try {
			switch (accion) {
			case ControllerUtil.CRUD_NUEVO:
				service.insert(bean);
				break;
			case ControllerUtil.CRUD_EDITAR:
				service.update(bean);
				break;
			case ControllerUtil.CRUD_ELIMINAR:
				service.delete(bean.getIdentifier().toString());
				break;
			case ControllerUtil.CRUD_RESTAURAR:
				service.restore(bean.getIdentifier().toString());
				break;
			case ControllerUtil.CRUD_ELIMINATE:
				service.eliminate(bean.getIdentifier().toString());
				break;
			default:
				throw new IllegalArgumentException("Unexpected value: " + accion);
			}
			ControllerUtil.responseJson(response, "Proceso ok.");
		} catch (Exception e) {
			ControllerUtil.responseJson(response, e.getMessage());
		}
	}

	private void buscar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Datos
		String asstudent_identifier = request.getParameter("asstudent_identifier");
		String duty_identifier = request.getParameter("duty_identifier");
		// Proceso
		Asstudentpay bean = new Asstudentpay();
		bean.setAsstudent_identifier(asstudent_identifier);
		bean.setDuty_identifier(duty_identifier);
		List<Asstudentpay> lista = service.get(bean);
		// Preparando el JSON
		Gson gson = new Gson();
		String data = gson.toJson(lista);
		// Reporte
		ControllerUtil.responseJson(response, data);
	}

	private void actualizar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Asstudentpay> lista = service.getActive();
		Gson gson = new Gson();
		String data = gson.toJson(lista);
		ControllerUtil.responseJson(response, data);
	}

	private void historial(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Asstudentpay> lista = service.getInactive();
		Gson gson = new Gson();
		String data = gson.toJson(lista);
		ControllerUtil.responseJson(response, data);
	}

}
