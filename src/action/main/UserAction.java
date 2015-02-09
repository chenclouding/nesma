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

public class UserAction extends ActionSupport {
	private List<User> users = new ArrayList<User>();
	private User user;
	private Organization organization;
	private boolean message;
	private String oldPassword;
	private String userPassword;

	/*
	 * 检查用户名密码是否存在，之后根据用户的类型，决定跳转的页面（admin,org,user）
	 */
	public String login() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if (user != null) {
			if (user.getName().equals("admin") && user.getPassword().equals("admin")) {// 系统级管理员用户名admin，密码admin
				session.setAttribute("userName", "admin");
				session.setAttribute("userId", 0);
				session.setAttribute("userRole", "admin");
				return SUCCESS;
			}
		}
		user = new UserBusiness().findUserByNamePassword(user.getName(), user.getPassword());
		if (user == null) {
			addActionError("用户名或密码错误，请重试！");
			return INPUT;
		} else {
			session.setAttribute("userName", user.getName());
			session.setAttribute("userRole", user.getRole());
			session.setAttribute("userId", user.getId());
			session.setAttribute("organization", user.getOrganization());
			return SUCCESS;
		}
	}

	/* 新增用户 */
	public String add() {
		user.setRole("user");
		user.setOrganization(new OrganizationBusiness().find(organization));
		new UserBusiness().create(user);
		return list();
	}

	/* 获取要修改的用户信息 */
	public String edit() {
		user = new UserBusiness().find(user);
		return "edit";
	}

	/* 保存修改后的用户信息 */
	public String edited() {
		new UserBusiness().update(user);
		message = true;
		return "edit";
	}

	/* 获取组织内用户 */
	public String list() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		user = new User();
		user.setId(userId);
		user = new UserBusiness().find(user);
		organization = user.getOrganization();
		users = new UserBusiness().getUsersByOrganization(organization);
		if (users == null || users.isEmpty())
			message = true;
		return "list";
	}

	/* 删除用户信息 */
	public String del() {
		new UserBusiness().delete(user);
		return list();
	}

	/* 重设用户密码 */
	public String reset() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		int userId = Integer.valueOf(session.getAttribute("userId").toString());
		UserBusiness ub = new UserBusiness();
		User olduser = ub.find(ub.getUserById(userId));
		if (oldPassword != null && olduser != null && oldPassword.equals(olduser.getPassword())) {
			olduser.setPassword(userPassword);
			ub.update(olduser);
			addActionError("密码已修改！");
			return "reset";
		} else
			return "list";

	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
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

	public Organization getOrganization() {
		return organization;
	}

	public void setOrganization(Organization organization) {
		this.organization = organization;
	}

	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

}
