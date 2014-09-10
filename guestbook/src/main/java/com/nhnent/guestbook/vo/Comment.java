package com.nhnent.guestbook.vo;

import javax.validation.constraints.Size;
import org.hibernate.validator.constraints.NotEmpty;

public class Comment {

	private String cno;
	
	@NotEmpty
	@Size(max = 50)
	private String writer;

	@NotEmpty
	@Size(max = 50)
	private String email;

	@NotEmpty
	@Size(max = 50)
	private String passwd;
	
	@NotEmpty
	@Size(max = 500)
	private String contents;

	private String regdate;
	private String moddate;
	
	public String getCno() {
		return cno;
	}
	public void setCno(String cno) {
		this.cno = cno;
	}

	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getModdate() {
		return moddate;
	}
	public void setModdate(String moddate) {
		this.moddate = moddate;
	}

}
