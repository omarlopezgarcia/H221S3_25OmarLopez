package pe.edu.vallegrande.app.prueba.users;

import pe.edu.vallegrande.app.model.Student2;
import pe.edu.vallegrande.app.service.CrudStudentService2;

public class Editar {

	public static void main(String[] args) {
		try {
			Student2 bean = new Student2(2,"Miguel","Cuadros","DNI","70000002","mcuadros@gmail.com","900000002");
			CrudStudentService2 userService = new CrudStudentService2();
			userService.update(bean);
			System.out.println(bean);
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
