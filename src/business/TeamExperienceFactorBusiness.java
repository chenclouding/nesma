package business;

import java.util.List;

import dao.BaseDAO;
import bean.ApplyAreaFactor;
import bean.DevLangFactor;
import bean.Organization;
import bean.Project;
import bean.TeamExperienceFactor;

public class TeamExperienceFactorBusiness{
	private final String[] DESCRIPTION={"调整因子7","调整因子8"};
	
	private BaseDAO<TeamExperienceFactor> dao=new BaseDAO<TeamExperienceFactor>();
	
	public void create(TeamExperienceFactor p) {
		dao.create(p);
	}
	//p only need to have an id
	public TeamExperienceFactor find(TeamExperienceFactor p) {
		return dao.find(TeamExperienceFactor.class, p.getId());
	}
	
	public void update(TeamExperienceFactor p) {
		dao.update(p);
	}
	//p only need to have an id
	public void delete(TeamExperienceFactor p) {
		dao.delete(dao.find(TeamExperienceFactor.class, p.getId()));
	}
	public List<TeamExperienceFactor> getAllOfAdmin() {
		List<TeamExperienceFactor> ls=dao.list("select c from TeamExperienceFactor c where c.type='admin'");
		if(ls==null||ls.isEmpty()){
			for(String s:DESCRIPTION){
				TeamExperienceFactor a=new TeamExperienceFactor();
				a.setDescription(s);
				a.setValue(0.0);
				a.setType("admin");
				dao.create(a);
			}
			ls=dao.list("select c from TeamExperienceFactor c where c.type='admin'");
		}
		return ls;
	}
	public void updateAll(List<TeamExperienceFactor> applyAreaFactors,
			List<Double> values) {
		for(int i=0;i<applyAreaFactors.size();i++){
			TeamExperienceFactor a=dao.find(TeamExperienceFactor.class, applyAreaFactors.get(i).getId());
			a.setValue(values.get(i));
			dao.update(a);
		}		
	}
	public List<TeamExperienceFactor> getAllOfOrg(Organization organization) {
		List<TeamExperienceFactor> ls=dao.list("select c from TeamExperienceFactor c where c.organization.id="+organization.getId());
		if(ls==null||ls.isEmpty()){
			ls=getAllOfAdmin();
			for(TeamExperienceFactor a:ls){
				TeamExperienceFactor aNew=new TeamExperienceFactor();
				aNew.setDescription(a.getDescription());
				aNew.setOrganization(organization);
				aNew.setType("org");
				aNew.setValue(a.getValue());
				create(aNew);
			}
			ls=dao.list("select c from TeamExperienceFactor c where c.organization.id="+organization.getId());
		}
		return ls;
	}
}
