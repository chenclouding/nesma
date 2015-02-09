package bean;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

/** ���㳡�� */

@Entity
public class CountSession extends BaseBean {
	private String name;// ����
	private String description;// ����
	@Temporal(TemporalType.DATE)
	private java.util.Date startTime;// ��ʼʱ��
	private String estimateStatus;// ����״̬
	private String lifecyclePhase;// ����������ڽ׶�
	private String methodType;// ���㷽������
	private Double ufpc;// δ�������ܵ���
	private Double fitfpc;// �����Ǻ϶ȵĹ��ܵ���
	private Double fpc;// �������ܵ���
	@ManyToOne
	@LazyCollection(LazyCollectionOption.FALSE)
	@JoinColumn(name = "project_id")
	private Project project;

	@OneToMany(mappedBy = "countSession")
	@LazyCollection(LazyCollectionOption.FALSE)
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN, CascadeType.ALL })
	private List<CostEstimate> costEstimates = new ArrayList<CostEstimate>();

	@OneToMany(mappedBy = "countSession")
	@LazyCollection(LazyCollectionOption.FALSE)
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN, CascadeType.ALL })
	private List<DataFunction> dataFunctions = new ArrayList<DataFunction>();

	@OneToMany(mappedBy = "countSession")
	@LazyCollection(LazyCollectionOption.FALSE)
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN, CascadeType.ALL })
	private List<TransFunction> transFunctions = new ArrayList<TransFunction>();

	@OneToMany(mappedBy = "countSession")
	@LazyCollection(LazyCollectionOption.FALSE)
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN, CascadeType.ALL })
	private List<SessionAdjustFactor> sessionAdjustFactors = new ArrayList<SessionAdjustFactor>();

	@OneToMany(mappedBy = "countSession")
	@LazyCollection(LazyCollectionOption.FALSE)
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN, CascadeType.ALL })
	private List<SetAdjust> setAdjusts = new ArrayList<SetAdjust>();

	public List<CostEstimate> getCostEstimates() {
		return costEstimates;
	}

	public void setCostEstimates(List<CostEstimate> costEstimates) {
		this.costEstimates = costEstimates;
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

	public List<SessionAdjustFactor> getSessionAdjustFactors() {
		return sessionAdjustFactors;
	}

	public void setSessionAdjustFactors(List<SessionAdjustFactor> sessionAdjustFactors) {
		this.sessionAdjustFactors = sessionAdjustFactors;
	}

	public List<SetAdjust> getSetAdjusts() {
		return setAdjusts;
	}

	public void setSetAdjusts(List<SetAdjust> setAdjusts) {
		this.setAdjusts = setAdjusts;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public java.util.Date getStartTime() {
		return startTime;
	}

	public void setStartTime(java.util.Date startTime) {
		this.startTime = startTime;
	}

	public String getEstimateStatus() {
		return estimateStatus;
	}

	public void setEstimateStatus(String estimateStatus) {
		this.estimateStatus = estimateStatus;
	}

	public String getLifecyclePhase() {
		return lifecyclePhase;
	}

	public void setLifecyclePhase(String lifecyclePhase) {
		this.lifecyclePhase = lifecyclePhase;
	}

	public String getMethodType() {
		return methodType;
	}

	public void setMethodType(String methodType) {
		this.methodType = methodType;
	}

	public Double getUfpc() {
		return ufpc;
	}

	public void setUfpc(Double ufpc) {
		this.ufpc = ufpc;
	}

	public Double getFitfpc() {
		return fitfpc;
	}

	public void setFitfpc(Double fitfpc) {
		this.fitfpc = fitfpc;
	}

	public Double getFpc() {
		return fpc;
	}

	public void setFpc(Double fpc) {
		this.fpc = fpc;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

}