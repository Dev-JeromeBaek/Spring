package spring.mvc.spring15.bean;

import java.util.List;

public class J08_PeopleList {
	
//	return하려는 listc을 멤버로 가지는 list가 필요함!
	private List<J08_People> listc;

	public J08_PeopleList() {
	}

	public J08_PeopleList(List<J08_People> listc) {
		this.listc = listc;
	}

	public List<J08_People> getListc() {
		return listc;
	}

	public void setListc(List<J08_People> listc) {
		this.listc = listc;
	}
	
	
	
}// class END
