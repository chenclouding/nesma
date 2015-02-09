package action.main;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import bean.AppTypeFactor;
import bean.ApplyAreaFactor;
import bean.DevLangFactor;
import bean.TeamExperienceFactor;
import bean.User;
import business.AppTypeFactorBusiness;
import business.ApplyAreaFactorBusiness;
import business.DevLangFactorBusiness;
import business.TeamExperienceFactorBusiness;
import business.UserBusiness;

import com.opensymphony.xwork2.ActionSupport;

public class AdjustFactorAction extends ActionSupport {
	private List<ApplyAreaFactor> applyAreaFactors = new ArrayList<ApplyAreaFactor>();
	private List<Double> values1 = new ArrayList<Double>();
	private List<AppTypeFactor> appTypeFactors = new ArrayList<AppTypeFactor>();
	private List<Double> values2 = new ArrayList<Double>();
	private List<DevLangFactor> devLangFactors = new ArrayList<DevLangFactor>();
	private List<Double> values3 = new ArrayList<Double>();
	private List<TeamExperienceFactor> teamExperienceFactors = new ArrayList<TeamExperienceFactor>();
	private List<Double> values4 = new ArrayList<Double>();
	private User user;
	private boolean message;

	/* 获取调整因子列表 */
	public String list() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		user = new User();
		user.setId(userId);
		if (user.getId() != 0) { // 组织级管理员或一般估算人员，获取对应组织的调整因子
			user = new UserBusiness().find(user);
			applyAreaFactors = new ApplyAreaFactorBusiness().getAllOfOrg(user.getOrganization());
			appTypeFactors = new AppTypeFactorBusiness().getAllOfOrg(user.getOrganization());
			devLangFactors = new DevLangFactorBusiness().getAllOfOrg(user.getOrganization());
			teamExperienceFactors = new TeamExperienceFactorBusiness().getAllOfOrg(user.getOrganization());
		} else { // 系统级管理员，获取系统默认设定的调整因子
			applyAreaFactors = new ApplyAreaFactorBusiness().getAllOfAdmin();
			appTypeFactors = new AppTypeFactorBusiness().getAllOfAdmin();
			devLangFactors = new DevLangFactorBusiness().getAllOfAdmin();
			teamExperienceFactors = new TeamExperienceFactorBusiness().getAllOfAdmin();
		}
		return INPUT;
	}

	/* 更新调整因子 */
	public String edited() {
		new ApplyAreaFactorBusiness().updateAll(applyAreaFactors, values1);
		new AppTypeFactorBusiness().updateAll(appTypeFactors, values2);
		new DevLangFactorBusiness().updateAll(devLangFactors, values3);
		new TeamExperienceFactorBusiness().updateAll(teamExperienceFactors, values4);
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

	public List<Double> getValues1() {
		return values1;
	}

	public void setValues1(List<Double> values1) {
		this.values1 = values1;
	}

	public List<Double> getValues2() {
		return values2;
	}

	public void setValues2(List<Double> values2) {
		this.values2 = values2;
	}

	public List<Double> getValues3() {
		return values3;
	}

	public void setValues3(List<Double> values3) {
		this.values3 = values3;
	}

	public List<Double> getValues4() {
		return values4;
	}

	public void setValues4(List<Double> values4) {
		this.values4 = values4;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public boolean isMessage() {
		return message;
	}

	public void setMessage(boolean message) {
		this.message = message;
	}

}
