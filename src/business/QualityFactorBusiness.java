package business;

import java.util.List;

import dao.BaseDAO;
import bean.ApplyAreaFactor;
import bean.Organization;
import bean.Project;
import bean.QualityFactor;
import bean.SetAdjust;

public class QualityFactorBusiness{
	private final String[] DESCRIPTION={"�ֲ�ʽ����Ӧ���ܹ��ڸ����Ҫ��֮�䴫�����ݣ�","���ܣ�Ҫ�û���Ӧ��ʱ������ʵ�����ˮƽ��","�ɿ��ԣ������ϰ�ʱ�����Ӱ��̶ȣ�","����վ�㣨�����ܹ�֧�ֲ�ͬӲ������������������"};
	private BaseDAO<QualityFactor> dao=new BaseDAO<QualityFactor>();
	
	public void create(QualityFactor p) {
		dao.create(p);
	}
	//p only need to have an id
	public QualityFactor find(QualityFactor p) {
		return dao.find(QualityFactor.class, p.getId());
	}
	
	public void update(QualityFactor p) {
		dao.update(p);
	}
	//p only need to have an id
	public void delete(QualityFactor p) {
		dao.delete(dao.find(QualityFactor.class, p.getId()));
	}
	public List<QualityFactor> getAllOfAdmin() {
		List<QualityFactor> ls=dao.list("select c from QualityFactor c where c.type='admin'");
		if(ls==null||ls.isEmpty()){
			for(String s:DESCRIPTION){
				QualityFactor a=new QualityFactor();
				a.setDescription(s);
				a.setValue(0);
				a.setType("admin");
				dao.create(a);
			}
			ls=dao.list("select c from QualityFactor c where c.type='admin'");
		}
		return ls;
	}
	public void updateAll(List<QualityFactor> qualityFactors, String[] values) {
		for(int i=0;i<qualityFactors.size();i++){
			QualityFactor qf = qualityFactors.get(i);
			QualityFactor a=dao.find(QualityFactor.class, qf.getId());
			a.setValue(Integer.valueOf(values[i]));
			//a.setValue(qf.getValue());
			//dao.update(a);
		}		
	}
	public List<QualityFactor> getAllOfOrg(Organization organization) {
		List<QualityFactor> ls=dao.list("select c from QualityFactor c where c.organization.id="+organization.getId());
		if(ls==null||ls.isEmpty()){
			ls=getAllOfAdmin();
			for(QualityFactor a:ls){
				QualityFactor aNew=new QualityFactor();
				aNew.setDescription(a.getDescription());
				aNew.setOrganization(organization);
				aNew.setType("org");
				aNew.setValue(a.getValue());
				create(aNew);
			}
			ls=dao.list("select c from QualityFactor c where c.organization.id="+organization.getId());
		}
		return ls;
	}
	public List<QualityFactor> findBySetAdjust(SetAdjust setAdjust) {
		List<QualityFactor> ls=dao.list("select c from QualityFactor c where c.setAdjust.id="+setAdjust.getId());
		if(ls==null||ls.isEmpty()){
			SetAdjust as=new SetAdjustBusiness().find(setAdjust);
			for(String s:DESCRIPTION){
				QualityFactor a=new QualityFactor();
				a.setDescription(s);
				a.setValue(0);
				a.setSetAdjust(as);
				dao.create(a);
			}
			ls=dao.list("select c from QualityFactor c where c.setAdjust.id="+setAdjust.getId());
		}
		return ls;
	}
}
