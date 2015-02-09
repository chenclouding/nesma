package business;

import java.util.List;

import dao.BaseDAO;
import bean.CountSession;
import bean.DataFunction;
import bean.FunctionModule;
import bean.Project;
import bean.Ret;
import bean.TransFunction;

public class TransFunctionBusiness{
	
	private BaseDAO<TransFunction> dao=new BaseDAO<TransFunction>();
	
	public void create(TransFunction p) {
		p.setUfpc(calUfpc(p));
		dao.create(p);
	}
	private Double calUfpc(TransFunction p) {
		double ufpc=0;
//		if(p.getIsCounted().equals("计入")){
//			ufpc=1;
//		}
//		if(p.getIsCounted().equals("未定")){
//			ufpc=0.5;
//		}
//		if(p.getIsCounted().equals("不计入")){
//			ufpc=0;
//		}
		ufpc=1;

		if(p.getCountSession()!=null&&p.getCountSession().getMethodType()!=null){
			if(p.getCountSession().getMethodType().equals("估计型功能点计数")){
				if(p.getType().equals("EI")){
					ufpc*=4;
				}
				if(p.getType().equals("EO")){
					ufpc*=5;
				}
				if(p.getType().equals("EQ")){
					ufpc*=4;
				}
			}
			if(p.getCountSession().getMethodType().equals("详细型功能点计数")){
				double num_ret=0;
				double num_det=0;
				num_ret=p.getFtr();
				num_det=p.getDet();
				String type="";
				if(num_ret==1&&num_det<=50&&num_det>=1){
					type="L";
				}
				if(num_ret>=2&&num_ret<=5&&num_det>=1&&num_det<=19){
					type="L";
				}
				if(num_ret>=2&&num_ret<=5&&num_det>=20&&num_det<=50){
					type="A";
				}
				if(num_ret>=2&&num_ret<=5&&num_det>=51){
					type="H";
				}
				if(num_ret>=6&&num_det>=1&&num_det<=19){
					type="A";
				}
				if(num_ret>=6&&num_det>=20){
					type="H";
				}
				if(type.equals("L")){
					if(p.getType().equals("EI"))
						ufpc*=3;
					else if(p.getType().equals("EO"))
						ufpc*=4;
					else if(p.getType().equals("EQ"))
						ufpc*=3;
				}
				if(type.equals("A")){
					if(p.getType().equals("EI"))
						ufpc*=4;
					else if(p.getType().equals("EO"))
						ufpc*=5;
					else if(p.getType().equals("EQ"))
						ufpc*=4;
				}
				if(type.equals("H")){
					if(p.getType().equals("EI"))
						ufpc*=6;
					else if(p.getType().equals("EO"))
						ufpc*=7;
					else if(p.getType().equals("EQ"))
						ufpc*=6;
				}
			}
		}
		return ufpc;
	}
	//p only need to have an id
	public TransFunction find(TransFunction p) {
		return dao.find(TransFunction.class, p.getId());
	}
	/*
	 * whenever change jsp page, this method should be changed
	 */
	public void update(TransFunction b) {
		TransFunction d=dao.find(TransFunction.class, b.getId());
		d.setType(b.getType());
		d.setName(b.getName());
		d.setDescription(b.getDescription());
		d.setDet(b.getDet());
		d.setFtr(b.getFtr());
		dao.update(d);
		d.setUfpc(calUfpc(d));
		dao.update(d);
	}
	//p only need to have an id
	public void delete(TransFunction p) {
		dao.delete(dao.find(TransFunction.class, p.getId()));
	}
	
	public List<TransFunction> getAllByCountSession(CountSession countSession) {
		return dao.list("select c from TransFunction c where c.countSession.id="+countSession.getId());
	}
	/*
	 * 选择数据功能，满足他们属于同一个估算场景,同一个模块
	 */
	public List<TransFunction> listAllByCountSessionFunctionModule(
			CountSession countSession, FunctionModule functionModule) {
		return dao.list("select c from TransFunction c where c.countSession.id="+countSession.getId()+" and c.functionModule.id="+functionModule.getId());
	}
	public double getUfpc(CountSession countSession, FunctionModule fm) {
		double ufpc=0;
		for(TransFunction df:getTransFunctionByCountSessionFunctionModule(countSession,fm)){
			ufpc+=df.getUfpc();
		}
		return ufpc;
	}
	public List<TransFunction> getTransFunctionByCountSessionFunctionModule(
			CountSession countSession, FunctionModule fm) {
		return dao.list("select c from TransFunction c where c.countSession.id="+countSession.getId()+" and c.functionModule.id="+fm.getId());
	}


}
