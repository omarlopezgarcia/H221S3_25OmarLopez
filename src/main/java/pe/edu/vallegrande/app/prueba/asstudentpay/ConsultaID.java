package pe.edu.vallegrande.app.prueba.asstudentpay;

import pe.edu.vallegrande.app.model.Asstudent;
import pe.edu.vallegrande.app.service.CrudAsstudentService;

public class ConsultaID {

	public static void main(String[] args) {
		try {
			CrudAsstudentService asstudentService = new CrudAsstudentService();
			Asstudent bean = asstudentService.getForId("2");
			System.out.println(bean);
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
