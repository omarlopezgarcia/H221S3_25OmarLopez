package pe.edu.vallegrande.app.prueba.pastudent;

import java.util.List;

import pe.edu.vallegrande.app.model.Pastudent;
import pe.edu.vallegrande.app.service.CrudPastudentService;

public class ConsultaFiltros {

	public static void main(String[] args) {
		try {
			Pastudent bean = new Pastudent();
			bean.setNames("");
			bean.setLast_name("");
			bean.setSemester("");
			CrudPastudentService pastudentService = new CrudPastudentService();
			List<Pastudent> lista = pastudentService.get(bean);
			for (Pastudent pastudent : lista) {
				System.out.println(pastudent);
			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
