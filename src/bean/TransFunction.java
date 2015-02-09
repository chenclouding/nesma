package bean;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

/** 事务功能 */

@Entity
public class TransFunction extends BaseBean {
	private String name;// 名称
	private String description;// 描述
	private String type;// 类型
	private String estimateStatus;// 估算状态
	private String methodType;// 估算方法
	private Double ufpc;// 未调整功能点数
	private Integer detValue;// DET值
	private Integer ftrValue;// RET值
	private Integer det;// DET值
	private Integer ftr;// FTR值
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