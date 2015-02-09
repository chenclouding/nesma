package business;

import java.util.List;

import dao.BaseDAO;
import bean.AdjustParam;
import bean.ApplyAreaFactor;
import bean.Organization;
import bean.Project;
import bean.QualityFactor;
import bean.SetAdjust;

public class AdjustParamBusiness{
	private BaseDAO<AdjustParam> dao=new BaseDAO<AdjustParam>();
	
	public void create(AdjustParam p) {
		dao.create(p);
	}
	//p only need to have an id
	public AdjustParam find(AdjustParam p) {
		return dao.find(AdjustParam.class, p.getId());
	}
	
	public void update(AdjustParam a) {
		AdjustParam aNew=dao.find(AdjustParam.class, a.getId());
		aNew.setFpCostOptimistic(a.getFpCostOptimistic());
		aNew.setFpCostPessimistic(a.getFpCostPessimistic());
		aNew.setFpCostStandard(a.getFpCostStandard());
		aNew.setGrossMargin(a.getGrossMargin());
		aNew.setPmRate(a.getPmRate());
		aNew.setSizeChangedFactor(a.getSizeChangedFactor());
		dao.update(aNew);
	}
	//p only need to have an id
	public void delete(AdjustParam p) {
		dao.delete(dao.find(AdjustParam.class, p.getId()));
	}
	public AdjustParam getByAdmin() {
		List<AdjustParam> ls=dao.list("select c from AdjustParam c where c.type='admin'");
		if(ls==null||ls.isEmpty()){
			AdjustParam a=new AdjustParam();
			a.setFpCostOptimistic(0.0);
			a.setFpCostPessimistic(0.0);
			a.setFpCostStandard(0.0);
			a.setGrossMargin(0.0);
			a.setPmRate(0.0);
			a.setSizeChangedFactor(0.0);
			a.setType("admin");
			create(a);
			ls=dao.list("select c from AdjustParam c where c.type='admin'");
		}
		return ls.get(0);
	}
	public AdjustParam getByOrg(Organization organization) {
		List<AdjustParam> ls=dao.list("select c from AdjustParam c where c.organization.id="+organization.getId());
		if(ls==null||ls.isEmpty()){
			AdjustParam a=getByAdmin();
			AdjustParam aNew=new AdjustParam();
			aNew.setFpCostOptimistic(a.getFpCostOptimistic());
			aNew.setFpCostPessimistic(a.getFpCostPessimistic());
			aNew.setFpCostStandard(a.getFpCostStandard());
			aNew.setGrossMargin(a.getGrossMargin());
			aNew.setOrganization(organization);
			aNew.setPmRate(a.getPmRate());
			aNew.setSizeChangedFactor(a.getSizeChangedFactor());
			aNew.setType("org");
			create(aNew);
			ls=dao.list("select c from AdjustParam c where c.organization.id="+organization.getId());
		}
		return ls.get(0);
	}
	public AdjustParam findBySetAdjust(SetAdjust setAdjust,
			Organization organization) {
		List<AdjustParam> ls=dao.list("select c from AdjustParam c where c.setAdjust.id="+setAdjust.getId());
		if(ls==null||ls.isEmpty()){			
			SetAdjust as=new SetAdjustBusiness().find(setAdjust);
		  AdjustParam a= getByOrg(organization);
		  AdjustParam aNew=new AdjustParam();
			aNew.setFpCostOptimistic(a.getFpCostOptimistic());
			aNew.setFpCostPessimistic(a.getFpCostPessimistic());
			aNew.setFpCostStandard(a.getFpCostStandard());
			aNew.setGrossMargin(a.getGrossMargin());
			aNew.setPmRate(a.getPmRate());
			aNew.setSizeChangedFactor(a.getSizeChangedFactor());
			aNew.setSetAdjust(as);
		  dao.create(aNew);
		  ls=dao.list("select c from AdjustParam c where c.setAdjust.id="+setAdjust.getId());
		}
		return ls.get(0);
	}
}
