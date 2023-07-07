package pe.edu.vallegrande.app.prueba.duty;

import pe.edu.vallegrande.app.model.Duty;
import pe.edu.vallegrande.app.service.CrudDutyService;

public class ConsultaID {

	public static void main(String[] args) {
		try {
			CrudDutyService dutyService = new CrudDutyService();
			Duty bean = dutyService.getForId("2");
			System.out.println(bean);
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
