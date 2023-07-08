package pe.edu.vallegrande.app.prueba.duty;

import java.util.List;

import pe.edu.vallegrande.app.model.Duty;
import pe.edu.vallegrande.app.service.CrudDutyService;

public class ConsultaFiltros {

	public static void main(String[] args) {
		try {
			Duty bean = new Duty();
			bean.setTitle("Matricula");
			CrudDutyService dutyService = new CrudDutyService();
			List<Duty> lista = dutyService.get(bean);
			for (Duty duty : lista) {
				System.out.println(duty);
			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
