package action.main;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import bean.CountSession;
import bean.DataFunction;
import bean.FunctionModule;
import bean.Project;
import bean.TransFunction;
import bean.User;
import business.CountSessionBusiness;
import business.FunctionModuleBusiness;
import business.ProjectBusiness;
import business.UserBusiness;

import com.opensymphony.xwork2.ActionSupport;

public class ProjectAction extends ActionSupport {
	private List<Project> projects = new ArrayList<Project>();
	private Project project;
	private User user;
	private boolean message;
	private CountSession countSession;
	// viewResultSummay.jsp. List all the datafunctions of a countsession
	private List<DataFunction> dataFunctions = new ArrayList<DataFunction>();
	private List<TransFunction> transFunctions = new ArrayList<TransFunction>();

	/* ������Ŀ */
	public String add() {
		project.setOrganization(getUser().getOrganization());
		ProjectBusiness pb = new ProjectBusiness();
		pb.create(project);
		// ����Ĭ�ϵ�ģ��
		FunctionModule fm = new FunctionModule();
		fm.setName(project.getName());
		fm.setProject(project);
		fm.setUfpc(0.0);
		fm.setType("ԭ��ģ��");
		FunctionModuleBusiness fmb = new FunctionModuleBusiness();
		fmb.create(fm);

		// Ԥ���������㳡��
		CountSession countSession1 = new CountSession();
		CountSession countSession2 = new CountSession();
		CountSession countSession3 = new CountSession();
		// Ԥ�ù��㳡������Ҫ�޸�
		countSession1.setName("Ԥ�㹦�ܵ����");
		countSession2.setName("�б깦�ܵ����");
		countSession3.setName("Ͷ�깦�ܵ����");

		countSession1.setProject(pb.find(project));
		countSession2.setProject(pb.find(project));
		countSession3.setProject(pb.find(project));

		countSession1.setUfpc(0.0);
		countSession2.setUfpc(0.0);
		countSession3.setUfpc(0.0);

		countSession1.setMethodType("Ԥ���͹��ܵ����");
		countSession2.setMethodType("�����͹��ܵ����");
		countSession3.setMethodType("��ϸ�͹��ܵ����");

		CountSessionBusiness csb = new CountSessionBusiness();
		csb.create(countSession1);
		csb.create(countSession2);
		csb.create(countSession3);
		return list();
	}

	/* ��ȡҪ�޸ĵ���Ŀ */
	public String edit() {
		project = new ProjectBusiness().find(project);
		return SUCCESS;
	}

	/* �����޸ĺ����Ŀ */
	public String edited() {
		new ProjectBusiness().update(project);
		message = true;
		return SUCCESS;
	}

	/* ��ȡ�û��Ĺ�����Ŀ */
	public String list() {
		projects = getUser().getOrganization().getProjects();
		if (projects == null || projects.isEmpty())
			message = true;
		return INPUT;
	}

	/* ɾ����Ŀ */
	public String del() {
		new ProjectBusiness().delete(project);
		return list();
	}

	/*
	 * ���ܣ�׼��������Ŀ���б��ֽ�ϵͳʱѡ��
	 */
	public String select1() {
		projects = getUser().getOrganization().getProjects();
		return "FunctionModuleList";
	}

	/*
	 * ���ܣ�׼��������Ŀ���б���������ʱѡ��
	 */
	public String select2() {
		projects = getUser().getOrganization().getProjects();
		return "CountSessionList";
	}

	/* ��ȡ����Ĺ��㳡�����й��� */
	public String getRecentCs() {
		countSession = new CountSessionBusiness().getRecentCs(project);
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("countSessionId", countSession.getId());
		if (countSession.getMethodType().equals("�����͹��ܵ����"))
			return "medium";
		else if (countSession.getMethodType().equals("��ϸ�͹��ܵ����"))
			return "hard";
		else
			return "easy";
	}

	/* ��ͬ���㳡���Ľ���Ա� */
	public String getSumma() {
		project = new ProjectBusiness().find(project);
		/*
		 * DataFunctionBusiness dfb = new DataFunctionBusiness(); dataFunctions
		 * = dfb.getAllByCountSession(countSession); TransFunctionBusiness tfb =
		 * new TransFunctionBusiness(); transFunctions =
		 * tfb.getAllByCountSession(countSession);
		 * 
		 * List<FunctionModule> functionModules = project.getFunctionModules();
		 * int i = 0; while(functionModules!=null&&functionModules.size() >0 &&
		 * i < functionModules.size()) { dataFunctions.addAll(new
		 * DataFunctionBusiness
		 * ().listAllByCountSessionFunctionModule(countSession
		 * ,functionModules.get(i))); transFunctions.addAll(new
		 * TransFunctionBusiness
		 * ().listAllByCountSessionFunctionModule(countSession
		 * ,functionModules.get(i))); i ++; }
		 */
		return "summa";
	}

	public List<Project> getProjects() {
		return projects;
	}

	public void setProjects(List<Project> projects) {
		this.projects = projects;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public User getUser() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		user = new User();
		user.setId(userId);
		user = new UserBusiness().find(user);
		return user;
	}

	public void setUser(User user) {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		user = new User();
		user.setId(userId);
		user = new UserBusiness().find(user);
		this.user = user;
	}

	public boolean isMessage() {
		return message;
	}

	public void setMessage(boolean message) {
		this.message = message;
	}

	public CountSession getCountSession() {
		return countSession;
	}

	public void setCountSession(CountSession countSession) {
		this.countSession = countSession;
	}

	public List<DataFunction> getDataFunctions() {
		return dataFunctions;
	}

	public void setDataFunctions(List<DataFunction> dataFunctions) {
		this.dataFunctions = dataFunctions;
	}

	public List<TransFunction> getTransFunctions() {
		return transFunctions;
	}

	public void setTransFunctions(List<TransFunction> transFunctions) {
		this.transFunctions = transFunctions;
	}
}
