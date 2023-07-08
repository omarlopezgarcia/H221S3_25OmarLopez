package pe.edu.vallegrande.app.model;

public class Duty {

	private Integer identifier;
	private String title, dates, amount, active;
	
	public Duty() {
		// TODO Auto-generated constructor stub
	}

	public Duty(Integer identifier, String title, String dates, String amount, String active) {
		super();
		this.identifier = identifier;
		this.title = title;
		this.dates = dates;
		this.dates = amount;
		this.active = active;
	}

	public Duty(String title, String dates, String amount, String active) {
		super();
		this.title = title;
		this.dates = dates;
		this.amount = amount;
		this.active = active;
	}

	public Duty(Integer identifier, String title, String dates, String amount) {
		super();
		this.identifier = identifier;
		this.title = title;
		this.dates = dates;
		this.amount = amount;
	}

	public Duty(String title, String dates, String amount) {
		super();
		this.title = title;
		this.dates = dates;
		this.amount = amount;
	}

	public Integer getIdentifier() {
		return identifier;
	}

	public void setIdentifier(Integer identifier) {
		this.identifier = identifier;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDates() {
		return dates;
	}

	public void setDates(String dates) {
		this.dates = dates;
	}
	
	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}
	
	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}
	
	@Override
	public String toString() {
		String data = "[" + this.identifier;
		data += ", " + this.title;
		data += ", " + this.dates;
		data += ", " + this.amount;
		data += ", " + this.active + "]";
		return data;
	}
}
