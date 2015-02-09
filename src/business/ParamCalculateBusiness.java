package business;

import bean.AdjustParam;
import bean.CountSession;
import bean.SetAdjust;

public class ParamCalculateBusiness {
	public FactorCalculateBusiness fcb = new FactorCalculateBusiness();

	/**
	 * ���㹤����=�����Ĺ�ģ�� *������ص������� * ������������* ���ܵ��ʱ�� / (8*21.5)
	 * 
	 * @input fpcCost ���ܵ��ʱ���ֹ�ֵ������ֵ����׼ֵ
	 * @return ������
	 **/
	public Double getEffort(Double fpCost, CountSession cs) {
		return fcb.calChangedSize(cs) * fcb.calSoftwareAdjustFactor(cs) * fcb.calDevelopAdjustFactor(cs) * fpCost / (8 * 21.5);
	}

	/**
	 * ���㹤��=1.277*POWER(������,0.404) ����:�����������ֹ�ֵ������ֵ����׼ֵ
	 * */
	public Double getDuration(Double effort) {
		return 1.277 * Math.pow(effort, 0.404);
	}

	/**
	 * ����ɱ�=������*���·���*��1+ë������%�� ����:�����������ֹ�ֵ������ֵ����׼ֵ
	 * */
	public Double getBudget(Double effort, CountSession cs) {
		SetAdjust setAdjust = new SetAdjustBusiness().getByCountSession(cs);
		AdjustParam adjustParam = new AdjustParamBusiness().findBySetAdjust(setAdjust, null);
		return effort * adjustParam.getPmRate() * (1 + (adjustParam.getGrossMargin()) / 100);
	}
}
