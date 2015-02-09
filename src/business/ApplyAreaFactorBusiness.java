package business;

import java.util.List;

import bean.ApplyAreaFactor;
import bean.Organization;
import dao.BaseDAO;

public class ApplyAreaFactorBusiness {
	private final String[] DESCRIPTION = { "调整因子1", "调整因子2" };
	private BaseDAO<ApplyAreaFactor> dao = new BaseDAO<ApplyAreaFactor>();

	public void create(ApplyAreaFactor p) {
		dao.create(p);
	}

	// p only need to have an id
	public ApplyAreaFactor find(ApplyAreaFactor p) {
		return dao.find(ApplyAreaFactor.class, p.getId());
	}

	public void update(ApplyAreaFactor p) {
		dao.update(p);
	}

	// p only need to have an id
	public void delete(ApplyAreaFactor p) {
		dao.delete(dao.find(ApplyAreaFactor.class, p.getId()));
	}

	/* 系统级管理员，获取系统默认设定的调整因子 */
	public List<ApplyAreaFactor> getAllOfAdmin() {
		List<ApplyAreaFactor> ls = dao.list("select c from ApplyAreaFactor c where c.type='admin'");
		if (ls == null || ls.isEmpty()) {
			for (String s : DESCRIPTION) {
				ApplyAreaFactor a = new ApplyAreaFactor();
				a.setDescription(s);
				a.setValue(0.0);
				a.setType("admin");
				dao.create(a);
			}
			ls = dao.list("select c from ApplyAreaFactor c where c.type='admin'");
		}
		return ls;
	}

	public void updateAll(List<ApplyAreaFactor> applyAreaFactors, List<Double> values) {
		for (int i = 0; i < applyAreaFactors.size(); i++) {
			ApplyAreaFactor a = dao.find(ApplyAreaFactor.class, applyAreaFactors.get(i).getId());
			a.setValue(values.get(i));
			dao.update(a);
		}
	}

	/* 组织级管理员或一般估算人员，获取对应组织的调整因子 */
	public List<ApplyAreaFactor> getAllOfOrg(Organization organization) {
		List<ApplyAreaFactor> ls = dao.list("select c from ApplyAreaFactor c where c.organization.id=" + organization.getId());
		if (ls == null || ls.isEmpty()) { // 本组织未设定调整因子，获取系统默认值
			ls = getAllOfAdmin();
			for (ApplyAreaFactor a : ls) {
				ApplyAreaFactor aNew = new ApplyAreaFactor();
				aNew.setDescription(a.getDescription());
				aNew.setOrganization(organization);
				aNew.setType("org");
				aNew.setValue(a.getValue());
				create(aNew);
			}
			ls = dao.list("select c from ApplyAreaFactor c where c.organization.id=" + organization.getId());
		}
		return ls;
	}
}
