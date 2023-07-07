package pe.edu.vallegrande.app.prueba.pastudent;

import pe.edu.vallegrande.app.service.CrudPastudentService;

public class Restaurar {

	public static void main(String[] args) {
		try {
			CrudPastudentService pastudentService = new CrudPastudentService();
			pastudentService.restore("12");
			System.out.println("Usuario restaurado correctamente.");
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
