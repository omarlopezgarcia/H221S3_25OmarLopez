package pe.edu.vallegrande.app.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import pe.edu.vallegrande.app.model.Asstudent;
import pe.edu.vallegrande.app.service.CrudAsstudentService;

@WebServlet({ "/AsstudentBuscar", "/AsstudentProcesar", "/AsstudentActualizar", "/AsstudentHistorial" })
public class AsstudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private CrudAsstudentService service = new CrudAsstudentService();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getServletPath();
		switch (path) {
		case "/AsstudentBuscar":
			buscar(request, response);
			break;
		case "/AsstudentProcesar":
			procesar(request, response);
			break;
		case "/AsstudentActualizar":
			actualizar(request, response);
			break;
		case "/AsstudentHistorial":
			historial(request, response);
			break;
		}
	}

	private void procesar(HttpServletRequest request, HttpServletResponse response) {
		// Datos
		String accion = request.getParameter("accion");
		Asstudent bean = new Asstudent();
		bean.setIdentifier(Integer.parseInt(request.getParameter("identifier")));
		bean.setNames(request.getParameter("names"));
		bean.setLast_name(request.getParameter("last_name"));
		bean.setDocument_type(request.getParameter("document_type"));
		bean.setDocument_number(request.getParameter("document_number"));
		bean.setCareer(request.getParameter("career"));
		bean.setSemester(request.getParameter("semester"));
		bean.setTitle(request.getParameter("title"));
		bean.setAmount(request.getParameter("amount"));
		bean.setActive(request.getParameter("active"));
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
		String names = request.getParameter("names");
		String last_name = request.getParameter("last_name");
		String semester = request.getParameter("semester");
		String title = request.getParameter("title");
		// Proceso
		Asstudent bean = new Asstudent();
		bean.setNames(names);
		bean.setLast_name(last_name);
		bean.setSemester(semester);
		bean.setTitle(title);
		List<Asstudent> lista = service.get(bean);
		// Preparando el JSON
		Gson gson = new Gson();
		String data = gson.toJson(lista);
		// Reporte
		ControllerUtil.responseJson(response, data);
	}

	private void actualizar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Asstudent> lista = service.getActive();
		Gson gson = new Gson();
		String data = gson.toJson(lista);
		ControllerUtil.responseJson(response, data);
	}

	private void historial(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Asstudent> lista = service.getInactive();
		Gson gson = new Gson();
		String data = gson.toJson(lista);
		ControllerUtil.responseJson(response, data);
	}

}
