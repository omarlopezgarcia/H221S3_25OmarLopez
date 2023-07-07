package pe.edu.vallegrande.app.prueba.asstudentpay;

import pe.edu.vallegrande.app.service.CrudAsstudentService;

public class Eliminar {

	public static void main(String[] args) {
		try {
			CrudAsstudentService asstudentService = new CrudAsstudentService();
			asstudentService.delete("12");
			System.out.println("Usuario eliminado correctamente.");
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
