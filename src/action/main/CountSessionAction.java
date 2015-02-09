package action.main;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import bean.CountSession;
import bean.Project;
import business.CountSessionBusiness;
import business.ProjectBusiness;

import com.opensymphony.xwork2.ActionSupport;

public class CountSessionAction extends ActionSupport {
	private List<CountSession> countSessions = new ArrayList<CountSession>();
	private CountSession countSession;
	private Project project;
	private boolean message;
	private int recentCsId;

	/* 新增估算场景 */
	public String add() {
		countSession.setProject(new ProjectBusiness().find(project));
		new CountSessionBusiness().create(countSession);
		return list();
	}

	/* 获取要修改的估算场景 */
	public String edit() {
		countSession = new CountSessionBusiness().find(countSession);
		return SUCCESS;
	}

	/* 保存修改后的估算场景 */
	public String edited() {
		new CountSessionBusiness().update(countSession);
		message = true;
		return SUCCESS;
	}

	/* 获取所有估算场景 */
	public String list() {
		countSessions = new CountSessionBusiness().listByProject(project);
		if (countSessions == null || countSessions.isEmpty())
			message = true;
		return INPUT;
	}

	/* 删除估算场景 */
	public String del() {
		new CountSessionBusiness().delete(countSession);
		return list();
	}

	/* 选择对应的估算场景开始估算 */
	public String select() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("countSessionId", countSession.getId());
		countSession = new CountSessionBusiness().find(countSession);
		if (countSession.getMethodType().equals("估计型功能点计数"))
			return "medium";
		else if (countSession.getMethodType().equals("详细型功能点计数"))
			return "hard";
		else
			return "easy";
	}

	public List<CountSession> getCountSessions() {
		return countSessions;
	}

	public void setCountSessions(List<CountSession> countSessions) {
		this.countSessions = countSessions;
	}

	public CountSession getCountSession() {
		return countSession;
	}

	public void setCountSession(CountSession countSession) {
		this.countSession = countSession;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public boolean isMessage() {
		return message;
	}

	public void setMessage(boolean message) {
		this.message = message;
	}

	public int getRecentCsId() {
		return recentCsId;
	}

	public void setRecentCsId(int recentCsId) {
		this.recentCsId = recentCsId;
	}

}
