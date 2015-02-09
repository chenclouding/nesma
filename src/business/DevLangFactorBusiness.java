package business;

import java.util.List;

import dao.BaseDAO;
import bean.AppTypeFactor;
import bean.ApplyAreaFactor;
import bean.DevLangFactor;
import bean.Organization;
import bean.Project;

public class DevLangFactorBusiness{
	private final String[] DESCRIPTION={"调整因子5","调整因子6"};
	
	private BaseDAO<DevLangFactor> dao=new BaseDAO<DevLangFactor>();
	
	public void create(DevLangFactor p) {
		dao.create(p);
	}
	//p only need to have an id
	public DevLangFactor find(DevLangFactor p) {
		return dao.find(DevLangFactor.class, p.getId());
	}
	
	public void update(DevLangFactor p) {
		dao.update(p);
	}
	//p only need to have an id
	public void delete(DevLangFactor p) {
		dao.delete(dao.find(DevLangFactor.class, p.getId()));
	}
	public List<DevLangFactor> getAllOfAdmin() {
		List<DevLangFactor> ls=dao.list("select c from DevLangFactor c where c.type='admin'");
		if(ls==null||ls.isEmpty()){
			for(String s:DESCRIPTION){
				DevLangFactor a=new DevLangFactor();
				a.setDescription(s);
				a.setValue(0.0);
				a.setType("admin");
				dao.create(a);
			}
			ls=dao.list("select c from DevLangFactor c where c.type='admin'");
		}
		return ls;
	}
	public void updateAll(List<DevLangFactor> applyAreaFactors,
			List<Double> values) {
		for(int i=0;i<applyAreaFactors.size();i++){
			DevLangFactor a=dao.find(DevLangFactor.class, applyAreaFactors.get(i).getId());
			a.setValue(values.get(i));
			dao.update(a);
		}		
	}
	public List<DevLangFactor> getAllOfOrg(Organization organization) {
		List<DevLangFactor> ls=dao.list("select c from DevLangFactor c where c.organization.id="+organization.getId());
		if(ls==null||ls.isEmpty()){
			ls=getAllOfAdmin();
			for(DevLangFactor a:ls){
				DevLangFactor aNew=new DevLangFactor();
				aNew.setDescription(a.getDescription());
				aNew.setOrganization(organization);
				aNew.setType("org");
				aNew.setValue(a.getValue());
				create(aNew);
			}
			ls=dao.list("select c from DevLangFactor c where c.organization.id="+organization.getId());
		}
		return ls;
	}
}
