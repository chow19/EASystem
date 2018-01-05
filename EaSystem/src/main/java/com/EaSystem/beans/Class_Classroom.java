package com.EaSystem.beans;

import java.sql.Date;

public class Class_Classroom {
	Date class_date;
	int class_order;
	String classroom;
	int class_id;
	public String getClassroom() {
		return classroom;
	}
	public void setClassroom(String classroom) {
		this.classroom = classroom;
	}
	public Date getClass_date() {
		return class_date;
	}
	public void setClass_date(Date class_date) {
		this.class_date = class_date;
	}
	public int getClass_order() {
		return class_order;
	}
	public void setClass_order(int class_order) {
		this.class_order = class_order;
	}
	public int getClass_id() {
		return class_id;
	}
	public void setClass_id(int class_id) {
		this.class_id = class_id;
	}

}
