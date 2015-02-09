package action.main;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import bean.Organization;
import bean.User;
import business.OrganizationBusiness;
import business.UserBusiness;

import com.opensymphony.xwork2.ActionSupport;

public class OrganizationAction extends ActionSupport {
	private List<Organization> organizations = new ArrayList<Organization>();
	private Organization organization;
	private User user;
	private boolean message;

	/* 新增组织 */
	public String add() {
		new OrganizationBusiness().create(organization);
		user.setOrganization(organization);
		user.setRole("org");
		new UserBusiness().create(user);
		return list();
	}

	/* 获取要修改的组织信息 */
	public String edit() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if (organization == null)
			organization = (Organization) session.getAttribute("organization");
		organization = new OrganizationBusiness().find(organization);
		return SUCCESS;
	}

	/* 保存修改后的组织信息 */
	public String edited() {
		new OrganizationBusiness().update(organization);
		message = true;
		return SUCCESS;
	}

	/* 获取组织列表 */
	public String list() {
		organizations = new OrganizationBusiness().getAllOrganization();
		if (organizations == null || organizations.isEmpty())
			message = true;
		return INPUT;
	}

	/* 删除组织信息 */
	public String del() {
		new OrganizationBusiness().delete(organization);
		return list();
	}

	public List<Organization> getOrganizations() {
		return organizations;
	}

	public void setOrganizations(List<Organization> organizations) {
		this.organizations = organizations;
	}

	public Organization getOrganization() {
		return organization;
	}

	public void setOrganization(Organization organization) {
		this.organization = organization;
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
