package salary;

import java.sql.Date;

public class BonusVO {

	private int employee_id, bonus; 
	private Date bonus_date; 
	private String bonus_comment;
	
	public int getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}
	public int getBonus() {
		return bonus;
	}
	public void setBonus(int bonus) {
		this.bonus = bonus;
	}
	public Date getBonus_date() {
		return bonus_date;
	}
	public void setBonus_date(Date bonus_date) {
		this.bonus_date = bonus_date;
	}
	public String getBonus_comment() {
		return bonus_comment;
	}
	public void setBonus_comment(String bonus_comment) {
		this.bonus_comment = bonus_comment;
	}
	
	
} 
