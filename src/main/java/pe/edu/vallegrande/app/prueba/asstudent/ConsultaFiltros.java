package pe.edu.vallegrande.app.prueba.asstudent;

import java.util.List;

import pe.edu.vallegrande.app.model.Asstudent;
import pe.edu.vallegrande.app.service.CrudAsstudentService;

public class ConsultaFiltros {

	public static void main(String[] args) {
		try {
			Asstudent bean = new Asstudent();
			bean.setNames("");
			bean.setLast_name("");
			bean.setSemester("");
			CrudAsstudentService asstudentService = new CrudAsstudentService();
			List<Asstudent> lista = asstudentService.get(bean);
			for (Asstudent asstudent : lista) {
				System.out.println(asstudent);
			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
