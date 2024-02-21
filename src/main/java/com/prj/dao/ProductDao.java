package com.prj.dao;


import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import com.prj.pojo.Product;



@Repository
public class ProductDao 
{
	public static Session getSession()
	{
		Configuration cfg = new Configuration();
		cfg.configure("hibernateConfig.xml");
		SessionFactory factory = cfg.buildSessionFactory();
		
		Session s = factory.openSession();
		return s;
	}
	
	//handles save and update both as if id comes then it'll update the record else create new one!!
	public void insertProduct (Product prd)
	{
		Session s = getSession();
		Transaction txn = s.beginTransaction();
		s.saveOrUpdate(prd);;
		txn.commit();
		s.close();
	}
	
	public List<Product> getAllProduct()
	{
		Session s = this.getSession();
		//here Product is Entity name...
		Query query = s.createQuery("from Product");
		List<Product> li = query.list();
		return li;
	}
	
	public Product getProduct (int id)
	{
		Session s=this.getSession();
		Product p = (Product) s.get(Product.class, id);
		return p;
	}
	

	public void deleteProduct (int id)
	{
		Session s = this.getSession();
		Transaction txn = s.beginTransaction();
		Product pr = (Product) s.get(Product.class, id);
		s.delete(pr);
		txn.commit();
		s.close();
	}
	
}
