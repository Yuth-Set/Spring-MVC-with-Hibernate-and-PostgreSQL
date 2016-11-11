package spring.mvc.hibernate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import spring.mvc.hibernate.model.Phone;
import spring.mvc.hibernate.service.PhoneService;

@Controller
public class PhoneController {

	private PhoneService phoneService;

	@Autowired(required = true)
	@Qualifier(value = "phoneService")

	public void setPhoneService(PhoneService ps) {
		this.phoneService = ps;
	}

	@RequestMapping(value = "/phones", method = RequestMethod.GET)
	public String listPhones(Model model, Integer offset, Integer maxResults) {
		model.addAttribute("phone", new Phone());
		model.addAttribute("listPhones", this.phoneService.listPhones(offset, maxResults));
		model.addAttribute("count", phoneService.countPhonesRecord());
		model.addAttribute("offset", offset);
		return "phone";
	}

	// For add and update phone both
	@RequestMapping(value = "/phone/add", method = RequestMethod.POST)
	public String addPhone(@ModelAttribute("phone") Phone p) {

		if (p.getId() == 0) {
			// new phone, add it
			this.phoneService.addPhone(p);
		} else {
			// existing phone, call update
			this.phoneService.updatePhone(p);
		}

		return "redirect:/phones";

	}

	@RequestMapping("/remove/{id}")
	public String removePhone(@PathVariable("id") int id) {

		this.phoneService.removePhone(id);
		return "redirect:/phones";
	}

	@RequestMapping("/edit/{id}")
	public String editPhone(@PathVariable("id") int id, Model model, Integer offset, Integer maxResults) {
		model.addAttribute("phone", phoneService.getPhoneById(id));
		model.addAttribute("listPhones", phoneService.listPhones(offset, maxResults));
		model.addAttribute("count", phoneService.countPhonesRecord());
		return "phone";
	}

	@RequestMapping("/search")
	public String searchPhones(@RequestParam("key") String key, Model model, Integer offset, Integer maxResults) {
		model.addAttribute("phone", new Phone());
		model.addAttribute("listPhones", phoneService.search(key, offset, maxResults));
		model.addAttribute("count", phoneService.countPhonesRecord());
		model.addAttribute("searchKey", "?key=" + key);
		return "phone";
	}
}
