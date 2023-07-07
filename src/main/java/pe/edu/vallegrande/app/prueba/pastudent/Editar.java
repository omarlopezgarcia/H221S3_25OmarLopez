package pe.edu.vallegrande.app.prueba.pastudent;

import pe.edu.vallegrande.app.model.Pastudent;
import pe.edu.vallegrande.app.service.CrudPastudentService;

public class Editar {

	public static void main(String[] args) {
		try {
			Pastudent bean = new Pastudent(16,"Omar","Lopez Garcia","DNI","15355641", "PA", "2");
			CrudPastudentService pastudentService = new CrudPastudentService();
			pastudentService.update(bean);
			System.out.println(bean);
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
