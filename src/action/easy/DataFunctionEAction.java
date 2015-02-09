package action.easy;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import bean.CountSession;
import bean.DataFunction;
import bean.FunctionModule;
import business.CountSessionBusiness;
import business.DataFunctionBusiness;
import business.FunctionModuleBusiness;

import com.opensymphony.xwork2.ActionSupport;

public class DataFunctionEAction extends ActionSupport {
	private List<DataFunction> dataFunctions = new ArrayList<DataFunction>();
	private DataFunction dataFunction;
	private CountSession countSession;
	private FunctionModule functionModule;
	private List<FunctionModule> functionModules = new ArrayList<FunctionModule>();
	private boolean message;

	/* 新增数据功能 */
	public String add() {
		dataFunction.setCountSession(new CountSessionBusiness().find(countSession));
		dataFunction.setFunctionModule(new FunctionModuleBusiness().find(functionModule));
		new DataFunctionBusiness().create(dataFunction);
		return list();
	}

	/* 点击修改数据功能，先在数据库中查找到对应的记录 */
	public String edit() {
		dataFunction = new DataFunctionBusiness().find(dataFunction);
		return SUCCESS;
	}

	/* 保存修改后的数据功能 */
	public String edited() {
		new DataFunctionBusiness().update(dataFunction);
		message = true;
		return SUCCESS;
	}

	/*
	 * 为选择功能模块提供列表
	 */
	public String selectForDf() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		Integer countSessionId = (Integer) session.getAttribute("countSessionId");
		countSession = new CountSessionBusiness().findById(countSessionId);
		functionModules = new FunctionModuleBusiness().getAllAtomicFunctionByProject(countSession.getProject());
		return "select";
	}

	/* 列出所有的数据功能 */
	public String list() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		countSession = new CountSession();
		countSession.setId((Integer) session.getAttribute("countSessionId"));
		dataFunctions = new DataFunctionBusiness().listAllByCountSessionFunctionModule(countSession, functionModule);
		if (dataFunctions == null || dataFunctions.isEmpty())
			message = true;
		return INPUT;
	}

	/* 删除数据功能 */
	public String del() {
		new DataFunctionBusiness().delete(dataFunction);
		return list();
	}

	public List<DataFunction> getDataFunctions() {
		return dataFunctions;
	}

	public void setDataFunctions(List<DataFunction> dataFunctions) {
		this.dataFunctions = dataFunctions;
	}

	public DataFunction getDataFunction() {
		return dataFunction;
	}

	public void setDataFunction(DataFunction dataFunction) {
		this.dataFunction = dataFunction;
	}

	public CountSession getCountSession() {
		return countSession;
	}

	public void setCountSession(CountSession countSession) {
		this.countSession = countSession;
	}

	public boolean isMessage() {
		return message;
	}

	public void setMessage(boolean message) {
		this.message = message;
	}

	public List<FunctionModule> getFunctionModules() {
		return functionModules;
	}

	public void setFunctionModules(List<FunctionModule> functionModules) {
		this.functionModules = functionModules;
	}

	public FunctionModule getFunctionModule() {
		return functionModule;
	}

	public void setFunctionModule(FunctionModule functionModule) {
		this.functionModule = functionModule;
	}

}
