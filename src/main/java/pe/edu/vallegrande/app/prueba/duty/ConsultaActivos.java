package pe.edu.vallegrande.app.prueba.duty;

import java.util.List;

import pe.edu.vallegrande.app.model.Duty;
import pe.edu.vallegrande.app.service.CrudDutyService;

public class ConsultaActivos {

	public static void main(String[] args) {
		try {
			CrudDutyService dutyService = new CrudDutyService();
			List<Duty> lista = dutyService.getActive();
			for (Duty duty : lista) {
				System.out.println(duty);
			}
		} catch (Exception e) {
			System.err.println("Hubo un error");
		}
	}
}
