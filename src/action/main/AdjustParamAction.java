package action.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import bean.AdjustParam;
import bean.User;
import business.AdjustParamBusiness;
import business.UserBusiness;

import com.opensymphony.xwork2.ActionSupport;

public class AdjustParamAction extends ActionSupport {
	private AdjustParam adjustParam;
	private User user;
	private boolean message;

	/* 获取行业参数 */
	public String list() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		user = new User();
		user.setId(userId);
		if (user.getId() != 0) {
			user = new UserBusiness().find(user);
			adjustParam = new AdjustParamBusiness().getByOrg(user.getOrganization());
		} else {
			adjustParam = new AdjustParamBusiness().getByAdmin();
		}
		return INPUT;
	}

	/* 保存修改后的行业参数 */
	public String edited() {
		new AdjustParamBusiness().update(adjustParam);
		message = true;
		return list();
	}

	public AdjustParam getAdjustParam() {
		return adjustParam;
	}

	public void setAdjustParam(AdjustParam adjustParam) {
		this.adjustParam = adjustParam;
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
