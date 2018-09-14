package com.music.dao.database;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

 

@Repository
public class DataBase {
	 
	 @Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sf;
 
	
	public SessionFactory getSf() {
		return sf;
	}


	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}


	public Session getSession(){
		 return sf.getCurrentSession();
	}
	
	 
	
}
