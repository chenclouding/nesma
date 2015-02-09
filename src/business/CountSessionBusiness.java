package business;

import java.util.List;

import bean.CountSession;
import bean.Project;
import dao.BaseDAO;

public class CountSessionBusiness {

	private BaseDAO<CountSession> dao = new BaseDAO<CountSession>();

	public void create(CountSession p) {
		dao.create(p);
	}

	// p only need to have an id
	public CountSession find(CountSession p) {
		return dao.find(CountSession.class, p.getId());
	}

	public void update(CountSession p) {
		CountSession c = dao.find(CountSession.class, p.getId());
		c.setName(p.getName());
		c.setStartTime(p.getStartTime());
		c.setLifecyclePhase(p.getLifecyclePhase());
		c.setMethodType(p.getMethodType());
		c.setDescription(p.getDescription());
		c.setEstimateStatus(p.getEstimateStatus());
		c.setFitfpc(p.getFitfpc());
		c.setFpc(p.getFpc());
		c.setUfpc(p.getUfpc());
		dao.update(c);
	}

	// p only need to have an id
	public void delete(CountSession p) {
		dao.delete(dao.find(CountSession.class, p.getId()));
	}

	public List<CountSession> listByProject(Project project) {
		return dao.list("select c from CountSession c where c.project.id=" + project.getId());
	}

	public CountSession findById(Integer countSessionId) {
		return dao.find(CountSession.class, countSessionId);
	}

	// the most recent countsession that user has created.
	public CountSession getRecentCs(Project project) {
		List<CountSession> csList = listByProject(project);
		int i = 1;
		CountSession cs = null;
		CountSession recentCs = csList.get(0);
		while (csList != null && csList.size() > 0 && i < csList.size()) {
			cs = csList.get(i);
			if (cs.getId() > recentCs.getId())
				recentCs = cs;
			i++;
		}
		return recentCs;
	}

}
