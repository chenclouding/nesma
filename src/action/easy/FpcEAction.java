package action.easy;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import bean.AdjustParam;
import bean.CostEstimate;
import bean.CountSession;
import bean.FunctionModule;
import bean.Project;
import bean.SetAdjust;
import business.AdjustParamBusiness;
import business.CountSessionBusiness;
import business.DataFunctionBusiness;
import business.FunctionModuleBusiness;
import business.ParamCalculateBusiness;
import business.SetAdjustBusiness;

import com.opensymphony.xwork2.ActionSupport;

import dao.BaseDAO;

public class FpcEAction extends ActionSupport {
	private Project project;
	private CountSession countSession;
	private List<FunctionModule> functionModules = new ArrayList<FunctionModule>();
	private AdjustParam adjustParam;
	private CostEstimate costEstimate;
	private List<FunctionModule> atomFunctionModules = new ArrayList<FunctionModule>();

	public List<FunctionModule> getAtomFunctionModules() {
		return atomFunctionModules;
	}

	public void setAtomFunctionModules(List<FunctionModule> atomFunctionModules) {
		this.atomFunctionModules = atomFunctionModules;
	}

	/* 计算项目的未调整功能点数 */
	public String input() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		Integer countSessionId = (Integer) session.getAttribute("countSessionId");
		CountSessionBusiness csb = new CountSessionBusiness();
		countSession = csb.findById(countSessionId);
		project = countSession.getProject();
		functionModules = new FunctionModuleBusiness().getByProject(project);

		DataFunctionBusiness dfb = new DataFunctionBusiness();
		Double countSessionUfpc = 0.0;
		for (FunctionModule fm : functionModules) {
			fm.setDataFunctions(dfb.getDataFunctionByCountSessionFunctionModule(countSession, fm));
			double df = 0;
			if (fm.getType().equals("原子模块")) {
				df += getFM(countSession, fm);
				atomFunctionModules.add(fm);
			} else { // 组合模块
				df += subFM(countSession, fm);
			}
			fm.setUfpc(df); // 设置对应功能模块的未调整功能点数
			countSessionUfpc += dfb.getUfpc(countSession, fm);
		}
		countSession.setUfpc(countSessionUfpc);
		BaseDAO<CountSession> dao = new BaseDAO<CountSession>();
		dao.update(countSession);

		BaseDAO<Project> daop = new BaseDAO<Project>();
		project.setUfpc(countSessionUfpc);// 设置对应估算项目的未调整功能点数
		project.setEstimateStatus(1);//
		daop.update(project);
		return "input";
	}

	/* 计算项目加入吻合度的功能点数，获取工作量、工期、成本 */
	public String inputFit() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		Integer countSessionId = (Integer) session.getAttribute("countSessionId");
		DataFunctionBusiness dfb = new DataFunctionBusiness();
		countSession = new CountSessionBusiness().findById(countSessionId);
		project = countSession.getProject();
		functionModules = new FunctionModuleBusiness().getByProject(project);
		double fpc = 0;
		for (FunctionModule fm : functionModules) {
			fm.setDataFunctions(new DataFunctionBusiness().getDataFunctionByCountSessionFunctionModule(countSession, fm));
			double fit = 0;
			if (fm.getType().equals("原子模块")) {
				fit += getFMFit(countSession, fm);
				atomFunctionModules.add(fm);
			} else {
				fit += subFMFit(countSession, fm);
			}
			fm.setFitfpc(fit);// 设置对应功能模块加入吻合度的功能点数
			fpc += dfb.getUfpcFit(countSession, fm);
		}
		countSession.setFitfpc(fpc);
		BaseDAO<CountSession> dao = new BaseDAO<CountSession>();
		dao.update(countSession);

		SetAdjust sa = new SetAdjustBusiness().getByCountSession(countSession);
		adjustParam = new AdjustParamBusiness().findBySetAdjust(sa, null);
		ParamCalculateBusiness pcb = new ParamCalculateBusiness();
		double a1 = pcb.getEffort(adjustParam.getFpCostOptimistic(), countSession);// 工作量上限值
		double a2 = pcb.getEffort(adjustParam.getFpCostStandard(), countSession);// 工作量标准值
		double a3 = pcb.getEffort(adjustParam.getFpCostPessimistic(), countSession);// 工作量下限值
		double b1 = pcb.getDuration(a1);// 工期上限值
		double b2 = pcb.getDuration(a2);// 工期标准值
		double b3 = pcb.getDuration(a3);// 工期下限值
		double c1 = pcb.getBudget(a1, countSession);// 成本上限值
		double c2 = pcb.getBudget(a2, countSession);// 成本标准值
		double c3 = pcb.getBudget(a3, countSession);// 成本下限值
		a1 = getFormateDouble(a1);
		a2 = getFormateDouble(a2);
		a3 = getFormateDouble(a3);
		b1 = getFormateDouble(b1);
		b2 = getFormateDouble(b2);
		b3 = getFormateDouble(b3);
		c1 = getFormateDouble(c1);
		c2 = getFormateDouble(c2);
		c3 = getFormateDouble(c3);
		costEstimate = new CostEstimate();
		costEstimate.setEffortOptimistic(a1);
		costEstimate.setEffortStandard(a2);
		costEstimate.setEffortPessimistic(a3);
		costEstimate.setDurationOptimistic(b1);
		costEstimate.setDurationStandard(b2);
		costEstimate.setDurantionPessimistic(b3);
		costEstimate.setBudgetOptimistic(c1);
		costEstimate.setBudgetStandard(c2);
		costEstimate.setBudgetPessimistic(c3);

		return "inputFit";
	}

	/* 若是组合模块，累计其所有原子模块的未调整功能点数 */
	private double subFM(CountSession countSession2, FunctionModule fm) {
		double df = 0;
		for (FunctionModule ffm : fm.getChildrenModules()) {
			if (ffm.getType().equals("原子模块")) {
				df += getFM(countSession, ffm);
			}
			{
				df += subFM(countSession, ffm);
			}
		}
		return df;
	}

	/* 若是组合模块，累计其所有原子模块加入吻合度的功能点数 */
	private double subFMFit(CountSession countSession2, FunctionModule fm) {
		double df = 0;
		for (FunctionModule ffm : fm.getChildrenModules()) {
			if (ffm.getType().equals("原子模块")) {
				df += getFMFit(countSession, ffm);
			}
			{
				df += subFMFit(countSession, ffm);
			}
		}
		return df;
	}

	/* 获取功能模块的未调整功能点数 */
	private double getFM(CountSession countSession2, FunctionModule fm) {
		return new DataFunctionBusiness().getUfpc(countSession2, fm);
	}

	/* 获取功能模块加入吻合度的功能点数 */
	private double getFMFit(CountSession countSession2, FunctionModule fm) {
		return new DataFunctionBusiness().getUfpcFit(countSession2, fm);
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public CountSession getCountSession() {
		return countSession;
	}

	public void setCountSession(CountSession countSession) {
		this.countSession = countSession;
	}

	public List<FunctionModule> getFunctionModules() {
		return functionModules;
	}

	public void setFunctionModules(List<FunctionModule> functionModules) {
		this.functionModules = functionModules;
	}

	public AdjustParam getAdjustParam() {
		return adjustParam;
	}

	public void setAdjustParam(AdjustParam adjustParam) {
		this.adjustParam = adjustParam;
	}

	public CostEstimate getCostEstimate() {
		return costEstimate;
	}

	public void setCostEstimate(CostEstimate costEstimate) {
		this.costEstimate = costEstimate;
	}

	private Double getFormateDouble(Double number) {
		if (number == 0)
			return number;
		BigDecimal b = new BigDecimal(number);
		return b.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();

	}

}
