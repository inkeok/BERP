package work;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class HolidayResultVO {
	private String employee_id, department_id, company_cd, work_code, work_status;
	 @DateTimeFormat(pattern = "yyyy-MM-dd")private Date  holiday_date,
	work_date;
	public String getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(String employee_id) {
		this.employee_id = employee_id;
	}
	public String getDepartment_id() {
		return department_id;
	}
	public void setDepartment_id(String department_id) {
		this.department_id = department_id;
	}
	public String getCompany_cd() {
		return company_cd;
	}
	public void setCompany_cd(String company_cd) {
		this.company_cd = company_cd;
	}
	public String getWork_code() {
		return work_code;
	}
	public void setWork_code(String work_code) {
		this.work_code = work_code;
	}
	public String getWork_status() {
		return work_status;
	}
	public void setWork_status(String work_status) {
		this.work_status = work_status;
	}
	public Date getHoliday_date() {
		return holiday_date;
	}
	public void setHoliday_date(Date holiday_date) {
		this.holiday_date = holiday_date;
	}
	public Date getWork_date() {
		return work_date;
	}
	public void setWork_date(Date work_date) {
		this.work_date = work_date;
	}
	
	
}
