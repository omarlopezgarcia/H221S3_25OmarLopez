package pe.edu.vallegrande.app.prueba.asstudent;

import pe.edu.vallegrande.app.model.Asstudent;
import pe.edu.vallegrande.app.service.CrudAsstudentService;

public class Insertar {

	public static void main(String[] args) {
		try {
			Asstudent bean = new Asstudent("Omar", "Lopez Garcia", "DNI", "70905418", "AS", "III");
			CrudAsstudentService asstudentService = new CrudAsstudentService();
			asstudentService.insert(bean);
			System.out.println(bean);
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
