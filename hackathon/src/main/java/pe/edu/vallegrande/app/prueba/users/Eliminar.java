package pe.edu.vallegrande.app.prueba.users;

import pe.edu.vallegrande.app.service.CrudStudentService2;

public class Eliminar {

	public static void main(String[] args) {
		try {
			CrudStudentService2 userService = new CrudStudentService2();
			userService.delete("6");
			System.out.println("Usuario eliminado correctamente.");
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
