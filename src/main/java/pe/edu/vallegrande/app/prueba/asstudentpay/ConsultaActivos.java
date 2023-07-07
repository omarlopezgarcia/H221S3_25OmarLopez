package pe.edu.vallegrande.app.prueba.asstudentpay;

import java.util.List;

import pe.edu.vallegrande.app.model.Asstudentpay;
import pe.edu.vallegrande.app.service.CrudAsstudentpayService;

public class ConsultaActivos {

	public static void main(String[] args) {
		try {
			CrudAsstudentpayService asstudentpayService = new CrudAsstudentpayService();
			List<Asstudentpay> lista = asstudentpayService.getActive();
			for (Asstudentpay asstudentpay : lista) {
				System.out.println(asstudentpay);
			}
		} catch (Exception e) {
			System.err.println("Hubo un error");
		}
	}
}
