package com.ebanking.service;

import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.ebanking.entity.Appointment;
import com.ebanking.entity.User;

public interface AppointmentService {
	public List<Appointment> findAll();
	
	public Appointment find(long id);
	
	public Iterable<Appointment> findByUser(User user);
	
	public void save(Appointment appointment);

	public void delete(long id);
	
	public void createNewAppointment(Appointment appointment, User user, HttpServletRequest request) throws ParseException;
	
	public void acceptAppointment(Appointment appointment);
}
