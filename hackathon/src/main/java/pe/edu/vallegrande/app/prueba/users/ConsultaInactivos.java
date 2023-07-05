package pe.edu.vallegrande.app.prueba.users;

import java.util.List;

import pe.edu.vallegrande.app.model.Student2;
import pe.edu.vallegrande.app.service.CrudStudentService2;

public class ConsultaInactivos {

	public static void main(String[] args) {
		try {
			CrudStudentService2 userService = new CrudStudentService2();
			List<Student2> lista = userService.getInactive();
			for (Student2 user : lista) {
				System.out.println(user);
			}
		} catch (Exception e) {
			System.err.println("Hubo un error");
		}
	}
}
