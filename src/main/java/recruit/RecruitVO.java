package recruit;

import java.sql.Date;

public class RecruitVO {

	private String recruit_num, file_name, file_path, employee_pattern, recruit_title;
	private Date recruit_start, recruit_end;
	public String getRecruit_title() {
		return recruit_title;
	}
	public void setRecruit_title(String recruit_title) {
		this.recruit_title = recruit_title;
	}
	public String getRecruit_num() {
		return recruit_num;
	}
	public void setRecruit_num(String recruit_num) {
		this.recruit_num = recruit_num;
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
	public String getEmployee_pattern() {
		return employee_pattern;
	}
	public void setEmployee_pattern(String employee_pattern) {
		this.employee_pattern = employee_pattern;
	}
	public Date getRecruit_start() {
		return recruit_start;
	}
	public void setRecruit_start(Date recruit_start) {
		this.recruit_start = recruit_start;
	}
	public Date getRecruit_end() {
		return recruit_end;
	}
	public void setRecruit_end(Date recruit_end) {
		this.recruit_end = recruit_end;
	}
	
	
	
}
