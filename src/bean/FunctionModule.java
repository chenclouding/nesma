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

/** 功能模块 */

@Entity
public class FunctionModule extends BaseBean {
	private String devLang;// 开发语言
	private String devType;// 开发类型
	private String name;// 名称
	private String description;// 描述
	private String type;// 类型 组合、原子
	private Integer estimateStatus;// 估算状态
	private Double ufpc;// 未调整功能点数
	private Double fitfpc;// 加入吻合度的功能点数
	@ManyToOne
	@LazyCollection(LazyCollectionOption.FALSE)
	@JoinColumn(name = "project_id")
	private Project project;
	@ManyToOne
	@LazyCollection(LazyCollectionOption.FALSE)
	@JoinColumn(name = "parentModule_id")
	private FunctionModule parentModule;
	@OneToMany(mappedBy = "parentModule")
	@LazyCollection(LazyCollectionOption.FALSE)
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN, CascadeType.ALL })
	private List<FunctionModule> childrenModules = new ArrayList<FunctionModule>();
	@OneToMany(mappedBy = "functionModule")
	@LazyCollection(LazyCollectionOption.FALSE)
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN, CascadeType.ALL })
	private List<DataFunction> dataFunctions = new ArrayList<DataFunction>();
	@OneToMany(mappedBy = "functionModule")
	@LazyCollection(LazyCollectionOption.FALSE)
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN, CascadeType.ALL })
	private List<TransFunction> transFunctions = new ArrayList<TransFunction>();

	public List<TransFunction> getTransFunctions() {
		return transFunctions;
	}

	public void setTransFunctions(List<TransFunction> transFunctions) {
		this.transFunctions = transFunctions;
	}

	public String getDevLang() {
		return devLang;
	}

	public void setDevLang(String devLang) {
		this.devLang = devLang;
	}

	public String getDevType() {
		return devType;
	}

	public void setDevType(String devType) {
		this.devType = devType;
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

	public Double getUfpc() {
		return ufpc;
	}

	public void setUfpc(Double ufpc) {
		this.ufpc = ufpc;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public FunctionModule getParentModule() {
		return parentModule;
	}

	public void setParentModule(FunctionModule parentModule) {
		this.parentModule = parentModule;
	}

	public List<FunctionModule> getChildrenModules() {
		return childrenModules;
	}

	public void setChildrenModules(List<FunctionModule> childrenModules) {
		this.childrenModules = childrenModules;
	}

	public List<DataFunction> getDataFunctions() {
		return dataFunctions;
	}

	public void setDataFunctions(List<DataFunction> dataFunctions) {
		this.dataFunctions = dataFunctions;
	}

	public Double getFitfpc() {
		return fitfpc;
	}

	public void setFitfpc(Double fitfpc) {
		this.fitfpc = fitfpc;
	}

}