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

	/* ������Ŀ��δ�������ܵ��� */
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
			if (fm.getType().equals("ԭ��ģ��")) {
				df += getFM(countSession, fm);
				atomFunctionModules.add(fm);
			} else { // ���ģ��
				df += subFM(countSession, fm);
			}
			fm.setUfpc(df); // ���ö�Ӧ����ģ���δ�������ܵ���
			countSessionUfpc += dfb.getUfpc(countSession, fm);
		}
		countSession.setUfpc(countSessionUfpc);
		BaseDAO<CountSession> dao = new BaseDAO<CountSession>();
		dao.update(countSession);

		BaseDAO<Project> daop = new BaseDAO<Project>();
		project.setUfpc(countSessionUfpc);// ���ö�Ӧ������Ŀ��δ�������ܵ���
		project.setEstimateStatus(1);//
		daop.update(project);
		return "input";
	}

	/* ������Ŀ�����Ǻ϶ȵĹ��ܵ�������ȡ�����������ڡ��ɱ� */
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
			if (fm.getType().equals("ԭ��ģ��")) {
				fit += getFMFit(countSession, fm);
				atomFunctionModules.add(fm);
			} else {
				fit += subFMFit(countSession, fm);
			}
			fm.setFitfpc(fit);// ���ö�Ӧ����ģ������Ǻ϶ȵĹ��ܵ���
			fpc += dfb.getUfpcFit(countSession, fm);
		}
		countSession.setFitfpc(fpc);
		BaseDAO<CountSession> dao = new BaseDAO<CountSession>();
		dao.update(countSession);

		SetAdjust sa = new SetAdjustBusiness().getByCountSession(countSession);
		adjustParam = new AdjustParamBusiness().findBySetAdjust(sa, null);
		ParamCalculateBusiness pcb = new ParamCalculateBusiness();
		double a1 = pcb.getEffort(adjustParam.getFpCostOptimistic(), countSession);// ����������ֵ
		double a2 = pcb.getEffort(adjustParam.getFpCostStandard(), countSession);// ��������׼ֵ
		double a3 = pcb.getEffort(adjustParam.getFpCostPessimistic(), countSession);// ����������ֵ
		double b1 = pcb.getDuration(a1);// ��������ֵ
		double b2 = pcb.getDuration(a2);// ���ڱ�׼ֵ
		double b3 = pcb.getDuration(a3);// ��������ֵ
		double c1 = pcb.getBudget(a1, countSession);// �ɱ�����ֵ
		double c2 = pcb.getBudget(a2, countSession);// �ɱ���׼ֵ
		double c3 = pcb.getBudget(a3, countSession);// �ɱ�����ֵ
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

	/* �������ģ�飬�ۼ�������ԭ��ģ���δ�������ܵ��� */
	private double subFM(CountSession countSession2, FunctionModule fm) {
		double df = 0;
		for (FunctionModule ffm : fm.getChildrenModules()) {
			if (ffm.getType().equals("ԭ��ģ��")) {
				df += getFM(countSession, ffm);
			}
			{
				df += subFM(countSession, ffm);
			}
		}
		return df;
	}

	/* �������ģ�飬�ۼ�������ԭ��ģ������Ǻ϶ȵĹ��ܵ��� */
	private double subFMFit(CountSession countSession2, FunctionModule fm) {
		double df = 0;
		for (FunctionModule ffm : fm.getChildrenModules()) {
			if (ffm.getType().equals("ԭ��ģ��")) {
				df += getFMFit(countSession, ffm);
			}
			{
				df += subFMFit(countSession, ffm);
			}
		}
		return df;
	}

	/* ��ȡ����ģ���δ�������ܵ��� */
	private double getFM(CountSession countSession2, FunctionModule fm) {
		return new DataFunctionBusiness().getUfpc(countSession2, fm);
	}

	/* ��ȡ����ģ������Ǻ϶ȵĹ��ܵ��� */
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
