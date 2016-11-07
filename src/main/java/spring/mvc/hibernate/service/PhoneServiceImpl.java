package spring.mvc.hibernate.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import spring.mvc.hibernate.dao.PhoneDAO;
import spring.mvc.hibernate.model.Phone;

public class PhoneServiceImpl implements PhoneService {

	@Autowired
    private PhoneDAO phoneDAO;

	public void setPhoneDAO(PhoneDAO phoneDAO) {
		this.phoneDAO = phoneDAO;
	}

	@Override
    @Transactional
	public void addPhone(Phone p) {
		this.phoneDAO.addPhone(p);
		
	}

	@Override
    @Transactional
	public void updatePhone(Phone p) {
		this.phoneDAO.updatePhone(p);
		
	}

	@Override
    @Transactional
	public List<Phone> listPhones() {
		return this.phoneDAO.listPhones();
	}

	@Override
    @Transactional
	public Phone getPhoneById(int id) {
		return this.phoneDAO.getPhoneById(id);
	}

	@Override
    @Transactional
	public void removePhone(int id) {
		this.phoneDAO.removePhone(id);
		
	}

	@Override
	@Transactional
	public List<Phone> search(String keyword) {
		return this.phoneDAO.search(keyword);
	}
}
