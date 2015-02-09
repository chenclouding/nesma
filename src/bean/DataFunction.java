package bean;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

/** ���ݹ��� */

@Entity
public class DataFunction extends BaseBean {
	private String name;// ����
	private String description;// ����
	private String type;// ����ILF��EIF��δ��
	private Integer estimateStatus;// ����״̬
	private String isCounted;// �Ƿ����
	private String ignoreReason;// ������ԭ��
	private String fitType;// �Ǻ϶�
	private String methodType;// ���㷽�� �ֶ����롢ֱ���������
	private Double ufpc;// δ�������ܵ���
	private Double fitfpc;// �����Ǻ϶ȵĹ��ܵ���
	private Integer retvalue;// RET��ֵ
	private Integer detvalue;// DET��ֵ
	private String fpcType;// ��Ŀ�������� Ԥ�������ơ���ϸ
	@ManyToOne
	@JoinColumn(name = "functionModule_id")
	private FunctionModule functionModule;
	@ManyToOne
	@JoinColumn(name = "countSession_id")
	private CountSession countSession;
	@OneToMany(mappedBy = "dataFunction")
	@LazyCollection(LazyCollectionOption.FALSE)
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN, CascadeType.ALL })
	private List<Ret> rets = new ArrayList<Ret>();

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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getEstimateStatus() {
		return estimateStatus;
	}

	public void setEstimateStatus(Integer estimateStatus) {
		this.estimateStatus = estimateStatus;
	}

	public String getIsCounted() {
		return isCounted;
	}

	public void setIsCounted(String isCounted) {
		this.isCounted = isCounted;
	}

	public String getIgnoreReason() {
		return ignoreReason;
	}

	public void setIgnoreReason(String ignoreReason) {
		this.ignoreReason = ignoreReason;
	}

	public String getFitType() {
		return fitType;
	}

	public void setFitType(String fitType) {
		this.fitType = fitType;
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

	public Integer getRetvalue() {
		return retvalue;
	}

	public void setRetvalue(Integer retvalue) {
		this.retvalue = retvalue;
	}

	public Integer getDetvalue() {
		return detvalue;
	}

	public void setDetvalue(Integer detvalue) {
		this.detvalue = detvalue;
	}

	public String getFpcType() {
		return fpcType;
	}

	public void setFpcType(String fpcType) {
		this.fpcType = fpcType;
	}

	public FunctionModule getFunctionModule() {
		return functionModule;
	}

	public void setFunctionModule(FunctionModule functionModule) {
		this.functionModule = functionModule;
	}

	public CountSession getCountSession() {
		return countSession;
	}

	public void setCountSession(CountSession countSession) {
		this.countSession = countSession;
	}

	public List<Ret> getRets() {
		return rets;
	}

	public void setRets(List<Ret> rets) {
		this.rets = rets;
	}

}