package pe.edu.vallegrande.app.prueba.users;

import pe.edu.vallegrande.app.model.Student2;
import pe.edu.vallegrande.app.service.CrudStudentService2;

public class ConsultaID {

	public static void main(String[] args) {
		try {
			CrudStudentService2 userService = new CrudStudentService2();
			Student2 bean = userService.getForId("2");
			System.out.println(bean);
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
