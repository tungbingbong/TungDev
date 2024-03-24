package com.ebanking.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ebanking.entity.Appointment;
import com.ebanking.entity.User;
import com.ebanking.repository.AppointmentRepository;
import com.ebanking.service.AppointmentService;

@Service("appointmentService")
public class AppointmentServiceImpl implements AppointmentService {

	@Autowired
	private AppointmentRepository appointmentRepository;
	
	@Override
	public List<Appointment> findAll() {
		return appointmentRepository.findAll();
	}

	@Override
	public Appointment find(long id) {
		return appointmentRepository.findOne(id);
	}

	@Override
	public Iterable<Appointment> findByUser(User user) {	
		Collection<Appointment> appointmentList = new ArrayList<>();
		for(Appointment a : findAll()) {
			System.out.println(a.getUser().getId() == user.getId());
			if (a.getUser().getId() == user.getId()) {
				appointmentList.add(a);
			}
		}
		return appointmentList;
	}

	@Override
	public void save(Appointment appointment) {
		appointmentRepository.save(appointment);
	}

	@Override
	public void delete(long id) {
		appointmentRepository.delete(id);
	}

	@Override
	public void createNewAppointment(Appointment appointment, User user, HttpServletRequest request) throws ParseException {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'hh:mm");
		appointment.setUser(user);
		appointment.setName(request.getParameter("name"));
		if (!request.getParameter("date").equals("")) {
			appointment.setDate(format.parse(request.getParameter("date")));
		} else {
			appointment.setDate(null);
		}
		appointment.setDescription(request.getParameter("description"));
		appointment.setStatus(0);
	}

	@Override
	public void acceptAppointment(Appointment appointment) {
		appointment.setStatus(1);	
	}
}
