package action.main;

import java.util.ArrayList;
import java.util.List;

import bean.FunctionModule;
import bean.Project;
import business.FunctionModuleBusiness;
import business.ProjectBusiness;

import com.opensymphony.xwork2.ActionSupport;

public class FunctionModuleAction extends ActionSupport {
	private List<FunctionModule> functionModules = new ArrayList<FunctionModule>();
	private Project project;
	private FunctionModule functionModule;
	private FunctionModule father;
	private boolean message;

	/* ��������ģ�� */
	public String add() {
		// �����project����ģ��
		if (father == null || father.getId() == null) {
			functionModule.setProject(new ProjectBusiness().find(project));
		} else {
			functionModule.setParentModule(new FunctionModuleBusiness().find(father));
			functionModule.setProject(functionModule.getParentModule().getProject());
		}
		new FunctionModuleBusiness().create(functionModule);
		return list();
	}

	/* ��ȡҪ�޸ĵĹ���ģ�� */
	public String edit() {
		functionModule = new FunctionModuleBusiness().find(functionModule);
		return SUCCESS;
	}

	/* �����޸ĺ�Ĺ���ģ�� */
	public String edited() {
		new FunctionModuleBusiness().update(functionModule);
		message = true;
		return SUCCESS;
	}

	/* ��ȡ���еĹ���ģ�� */
	public String list() {
		functionModules = new FunctionModuleBusiness().getSubModules(father, project);
		if (functionModules == null || functionModules.isEmpty())
			message = true;
		return INPUT;
	}

	/* ɾ������ģ�� */
	public String del() {
		new FunctionModuleBusiness().delete(functionModule);
		return list();
	}

	public List<FunctionModule> getFunctionModules() {
		return functionModules;
	}

	public void setFunctionModules(List<FunctionModule> functionModules) {
		this.functionModules = functionModules;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public FunctionModule getFunctionModule() {
		return functionModule;
	}

	public void setFunctionModule(FunctionModule functionModule) {
		this.functionModule = functionModule;
	}

	public FunctionModule getFather() {
		return father;
	}

	public void setFather(FunctionModule father) {
		this.father = father;
	}

	public boolean isMessage() {
		return message;
	}

	public void setMessage(boolean message) {
		this.message = message;
	}

}
