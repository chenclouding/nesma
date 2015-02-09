package bean;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

/** ������ */

@Entity
public class TransFunction extends BaseBean {
	private String name;// ����
	private String description;// ����
	private String type;// ����
	private String estimateStatus;// ����״̬
	private String methodType;// ���㷽��
	private Double ufpc;// δ�������ܵ���
	private Integer detValue;// DETֵ
	private Integer ftrValue;// RETֵ
	private Integer det;// DETֵ
	private Integer ftr;// FTRֵ
	@ManyToOne
	@LazyCollection(LazyCollectionOption.FALSE)
	@JoinColumn(name = "functionModule_id")
	private FunctionModule functionModule;
	@ManyToOne
	@LazyCollection(LazyCollectionOption.FALSE)
	@JoinColumn(name = "countSession_id")
	private CountSession countSession;

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

	public String getEstimateStatus() {
		return estimateStatus;
	}

	public void setEstimateStatus(String estimateStatus) {
		this.estimateStatus = estimateStatus;
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

	public Integer getDetValue() {
		return detValue;
	}

	public void setDetValue(Integer detValue) {
		this.detValue = detValue;
	}

	public Integer getFtrValue() {
		return ftrValue;
	}

	public void setFtrValue(Integer ftrValue) {
		this.ftrValue = ftrValue;
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

	public Integer getDet() {
		return det;
	}

	public void setDet(Integer det) {
		this.det = det;
	}

	public Integer getFtr() {
		return ftr;
	}

	public void setFtr(Integer ftr) {
		this.ftr = ftr;
	}

}