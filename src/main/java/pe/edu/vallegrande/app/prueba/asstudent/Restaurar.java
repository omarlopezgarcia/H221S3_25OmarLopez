package pe.edu.vallegrande.app.prueba.asstudent;

import pe.edu.vallegrande.app.service.CrudAsstudentService;

public class Restaurar {

	public static void main(String[] args) {
		try {
			CrudAsstudentService asstudentService = new CrudAsstudentService();
			asstudentService.restore("12");
			System.out.println("Usuario restaurado correctamente.");
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
