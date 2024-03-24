package com.ebanking.controller.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ebanking.entity.Appointment;
import com.ebanking.entity.Transaction;
import com.ebanking.service.AppointmentService;

@Controller(value="appointmentControllerOfAdmin")
public class AppointmentController {
	
	@Autowired
	private AppointmentService appointmentService;
	
	// APPOINTMENT CONTROLLER
	@RequestMapping(value = "/admin/appointment", method = RequestMethod.GET)
	public ModelAndView adminViewAppointment(ModelMap modelMap) {
		modelMap.put("appointment", appointmentService.findAll());
		ModelAndView mav = new ModelAndView("admin/appointment/appointment-list");
		return mav;
	}
	
	@RequestMapping(value = "/admin/appointment/verify", method = RequestMethod.POST)
	public String adminVerifyAppointment(HttpServletRequest request) {
		long id = Long.parseLong(request.getParameter("id"));
		Appointment appointment = appointmentService.find(id);
		appointmentService.acceptAppointment(appointment);
		appointmentService.save(appointment);
		return "redirect:/admin/appointment";
	}
	
	@RequestMapping(value = "/admin/appointment/detail/{id}", method = RequestMethod.GET)
	public ModelAndView adminViewAppointmentDetail(@PathVariable("id") long id, ModelMap modelMap) {
		Appointment appointment = appointmentService.find(id);
		modelMap.addAttribute("appointment", appointment);
		ModelAndView mav = new ModelAndView("admin/appointment/appointment-detail");
		return mav;
	}
}
