package com.qa.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.qa.models.Address;
import com.qa.models.Customer;

@SessionAttributes(names={"book_counts"})
@Controller
public class CheckoutController {

	@RequestMapping("/sendShippingAddress")
	public ModelAndView checkoutProcess(HttpSession session, @ModelAttribute("Address") Address shipping, @ModelAttribute("logged_in_customer") Customer customer)
	{	
		ModelAndView modelAndView = new ModelAndView("billing_address");
		shipping.setAddressType("shipping");
		shipping.setCustomerId(customer.getCustomerId());		
		session.setAttribute("shipping_address", shipping);
		
	    return modelAndView;
	}
	
	@RequestMapping("/sendBillingAddress")
	public ModelAndView checkoutProcessBilling(HttpSession session, @ModelAttribute("Address") Address billing, @ModelAttribute("logged_in_customer") Customer customer)
	{
		ModelAndView modelAndView = new ModelAndView("payment_form");
		billing.setAddressType("billing");
		billing.setCustomerId(customer.getCustomerId());
		session.setAttribute("billing_address", billing);

	    return modelAndView;
	}
	
	@RequestMapping("/paymentProcess")
	public ModelAndView paymentProcess(){
		ModelAndView modelAndView = new ModelAndView("confirm_order");
		
	    return modelAndView;
	}
	
	@RequestMapping("/confirm_order")
	public ModelAndView confirmOrder() {
		ModelAndView modelAndView = new ModelAndView("index");
		modelAndView.addObject("order_recieved", true);
		
		return modelAndView;
	}

	
	
	
	
	
	
}
