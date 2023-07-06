package pe.edu.vallegrande.app.prueba.pastudent;

import pe.edu.vallegrande.app.service.CrudPastudentService;

public class Eliminar {

	public static void main(String[] args) {
		try {
			CrudPastudentService pastudentService = new CrudPastudentService();
			pastudentService.delete("12");
			System.out.println("Usuario eliminado correctamente.");
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
