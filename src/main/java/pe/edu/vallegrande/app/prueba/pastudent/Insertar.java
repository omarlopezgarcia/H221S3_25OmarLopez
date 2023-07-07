package pe.edu.vallegrande.app.prueba.pastudent;

import pe.edu.vallegrande.app.model.Pastudent;
import pe.edu.vallegrande.app.service.CrudPastudentService;

public class Insertar {

	public static void main(String[] args) {
		try {
			Pastudent bean = new Pastudent("Omar", "Lopez Garcia", "DNI", "71905459", "PA", "2");
			CrudPastudentService pastudentService = new CrudPastudentService();
			pastudentService.insert(bean);
			System.out.println(bean);
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
