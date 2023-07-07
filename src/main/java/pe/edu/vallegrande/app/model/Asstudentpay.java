package pe.edu.vallegrande.app.model;

public class Asstudentpay {

	private Integer identifier;
	private String amount, active, asstudent_identifier, duty_identifier;

	public Asstudentpay() {
		// TODO Auto-generated constructor stub
	}

	public Asstudentpay(Integer identifier, String amount, String asstudent_identifier,
			String duty_identifier, String active) {
		super();
		this.identifier = identifier;
		this.amount = amount;
		this.asstudent_identifier = asstudent_identifier;
		this.duty_identifier = duty_identifier;
		this.active = active;
	}

	public Asstudentpay(String amount, String asstudent_identifier,
			String duty_identifier, String active) {
		super();
		this.amount = amount;
		this.asstudent_identifier = asstudent_identifier;
		this.duty_identifier = duty_identifier;
		this.active = active;
	}

	public Asstudentpay(Integer identifier, String amount, String asstudent_identifier,
			String duty_identifier) {
		super();
		this.identifier = identifier;
		this.amount = amount;
		this.asstudent_identifier = asstudent_identifier;
		this.duty_identifier = duty_identifier;
	}

	public Asstudentpay(String amount, String asstudent_identifier,
			String duty_identifier) {
		super();
		this.amount = amount;
		this.asstudent_identifier = asstudent_identifier;
		this.duty_identifier = duty_identifier;
	}
	
	public Integer getIdentifier() {
		return identifier;
	}

	public void setIdentifier(Integer identifier) {
		this.identifier = identifier;
	}
	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getAsstudent_identifier() {
		return asstudent_identifier;
	}

	public void setAsstudent_identifier(String asstudent_identifier) {
		this.asstudent_identifier = asstudent_identifier;
	}

	public String getDuty_identifier() {
		return duty_identifier;
	}

	public void setDuty_identifier(String duty_identifier) {
		this.duty_identifier = duty_identifier;
	}
	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}
	@Override
	public String toString() {
		String data = "[ " + this.identifier;
		data += ", " + this.amount;
		data += ", " + this.asstudent_identifier;
		data += ", " + this.duty_identifier;
		data += ", " + this.active + "]";
		return data;
	}
}