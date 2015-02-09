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

/** 数据功能 */

@Entity
public class DataFunction extends BaseBean {
	private String name;// 名称
	private String description;// 描述
	private String type;// 类型ILF、EIF、未定
	private Integer estimateStatus;// 估算状态
	private String isCounted;// 是否计入
	private String ignoreReason;// 不计入原因
	private String fitType;// 吻合度
	private String methodType;// 估算方法 手动导入、直接输入个数
	private Double ufpc;// 未调整功能点数
	private Double fitfpc;// 加入吻合度的功能点数
	private Integer retvalue;// RET的值
	private Integer detvalue;// DET的值
	private String fpcType;// 项目估算类型 预估、估计、详细
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