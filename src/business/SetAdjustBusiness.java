package business;

import java.util.ArrayList;
import java.util.List;

import dao.BaseDAO;
import bean.AdjustParam;
import bean.AppTypeFactor;
import bean.ApplyAreaFactor;
import bean.CountSession;
import bean.DevLangFactor;
import bean.Project;
import bean.QualityFactor;
import bean.SetAdjust;
import bean.TeamExperienceFactor;

public class SetAdjustBusiness{
	
	private BaseDAO<SetAdjust> dao=new BaseDAO<SetAdjust>();
	
	public void create(SetAdjust p) {
		dao.create(p);
	}
	//p only need to have an id
	public SetAdjust find(SetAdjust p) {
		return dao.find(SetAdjust.class, p.getId());
	}
	public SetAdjust findByCountSessionId(Integer id){
		List<SetAdjust> ls=dao.list("select c from SetAdjust c where c.countSession.id="+id);
		if(ls==null||ls.isEmpty()){
			SetAdjust a=new SetAdjust();
			CountSession c=new CountSessionBusiness().findById(id);
			a.setCountSession(c);
			dao.create(a);
			ls=dao.list("select c from SetAdjust c where c.countSession.id="+id);
		}
		return ls.get(0);
	}
	
	public void update(SetAdjust p,AdjustParam ap) {
		SetAdjust sa=dao.find(SetAdjust.class, p.getId());
		List<AdjustParam> adjustParams = new ArrayList<AdjustParam>();
		adjustParams.add(ap);
		p.setAdjustParams(adjustParams);
		dao.update(p);
	}
	//p only need to have an id
	public void delete(SetAdjust p) {
		dao.delete(dao.find(SetAdjust.class, p.getId()));
	}
	/*
	 * update all parameter
	 */
	public void update(SetAdjust setAdjust, ApplyAreaFactor applyAreaFactor,
			AppTypeFactor appTypeFactor, DevLangFactor devLangFactor,
			TeamExperienceFactor teamExperienceFactor, AdjustParam adjustParam, String[] values) {
		SetAdjust sa=find(setAdjust);
		sa.setSizeAdjustFactor(setAdjust.getSizeAdjustFactor());
		sa.setDevAdjustFactor(setAdjust.getDevAdjustFactor());
		sa.setSoftwareAdjustFactor(setAdjust.getSoftwareAdjustFactor());
		sa.setApplyAreaFactor(new ApplyAreaFactorBusiness().find(applyAreaFactor));
		new AdjustParamBusiness().update(adjustParam);
		sa.setAppTypeFactor(new AppTypeFactorBusiness().find(appTypeFactor));
		sa.setDevLangFactor(new DevLangFactorBusiness().find(devLangFactor));
		sa.setTeamExperienceFactor(new TeamExperienceFactorBusiness().find(teamExperienceFactor));
		List<AdjustParam> adjustParams=new ArrayList<AdjustParam>();
		adjustParams.add(adjustParam);
		sa.setAdjustParams(adjustParams);
		QualityFactorBusiness qfb = new QualityFactorBusiness();
		//List<QualityFactor> qfs = new ArrayList<QualityFactor>();
		List<QualityFactor> qualityFactors = sa.getQualityFactors();
		QualityFactor qf,q;
		for(int i=0;i<qualityFactors.size();i++){
			/*q = qualityFactors.get(i);
			qf = qfb.find(q);*/
			qualityFactors.get(i).setValue(Integer.valueOf(values[i]));
			qfb.update(qualityFactors.get(i));
		}
		sa.setQualityFactors(qualityFactors);
		dao.update(sa);		
		
	}
	public SetAdjust getByCountSession(CountSession countSession) {
		List<SetAdjust> ls=dao.list("select c from SetAdjust c where c.countSession.id="+countSession.getId());
		if(ls!=null&&ls.size()==1){
			return ls.get(0);
		}
		return null;
	}
}
