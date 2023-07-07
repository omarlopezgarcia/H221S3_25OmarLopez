package pe.edu.vallegrande.app.prueba.pastudent;

import java.util.List;

import pe.edu.vallegrande.app.model.Pastudent;
import pe.edu.vallegrande.app.service.CrudPastudentService;

public class ConsultaActivos {

	public static void main(String[] args) {
		try {
			CrudPastudentService pastudentService = new CrudPastudentService();
			List<Pastudent> lista = pastudentService.getActive();
			for (Pastudent pastudent : lista) {
				System.out.println(pastudent);
			}
		} catch (Exception e) {
			System.err.println("Hubo un error");
		}
	}
}
