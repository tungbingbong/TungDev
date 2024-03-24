package com.ebanking.controller.admin;

import java.text.ParseException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ebanking.entity.InterestRate;
import com.ebanking.service.InterestRateService;

@Controller(value="interestRateControllerOfAdmin")
public class InterestRateController {
	
	@Autowired
	private InterestRateService interestRateService;

	// EXTRAS CONTROLLER
	@RequestMapping(value = "/admin/interest-rate", method = RequestMethod.GET)
	public ModelAndView adminViewInterestRate(ModelMap modelMap) {
		modelMap.put("interestRate", interestRateService.findAll());
		ModelAndView mav = new ModelAndView("admin/interest-rate/interest-rate-list");
		return mav;
	}
	
	@RequestMapping(value = "/admin/interest-rate/create", method = RequestMethod.GET)
	public ModelAndView adminCreateInterestRate(Map<String, Object> model) {
		InterestRate interestRate = new InterestRate();
		model.put("interestRate", interestRate);
		ModelAndView mav = new ModelAndView("admin/interest-rate/create-interest-rate");
		return mav;
	}
	
	@RequestMapping(value = "/admin/interest-rate/create", method = RequestMethod.POST)
	public String customerCreateSavingAccount(@Valid InterestRate interestRate, BindingResult bindingResult, 
			HttpServletRequest request) {
		if( bindingResult.hasErrors()) {
			return "admin/interest-rate/create-interest-rate";
		}
		interestRateService.createNewInterestRate(interestRate, request);
		interestRateService.save(interestRate);		
		return "redirect:/admin/interest-rate";
	}
	
	@RequestMapping(value = "/admin/interest-rate/edit/{id}", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView adminEditInterestRate(@PathVariable("id") long id, ModelMap modelMap, Map<String, Object> model) {
		InterestRate interestRate = interestRateService.find(id);
		modelMap.addAttribute("interestRate", interestRate);
		model.put("interestRate", interestRate);
		ModelAndView mav = new ModelAndView("admin/interest-rate/edit-interest-rate");
		return mav;
	}
	
	@RequestMapping(value = "/admin/interest-rate/edit/{id}", method = RequestMethod.POST)
	public String adminEditCustomer(@PathVariable("id") Long id, @Valid InterestRate interestRate, BindingResult bindingResult, 
			HttpServletRequest request) throws ParseException {
		interestRate = interestRateService.find(id);
		if( bindingResult.hasErrors()) {
			return "admin/interest-rate/edit-interest-rate";
		}
		interestRateService.createNewInterestRate(interestRate, request);
		interestRateService.save(interestRate);
		return "redirect:/admin/interest-rate";
	}
	
	@RequestMapping(value = "/admin/interest-rate/delete/{id}", method = RequestMethod.GET)
	public String adminDeleteInterestRate(@PathVariable("id") long id) {
		interestRateService.delete(id);
		return "redirect:/admin/interest-rate";
	}
		
}
