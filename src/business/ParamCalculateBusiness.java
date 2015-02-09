package business;

import bean.AdjustParam;
import bean.CountSession;
import bean.SetAdjust;

public class ParamCalculateBusiness {
	public FactorCalculateBusiness fcb = new FactorCalculateBusiness();

	/**
	 * 估算工作量=变更后的规模数 *软件因素调整因子 * 开发调整因子* 功能点耗时率 / (8*21.5)
	 * 
	 * @input fpcCost 功能点耗时率乐观值、悲观值、标准值
	 * @return 工作量
	 **/
	public Double getEffort(Double fpCost, CountSession cs) {
		return fcb.calChangedSize(cs) * fcb.calSoftwareAdjustFactor(cs) * fcb.calDevelopAdjustFactor(cs) * fpCost / (8 * 21.5);
	}

	/**
	 * 估算工期=1.277*POWER(工作量,0.404) 输入:工作量估算乐观值、悲观值、标准值
	 * */
	public Double getDuration(Double effort) {
		return 1.277 * Math.pow(effort, 0.404);
	}

	/**
	 * 估算成本=工作量*人月费率*（1+毛利润率%） 输入:工作量估算乐观值、悲观值、标准值
	 * */
	public Double getBudget(Double effort, CountSession cs) {
		SetAdjust setAdjust = new SetAdjustBusiness().getByCountSession(cs);
		AdjustParam adjustParam = new AdjustParamBusiness().findBySetAdjust(setAdjust, null);
		return effort * adjustParam.getPmRate() * (1 + (adjustParam.getGrossMargin()) / 100);
	}
}
