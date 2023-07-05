package pe.edu.vallegrande.app.prueba.users;

import java.util.List;

import pe.edu.vallegrande.app.model.Student2;
import pe.edu.vallegrande.app.service.CrudStudentService2;

public class ConsultaActivos {

	public static void main(String[] args) {
		try {
			CrudStudentService2 studentService = new CrudStudentService2();
			List<Student2> lista = studentService.getDeudasAS();
			for (Student2 student2 : lista) {
				System.out.println(student2);
			}
		} catch (Exception e) {
			System.err.println("Hubo un error");
		}
	}
}
