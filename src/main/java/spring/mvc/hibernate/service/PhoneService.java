package spring.mvc.hibernate.service;

import java.util.List;

import spring.mvc.hibernate.model.Phone;

public interface PhoneService {

	public void addPhone(Phone p);
    public void updatePhone(Phone p);
    public List<Phone> listPhones(Integer offset, Integer maxResults);
    public Phone getPhoneById(int id);
    public void removePhone(int id);
    public List<Phone> search(String keyword, Integer offset, Integer maxResults);
    public int countPhonesRecord();
}
