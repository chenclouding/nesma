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

	// 计算加入吻合度的规模调整因子= (269.6446+变更后的规模*0.7094)/ 变更后的规模
	public Double calFitSizeAdjustFactor(CountSession countSession) {
		SetAdjust setAdjust = new SetAdjustBusiness().getByCountSession(countSession);
		AdjustParam adjustParam = new AdjustParamBusiness().findBySetAdjust(setAdjust, null);
		Double fitfpc = countSession.getFitfpc();
		Double changedSize = fitfpc * adjustParam.getSizeChangedFactor();
		return (269.6446 + changedSize * 0.7094) / changedSize;
	}

	// 计算变更后的规模数 =调整后功能点个数 * 规模变更因子
	public Double calChangedSize(CountSession countSession) {
		SetAdjust setAdjust = new SetAdjustBusiness().getByCountSession(countSession);
		AdjustParam adjustParam = new AdjustParamBusiness().findBySetAdjust(setAdjust, null);
		Double fitfpc = countSession.getFitfpc();
		return fitfpc * adjustParam.getSizeChangedFactor();
	}

	// 计算规模调整因子= (269.6446+未加吻合度的变更后的规模*0.7094)/ 未加吻合度变更后的规模
	public Double calSizeAdjustFactor(CountSession countSession) {
		SetAdjust setAdjust = new SetAdjustBusiness().getByCountSession(countSession);
		AdjustParam adjustParam = new AdjustParamBusiness().findBySetAdjust(setAdjust, null);
		Double ufpc = countSession.getUfpc();
		Double changedSize = ufpc * adjustParam.getSizeChangedFactor();
		return (269.6446 + changedSize * 0.7094) / changedSize;
	}

	// 计算质量调整因子
	public Double calQualityFactor(List<QualityFactor> qualityFactors) {
		Double qfValue = 0.0;
		for (int i = 0; i < qualityFactors.size(); i++) {
			qfValue += qualityFactors.get(i).getValue();
		}
		return qfValue * 0.025 + 1;

	}

	// 计算软件因素调整因子= 规模调整因子 * 应用领域调整因子 * 业务领域调整因子 * 质量要求调整因子
	public Double calSoftwareAdjustFactor(CountSession countSession) {
		SetAdjust setAdjust = new SetAdjustBusiness().getByCountSession(countSession);
		AdjustParam adjustParam = new AdjustParamBusiness().findBySetAdjust(setAdjust, null);
		ApplyAreaFactor applyAreaFactor = setAdjust.getApplyAreaFactor();
		AppTypeFactor appTypeFactor = setAdjust.getAppTypeFactor();

		List<QualityFactor> qualityFactors = setAdjust.getQualityFactors();

		QualityFactor qualityFactor = new QualityFactor();// 质量调整因子的计算
		qualityFactor.setValue(1);
		return calFitSizeAdjustFactor(countSession) * applyAreaFactor.getValue() * appTypeFactor.getValue() * qualityFactor.getValue();
	}

	// 计算开发因素调整因子 = 开发语言调整因子 * 团队经验调整因子
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
