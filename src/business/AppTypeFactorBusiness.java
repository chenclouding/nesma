package business;

import java.util.List;

import dao.BaseDAO;
import bean.AppTypeFactor;
import bean.ApplyAreaFactor;
import bean.Organization;
import bean.Project;

public class AppTypeFactorBusiness{
	private final String[] DESCRIPTION={"调整因子3","调整因子4"};
	
	private BaseDAO<AppTypeFactor> dao=new BaseDAO<AppTypeFactor>();
	
	public void create(AppTypeFactor p) {
		dao.create(p);
	}
	//p only need to have an id
	public AppTypeFactor find(AppTypeFactor p) {
		return dao.find(AppTypeFactor.class, p.getId());
	}
	
	public void update(AppTypeFactor p) {
		dao.update(p);
	}
	//p only need to have an id
	public void delete(AppTypeFactor p) {
		dao.delete(dao.find(AppTypeFactor.class, p.getId()));
	}
	public List<AppTypeFactor> getAllOfAdmin() {
		List<AppTypeFactor> ls=dao.list("select c from AppTypeFactor c where c.type='admin'");
		if(ls==null||ls.isEmpty()){
			for(String s:DESCRIPTION){
				AppTypeFactor a=new AppTypeFactor();
				a.setDescription(s);
				a.setValue(0.0);
				a.setType("admin");
				dao.create(a);
			}
			ls=dao.list("select c from AppTypeFactor c where c.type='admin'");
		}
		return ls;
	}
	public void updateAll(List<AppTypeFactor> applyAreaFactors,
			List<Double> values) {
		for(int i=0;i<applyAreaFactors.size();i++){
			AppTypeFactor a=dao.find(AppTypeFactor.class, applyAreaFactors.get(i).getId());
			a.setValue(values.get(i));
			dao.update(a);
		}		
	}
	public List<AppTypeFactor> getAllOfOrg(Organization organization) {
		List<AppTypeFactor> ls=dao.list("select c from AppTypeFactor c where c.organization.id="+organization.getId());
		if(ls==null||ls.isEmpty()){
			ls=getAllOfAdmin();
			for(AppTypeFactor a:ls){
				AppTypeFactor aNew=new AppTypeFactor();
				aNew.setDescription(a.getDescription());
				aNew.setOrganization(organization);
				aNew.setType("org");
				aNew.setValue(a.getValue());
				create(aNew);
			}
			ls=dao.list("select c from AppTypeFactor c where c.organization.id="+organization.getId());
		}
		return ls;
	}
}
