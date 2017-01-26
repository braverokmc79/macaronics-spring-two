package com.comlu.macaronics.DTO;



public class MacaronicUser {

	private String name;
	private String id;
	private String birthday;
	private String email;
	private String gender;
	
	public MacaronicUser(){
		super();
	}
	
	public MacaronicUser(String name, String id, String birthday, String email, String gender){
		super();
		this.name=name;
		this.id=id;
		this.birthday=birthday;
		this.email=email;
		this.gender=gender;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Override
	public String toString() {
		return "MacaronicUser [name=" + name + ", id=" + id + ", birthday=" + birthday + ", email=" + email
				+ ", gender=" + gender + "]";
	}
	
	
	
	
}
