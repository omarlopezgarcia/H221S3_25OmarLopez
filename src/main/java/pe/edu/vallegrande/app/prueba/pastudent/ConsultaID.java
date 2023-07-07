package pe.edu.vallegrande.app.prueba.pastudent;

import pe.edu.vallegrande.app.model.Pastudent;
import pe.edu.vallegrande.app.service.CrudPastudentService;

public class ConsultaID {

	public static void main(String[] args) {
		try {
			CrudPastudentService pastudentService = new CrudPastudentService();
			Pastudent bean = pastudentService.getForId("2");
			System.out.println(bean);
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
