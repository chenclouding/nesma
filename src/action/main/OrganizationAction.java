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

	/* ������֯ */
	public String add() {
		new OrganizationBusiness().create(organization);
		user.setOrganization(organization);
		user.setRole("org");
		new UserBusiness().create(user);
		return list();
	}

	/* ��ȡҪ�޸ĵ���֯��Ϣ */
	public String edit() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if (organization == null)
			organization = (Organization) session.getAttribute("organization");
		organization = new OrganizationBusiness().find(organization);
		return SUCCESS;
	}

	/* �����޸ĺ����֯��Ϣ */
	public String edited() {
		new OrganizationBusiness().update(organization);
		message = true;
		return SUCCESS;
	}

	/* ��ȡ��֯�б� */
	public String list() {
		organizations = new OrganizationBusiness().getAllOrganization();
		if (organizations == null || organizations.isEmpty())
			message = true;
		return INPUT;
	}

	/* ɾ����֯��Ϣ */
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
