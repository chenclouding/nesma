package business;

import java.util.List;

import bean.Project;
import dao.BaseDAO;

public class ProjectBusiness {

	private BaseDAO<Project> dao = new BaseDAO<Project>();

	public void create(Project p) {
		p.setUfpc(0.0);
		p.setEstimateStatus(0);
		dao.create(p);
	}

	// p only need to have an id
	public Project find(Project p) {
		return dao.find(Project.class, p.getId());
	}

	public void update(Project p) {
		Project project = dao.find(Project.class, p.getId());
		project.setBusinessOutlet(p.getBusinessOutlet());
		project.setBusinessUnit(p.getBusinessUnit());
		project.setCity(p.getCity());
		project.setCountry(p.getCountry());
		project.setDatabase2(p.getDatabase2());
		project.setDescription(p.getDescription());
		project.setDevLang(p.getDevLang());
		project.setDevPlatform(p.getDevPlatform());
		project.setEndDate(p.getEndDate());
		project.setIde(p.getIde());
		project.setIndustry(p.getIndustry());
		project.setMethodType(p.getMethodType());
		project.setName(p.getName());
		project.setOs(p.getOs());
		project.setProjectSLCModel(p.getProjectSLCModel());
		project.setProvince(p.getProvince());
		project.setStartDate(p.getStartDate());
		project.setType(p.getType());
		dao.update(project);
	}

	// p only need to have an id
	public void delete(Project p) {
		dao.delete(dao.find(Project.class, p.getId()));
	}

	public List<Project> getAllProject() {
		return dao.list("from Project");
	}
}
