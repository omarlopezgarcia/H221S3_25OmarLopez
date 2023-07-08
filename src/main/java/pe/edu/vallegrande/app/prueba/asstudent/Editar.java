package pe.edu.vallegrande.app.prueba.asstudent;

import pe.edu.vallegrande.app.model.Asstudent;
import pe.edu.vallegrande.app.service.CrudAsstudentService;

public class Editar {

	public static void main(String[] args) {
		try {
			Asstudent bean = new Asstudent(16, "Omar", "Lopez Garcia", "DNI", "15355641", "AS", "2", "Matricula 2", "200.00", "C");
			CrudAsstudentService asstudentService = new CrudAsstudentService();
			asstudentService.update(bean);
			System.out.println(bean);
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
