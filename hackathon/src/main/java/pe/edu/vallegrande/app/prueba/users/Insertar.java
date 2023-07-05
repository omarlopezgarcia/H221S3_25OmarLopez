package pe.edu.vallegrande.app.prueba.users;

import pe.edu.vallegrande.app.model.Student2;
import pe.edu.vallegrande.app.service.CrudStudentService2;

public class Insertar {

	public static void main(String[] args) {
		try {
			Student2 bean = new Student2("Omar", "Lopez Garcia", "DNI", "70905449", "PA", "I", "Matricula 1", "20-02-2023");
			CrudStudentService2 userService = new CrudStudentService2();
			userService.insert(bean);
			System.out.println(bean);
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
