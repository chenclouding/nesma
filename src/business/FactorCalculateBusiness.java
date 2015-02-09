package business;

import java.util.List;

import bean.AdjustParam;
import bean.AppTypeFactor;
import bean.ApplyAreaFactor;
import bean.CountSession;
import bean.DevLangFactor;
import bean.QualityFactor;
import bean.SetAdjust;
import bean.TeamExperienceFactor;

public class FactorCalculateBusiness {

	// ��������Ǻ϶ȵĹ�ģ��������= (269.6446+�����Ĺ�ģ*0.7094)/ �����Ĺ�ģ
	public Double calFitSizeAdjustFactor(CountSession countSession) {
		SetAdjust setAdjust = new SetAdjustBusiness().getByCountSession(countSession);
		AdjustParam adjustParam = new AdjustParamBusiness().findBySetAdjust(setAdjust, null);
		Double fitfpc = countSession.getFitfpc();
		Double changedSize = fitfpc * adjustParam.getSizeChangedFactor();
		return (269.6446 + changedSize * 0.7094) / changedSize;
	}

	// ��������Ĺ�ģ�� =�������ܵ���� * ��ģ�������
	public Double calChangedSize(CountSession countSession) {
		SetAdjust setAdjust = new SetAdjustBusiness().getByCountSession(countSession);
		AdjustParam adjustParam = new AdjustParamBusiness().findBySetAdjust(setAdjust, null);
		Double fitfpc = countSession.getFitfpc();
		return fitfpc * adjustParam.getSizeChangedFactor();
	}

	// �����ģ��������= (269.6446+δ���Ǻ϶ȵı����Ĺ�ģ*0.7094)/ δ���Ǻ϶ȱ����Ĺ�ģ
	public Double calSizeAdjustFactor(CountSession countSession) {
		SetAdjust setAdjust = new SetAdjustBusiness().getByCountSession(countSession);
		AdjustParam adjustParam = new AdjustParamBusiness().findBySetAdjust(setAdjust, null);
		Double ufpc = countSession.getUfpc();
		Double changedSize = ufpc * adjustParam.getSizeChangedFactor();
		return (269.6446 + changedSize * 0.7094) / changedSize;
	}

	// ����������������
	public Double calQualityFactor(List<QualityFactor> qualityFactors) {
		Double qfValue = 0.0;
		for (int i = 0; i < qualityFactors.size(); i++) {
			qfValue += qualityFactors.get(i).getValue();
		}
		return qfValue * 0.025 + 1;

	}

	// ����������ص�������= ��ģ�������� * Ӧ������������� * ҵ������������� * ����Ҫ���������
	public Double calSoftwareAdjustFactor(CountSession countSession) {
		SetAdjust setAdjust = new SetAdjustBusiness().getByCountSession(countSession);
		AdjustParam adjustParam = new AdjustParamBusiness().findBySetAdjust(setAdjust, null);
		ApplyAreaFactor applyAreaFactor = setAdjust.getApplyAreaFactor();
		AppTypeFactor appTypeFactor = setAdjust.getAppTypeFactor();

		List<QualityFactor> qualityFactors = setAdjust.getQualityFactors();

		QualityFactor qualityFactor = new QualityFactor();// �����������ӵļ���
		qualityFactor.setValue(1);
		return calFitSizeAdjustFactor(countSession) * applyAreaFactor.getValue() * appTypeFactor.getValue() * qualityFactor.getValue();
	}

	// ���㿪�����ص������� = �������Ե������� * �ŶӾ����������
	public Double calDevelopAdjustFactor(CountSession countSession) {
		SetAdjust setAdjust = new SetAdjustBusiness().getByCountSession(countSession);
		DevLangFactor devLangFactor = setAdjust.getDevLangFactor();
		TeamExperienceFactor teamExperienceFactor = setAdjust.getTeamExperienceFactor();
		return devLangFactor.getValue() * teamExperienceFactor.getValue();
	}

	/*
	 * public static void main(String args[]) { FactorCalculateBusiness fcb =
	 * new FactorCalculateBusiness(3);
	 * System.out.println(fcb.calDevelopAdjustFactor()); }
	 */
}
