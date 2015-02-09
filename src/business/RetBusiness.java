package business;

import java.util.List;

import dao.BaseDAO;
import bean.CountSession;
import bean.DataFunction;
import bean.FunctionModule;
import bean.Project;
import bean.Ret;
import bean.TransFunction;

public class RetBusiness{
	
	private BaseDAO<Ret> dao=new BaseDAO<Ret>();
	
	public void create(Ret p) {		
		dao.create(p);
		DataFunctionBusiness dfb = new DataFunctionBusiness();
		DataFunction df = p.getDataFunction();
		dfb.calUfpc(df);
		dfb.update(df);
	}
	//p only need to have an id
	public Ret find(Ret p) {
		return dao.find(Ret.class, p.getId());
	}
	/*
	 * whenever change jsp page, this method should be changed
	 */
	public void update(Ret b) {
		Ret d=dao.find(Ret.class, b.getId());
		d.setName(b.getName());
		d.setDet(b.getDet());
		d.setDescription(b.getDescription());
		dao.update(d);
	}
	//p only need to have an id
	public void delete(Ret p) {
		dao.delete(dao.find(Ret.class, p.getId()));
	}
}
