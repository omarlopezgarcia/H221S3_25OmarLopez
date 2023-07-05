package pe.edu.vallegrande.app.prueba.users;

import pe.edu.vallegrande.app.service.CrudStudentService2;

public class Restaurar {

	public static void main(String[] args) {
		try {
			CrudStudentService2 userService = new CrudStudentService2();
			userService.restore("7");
			System.out.println("Usuario restaurado correctamente.");
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
