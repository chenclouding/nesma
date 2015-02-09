package action.hard;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import bean.CountSession;
import bean.DataFunction;
import bean.Ret;
import business.CountSessionBusiness;
import business.DataFunctionBusiness;
import business.RetBusiness;

import com.opensymphony.xwork2.ActionSupport;

public class RetHAction extends ActionSupport {
	private List<DataFunction> dataFunctions = new ArrayList<DataFunction>();
	private Ret ret;
	private CountSession countSession;
	private DataFunction dataFunction;
	private List<Ret> rets = new ArrayList<Ret>();
	private boolean message;

	/* 增加记录元素 */
	public String add() {
		ret.setDataFunction(new DataFunctionBusiness().find(dataFunction));
		new RetBusiness().create(ret);
		return list();
	}

	/* 获取要修改的记录元素 */
	public String edit() {
		ret = new RetBusiness().find(ret);
		return SUCCESS;
	}

	/* 保存修改后的记录元素 */
	public String edited() {
		new RetBusiness().update(ret);
		message = true;
		return SUCCESS;
	}

	/* 获取记录元素列表 */
	public String list() {
		dataFunction = new DataFunctionBusiness().find(dataFunction);
		rets = dataFunction.getRets();
		if (rets == null || rets.isEmpty())
			message = true;
		return INPUT;
	}

	/* 删除记录元素 */
	public String del() {
		new RetBusiness().delete(ret);
		return list();
	}

	/* 为选择记录元素提供列表 */
	public String selectForRet() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		Integer countSessionId = (Integer) session.getAttribute("countSessionId");
		countSession = new CountSessionBusiness().findById(countSessionId);
		dataFunctions = new DataFunctionBusiness().getAllByCountSession(countSession);
		return "select";
	}

	public List<DataFunction> getDataFunctions() {
		return dataFunctions;
	}

	public void setDataFunctions(List<DataFunction> dataFunctions) {
		this.dataFunctions = dataFunctions;
	}

	public Ret getRet() {
		return ret;
	}

	public void setRet(Ret ret) {
		this.ret = ret;
	}

	public CountSession getCountSession() {
		return countSession;
	}

	public void setCountSession(CountSession countSession) {
		this.countSession = countSession;
	}

	public DataFunction getDataFunction() {
		return dataFunction;
	}

	public void setDataFunction(DataFunction dataFunction) {
		this.dataFunction = dataFunction;
	}

	public List<Ret> getRets() {
		return rets;
	}

	public void setRets(List<Ret> rets) {
		this.rets = rets;
	}

	public boolean isMessage() {
		return message;
	}

	public void setMessage(boolean message) {
		this.message = message;
	}

}
