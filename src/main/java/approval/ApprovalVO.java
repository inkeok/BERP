package approval;

import java.sql.Date;

public class ApprovalVO {
	
	private int employee_id, department_id, company_cd, admin_cnt;
	
	private String email, file_name, file_path,
	document_title, document_content, document_code, document_check;
	
	private Date document_date;

	public int getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}

	public int getDepartment_id() {
		return department_id;
	}

	public void setDepartment_id(int department_id) {
		this.department_id = department_id;
	}

	public int getCompany_cd() {
		return company_cd;
	}

	public void setCompany_cd(int company_cd) {
		this.company_cd = company_cd;
	}

	public int getAdmin_cnt() {
		return admin_cnt;
	}

	public void setAdmin_cnt(int admin_cnt) {
		this.admin_cnt = admin_cnt;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}

	public String getDocument_title() {
		return document_title;
	}

	public void setDocument_title(String document_title) {
		this.document_title = document_title;
	}

	public String getDocument_content() {
		return document_content;
	}

	public void setDocument_content(String document_content) {
		this.document_content = document_content;
	}

	public String getDocument_code() {
		return document_code;
	}

	public void setDocument_code(String document_code) {
		this.document_code = document_code;
	}

	public String getDocument_check() {
		return document_check;
	}

	public void setDocument_check(String document_check) {
		this.document_check = document_check;
	}

	public Date getDocument_date() {
		return document_date;
	}

	public void setDocument_date(Date document_date) {
		this.document_date = document_date;
	}
	
	
}
