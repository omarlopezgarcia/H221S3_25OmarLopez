package pe.edu.vallegrande.app.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import pe.edu.vallegrande.app.model.Duty;
import pe.edu.vallegrande.app.service.CrudDutyService;

@WebServlet({ "/DutyBuscar", "/DutyProcesar", "/DutyActualizar", "/DutyHistorial" })
public class DutyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private CrudDutyService service = new CrudDutyService();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getServletPath();
		switch (path) {
		case "/DutyBuscar":
			buscar(request, response);
			break;
		case "/DutyProcesar":
			procesar(request, response);
			break;
		case "/DutyActualizar":
			actualizar(request, response);
			break;
		case "/DutyHistorial":
			historial(request, response);
			break;
		}
	}

	private void procesar(HttpServletRequest request, HttpServletResponse response) {
		// Datos
		String accion = request.getParameter("accion");
		Duty bean = new Duty();
		bean.setIdentifier(Integer.parseInt(request.getParameter("identifier")));
		bean.setTitle(request.getParameter("title"));
		bean.setDates(request.getParameter("dates"));
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
		String title = request.getParameter("names");
		// Proceso
		Duty bean = new Duty();
		bean.setTitle(title);
		List<Duty> lista = service.get(bean);
		// Preparando el JSON
		Gson gson = new Gson();
		String data = gson.toJson(lista);
		// Reporte
		ControllerUtil.responseJson(response, data);
	}

	private void actualizar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Duty> lista = service.getActive();
		Gson gson = new Gson();
		String data = gson.toJson(lista);
		ControllerUtil.responseJson(response, data);
	}

	private void historial(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Duty> lista = service.getInactive();
		Gson gson = new Gson();
		String data = gson.toJson(lista);
		ControllerUtil.responseJson(response, data);
	}

}
