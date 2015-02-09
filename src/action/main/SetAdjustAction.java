package action.main;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import bean.AdjustParam;
import bean.AppTypeFactor;
import bean.ApplyAreaFactor;
import bean.DevLangFactor;
import bean.QualityFactor;
import bean.SetAdjust;
import bean.TeamExperienceFactor;
import bean.User;
import business.AdjustParamBusiness;
import business.AppTypeFactorBusiness;
import business.ApplyAreaFactorBusiness;
import business.DevLangFactorBusiness;
import business.QualityFactorBusiness;
import business.SetAdjustBusiness;
import business.TeamExperienceFactorBusiness;
import business.UserBusiness;

import com.opensymphony.xwork2.ActionSupport;

public class SetAdjustAction extends ActionSupport {
	private List<ApplyAreaFactor> applyAreaFactors = new ArrayList<ApplyAreaFactor>();
	private List<AppTypeFactor> appTypeFactors = new ArrayList<AppTypeFactor>();
	private List<DevLangFactor> devLangFactors = new ArrayList<DevLangFactor>();
	private List<TeamExperienceFactor> teamExperienceFactors = new ArrayList<TeamExperienceFactor>();
	private List<QualityFactor> qualityFactors = new ArrayList<QualityFactor>();
	// private List<Integer> value=new ArrayList<Integer>();
	private String[] value;
	private ApplyAreaFactor applyAreaFactor;
	private AppTypeFactor appTypeFactor;
	private DevLangFactor devLangFactor;
	private TeamExperienceFactor teamExperienceFactor;

	private AdjustParam adjustParam;
	private SetAdjust setAdjust;
	private boolean message;

	/* 获取所有调整因子的值 */
	public String list() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		User user = new User();
		user.setId(userId);
		user = new UserBusiness().find(user);
		applyAreaFactors = new ApplyAreaFactorBusiness().getAllOfOrg(user.getOrganization());
		appTypeFactors = new AppTypeFactorBusiness().getAllOfOrg(user.getOrganization());
		devLangFactors = new DevLangFactorBusiness().getAllOfOrg(user.getOrganization());
		teamExperienceFactors = new TeamExperienceFactorBusiness().getAllOfOrg(user.getOrganization());
		setAdjust = new SetAdjustBusiness().findByCountSessionId((Integer) session.getAttribute("countSessionId"));
		qualityFactors = new QualityFactorBusiness().findBySetAdjust(setAdjust);
		applyAreaFactor = setAdjust.getApplyAreaFactor();
		appTypeFactor = setAdjust.getAppTypeFactor();
		devLangFactor = setAdjust.getDevLangFactor();
		teamExperienceFactor = setAdjust.getTeamExperienceFactor();
		adjustParam = new AdjustParamBusiness().findBySetAdjust(setAdjust, user.getOrganization());
		return INPUT;
	}

	// 保存修改后的调整因子的值
	public String edited() {
		new SetAdjustBusiness().update(setAdjust, applyAreaFactor, appTypeFactor, devLangFactor, teamExperienceFactor, adjustParam, value);
		message = true;
		return list();
	}

	public List<ApplyAreaFactor> getApplyAreaFactors() {
		return applyAreaFactors;
	}

	public void setApplyAreaFactors(List<ApplyAreaFactor> applyAreaFactors) {
		this.applyAreaFactors = applyAreaFactors;
	}

	public List<AppTypeFactor> getAppTypeFactors() {
		return appTypeFactors;
	}

	public void setAppTypeFactors(List<AppTypeFactor> appTypeFactors) {
		this.appTypeFactors = appTypeFactors;
	}

	public List<DevLangFactor> getDevLangFactors() {
		return devLangFactors;
	}

	public void setDevLangFactors(List<DevLangFactor> devLangFactors) {
		this.devLangFactors = devLangFactors;
	}

	public List<TeamExperienceFactor> getTeamExperienceFactors() {
		return teamExperienceFactors;
	}

	public void setTeamExperienceFactors(List<TeamExperienceFactor> teamExperienceFactors) {
		this.teamExperienceFactors = teamExperienceFactors;
	}

	public List<QualityFactor> getQualityFactors() {
		return qualityFactors;
	}

	public void setQualityFactors(List<QualityFactor> qualityFactors) {
		this.qualityFactors = qualityFactors;
	}

	public ApplyAreaFactor getApplyAreaFactor() {
		return applyAreaFactor;
	}

	public void setApplyAreaFactor(ApplyAreaFactor applyAreaFactor) {
		this.applyAreaFactor = applyAreaFactor;
	}

	public AppTypeFactor getAppTypeFactor() {
		return appTypeFactor;
	}

	public void setAppTypeFactor(AppTypeFactor appTypeFactor) {
		this.appTypeFactor = appTypeFactor;
	}

	public DevLangFactor getDevLangFactor() {
		return devLangFactor;
	}

	public void setDevLangFactor(DevLangFactor devLangFactor) {
		this.devLangFactor = devLangFactor;
	}

	public TeamExperienceFactor getTeamExperienceFactor() {
		return teamExperienceFactor;
	}

	public void setTeamExperienceFactor(TeamExperienceFactor teamExperienceFactor) {
		this.teamExperienceFactor = teamExperienceFactor;
	}

	public AdjustParam getAdjustParam() {
		return adjustParam;
	}

	public void setAdjustParam(AdjustParam adjustParam) {
		this.adjustParam = adjustParam;
	}

	public SetAdjust getSetAdjust() {
		return setAdjust;
	}

	public void setSetAdjust(SetAdjust setAdjust) {
		this.setAdjust = setAdjust;
	}

	public boolean isMessage() {
		return message;
	}

	public void setMessage(boolean message) {
		this.message = message;
	}

	/*
	 * public List<Integer> getValue() { return value; } public void
	 * setValue(List<Integer> value) { this.value = value; }
	 */
	public String[] getValue() {
		return value;
	}

	public void setValue(String[] value) {
		this.value = value;
	}
}
