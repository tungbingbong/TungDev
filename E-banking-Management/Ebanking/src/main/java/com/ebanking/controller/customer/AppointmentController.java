package com.ebanking.controller.customer;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ebanking.dto.MyUser;
import com.ebanking.entity.Appointment;
import com.ebanking.entity.User;
import com.ebanking.service.AppointmentService;
import com.ebanking.service.UserService;

@Controller(value="appointmentControllerOfCustomer")
public class AppointmentController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private AppointmentService appointmentService;
	
	// APPOINTMENT CONTROLLER	
		@RequestMapping(value = "/customer/appointment", method = RequestMethod.GET)
		public ModelAndView customerViewAppointment(ModelMap modelMap) {
			User user = userService.getCurrentUser();
			modelMap.put("appointment", appointmentService.findByUser(user));
			ModelAndView mav = new ModelAndView("customer/appointment/appointment-list");
			return mav;
		}
		
		@RequestMapping(value = "/customer/appointment/create", method = RequestMethod.GET)
		public ModelAndView customerCreateAppointment(Map<String, Object> model) {				
			Appointment appointment = new Appointment();
			model.put("appointment", appointment);
			ModelAndView mav = new ModelAndView("customer/appointment/create-appointment");
			return mav;
		}
		
		@RequestMapping(value = "/customer/appointment/create", method = RequestMethod.POST)
		public String customerCreateAppointment(@ModelAttribute("appointment") @Valid Appointment appointment, 
				BindingResult bindingResult, HttpServletRequest request) throws ParseException {
			User user = userService.getCurrentUser();
			appointmentService.createNewAppointment(appointment, user, request);
			// Check the bindingResult error
//			System.out.println("BR has error: " + bindingResult.hasErrors() + bindingResult.getFieldError());
			
			if( bindingResult.hasErrors()) {
//				System.out.println("Error: " + appointment.toString());
				return "customer/appointment/create-appointment";
			}
//			System.out.println("Success: " + appointment.toString());
			appointmentService.save(appointment);
			return "redirect:/customer/appointment";
		}
		
		@RequestMapping(value = "/customer/appointment/delete/{id}", method = RequestMethod.GET)
		public String customerDeleteAppointment(@PathVariable("id") long id) {
			appointmentService.delete(id);
			return "redirect:/customer/appointment";
		}
}
