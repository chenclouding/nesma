package action.medium;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import bean.CountSession;
import bean.FunctionModule;
import bean.TransFunction;
import business.CountSessionBusiness;
import business.FunctionModuleBusiness;
import business.TransFunctionBusiness;

import com.opensymphony.xwork2.ActionSupport;

public class TransFunctionMAction extends ActionSupport {
	private List<TransFunction> transFunctions = new ArrayList<TransFunction>();
	private TransFunction transFunction;
	private CountSession countSession;
	private FunctionModule functionModule;
	private List<FunctionModule> functionModules = new ArrayList<FunctionModule>();
	private boolean message;

	/* ����������ģ�� */
	public String add() {
		transFunction.setCountSession(new CountSessionBusiness().find(countSession));
		transFunction.setFunctionModule(new FunctionModuleBusiness().find(functionModule));
		new TransFunctionBusiness().create(transFunction);
		return list();
	}

	/* ���ҵ���Ҫ�޸ĵ�������ģ�� */
	public String edit() {
		transFunction = new TransFunctionBusiness().find(transFunction);
		return SUCCESS;
	}

	/* �����޸ĺ�Ķ�Ӧ��������ģ�� */
	public String edited() {
		new TransFunctionBusiness().update(transFunction);
		message = true;
		return SUCCESS;
	}

	/*
	 * Ϊѡ����ģ���ṩ�б�
	 */
	public String selectForTf() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		Integer countSessionId = (Integer) session.getAttribute("countSessionId");
		countSession = new CountSessionBusiness().findById(countSessionId);
		functionModules = new FunctionModuleBusiness().getAllAtomicFunctionByProject(countSession.getProject());
		return "select";
	}

	/* ��ȡ���е������� */
	public String list() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		countSession = new CountSession();
		countSession.setId((Integer) session.getAttribute("countSessionId"));
		transFunctions = new TransFunctionBusiness().listAllByCountSessionFunctionModule(countSession, functionModule);
		if (transFunctions == null || transFunctions.isEmpty())
			message = true;
		return INPUT;
	}

	/* ɾ��������ģ�� */
	public String del() {
		new TransFunctionBusiness().delete(transFunction);
		return list();
	}

	public List<TransFunction> getTransFunctions() {
		return transFunctions;
	}

	public void setTransFunctions(List<TransFunction> transFunctions) {
		this.transFunctions = transFunctions;
	}

	public TransFunction getTransFunction() {
		return transFunction;
	}

	public void setTransFunction(TransFunction transFunction) {
		this.transFunction = transFunction;
	}

	public CountSession getCountSession() {
		return countSession;
	}

	public void setCountSession(CountSession countSession) {
		this.countSession = countSession;
	}

	public FunctionModule getFunctionModule() {
		return functionModule;
	}

	public void setFunctionModule(FunctionModule functionModule) {
		this.functionModule = functionModule;
	}

	public List<FunctionModule> getFunctionModules() {
		return functionModules;
	}

	public void setFunctionModules(List<FunctionModule> functionModules) {
		this.functionModules = functionModules;
	}

	public boolean isMessage() {
		return message;
	}

	public void setMessage(boolean message) {
		this.message = message;
	}

}
