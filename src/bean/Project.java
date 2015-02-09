package bean;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

/** ��Ŀ��Ϣ */

@Entity
public class Project extends BaseBean {
	private String name;// ����
	private String description;// ����
	private String type;// �������� ���������ο�������ǿ
	private String country;// ��Ŀ��Դ
	private String province;// ��������
	private String city;// ��������
	private String industry;// �û���֯����
	private String devPlatform;// ����ƽ̨
	private String ide;// ���ɿ�������
	private String devLang;// �������
	private String os;// ����ϵͳ
	private String database2;// ���ݿ�
	private String businessOutlet;// ҵ������
	private String businessUnit;// ҵ��Ԫ
	private String projectSLCModel;// ��������ģ������
	private String methodType;// ���㷽��
	@Temporal(TemporalType.DATE)
	private java.util.Date startDate;// ������ʼʱ��
	@Temporal(TemporalType.DATE)
	private java.util.Date endDate;// ��������ʱ��

	@ManyToOne
	@LazyCollection(LazyCollectionOption.FALSE)
	@JoinColumn(name = "owner_id")
	private User owner;
	private Integer estimateStatus;
	private Double ufpc;
	private Double fpc;
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "project_user", joinColumns = @JoinColumn(name = "project_id", referencedColumnName = "id"), inverseJoinColumns = @JoinColumn(name = "user_id", referencedColumnName = "id"))
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN, CascadeType.ALL })
	private Set<User> users = new HashSet<User>();
	@ManyToOne
	@LazyCollection(LazyCollectionOption.FALSE)
	@JoinColumn(name = "organization_id")
	private Organization organization;
	@OneToMany(mappedBy = "project")
	@LazyCollection(LazyCollectionOption.FALSE)
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN, CascadeType.ALL })
	private List<FunctionModule> functionModules = new ArrayList<FunctionModule>();
	@OneToMany(mappedBy = "project")
	@LazyCollection(LazyCollectionOption.FALSE)
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN, CascadeType.ALL })
	private List<CountSession> countSessions = new ArrayList<CountSession>();

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

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getIndustry() {
		return industry;
	}

	public void setIndustry(String industry) {
		this.industry = industry;
	}

	public String getDevPlatform() {
		return devPlatform;
	}

	public void setDevPlatform(String devPlatform) {
		this.devPlatform = devPlatform;
	}

	public String getIde() {
		return ide;
	}

	public void setIde(String ide) {
		this.ide = ide;
	}

	public String getDevLang() {
		return devLang;
	}

	public void setDevLang(String devLang) {
		this.devLang = devLang;
	}

	public String getOs() {
		return os;
	}

	public void setOs(String os) {
		this.os = os;
	}

	public String getDatabase2() {
		return database2;
	}

	public void setDatabase2(String database2) {
		this.database2 = database2;
	}

	public String getBusinessOutlet() {
		return businessOutlet;
	}

	public void setBusinessOutlet(String businessOutlet) {
		this.businessOutlet = businessOutlet;
	}

	public String getBusinessUnit() {
		return businessUnit;
	}

	public void setBusinessUnit(String businessUnit) {
		this.businessUnit = businessUnit;
	}

	public String getProjectSLCModel() {
		return projectSLCModel;
	}

	public void setProjectSLCModel(String projectSLCModel) {
		this.projectSLCModel = projectSLCModel;
	}

	public String getMethodType() {
		return methodType;
	}

	public void setMethodType(String methodType) {
		this.methodType = methodType;
	}

	public java.util.Date getStartDate() {
		return startDate;
	}

	public void setStartDate(java.util.Date startDate) {
		this.startDate = startDate;
	}

	public java.util.Date getEndDate() {
		return endDate;
	}

	public void setEndDate(java.util.Date endDate) {
		this.endDate = endDate;
	}

	public User getOwner() {
		return owner;
	}

	public void setOwner(User owner) {
		this.owner = owner;
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

	public Double getFpc() {
		return fpc;
	}

	public void setFpc(Double fpc) {
		this.fpc = fpc;
	}

	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

	public Organization getOrganization() {
		return organization;
	}

	public void setOrganization(Organization organization) {
		this.organization = organization;
	}

	public List<FunctionModule> getFunctionModules() {
		return functionModules;
	}

	public void setFunctionModules(List<FunctionModule> functionModules) {
		this.functionModules = functionModules;
	}

	public List<CountSession> getCountSessions() {
		return countSessions;
	}

	public void setCountSessions(List<CountSession> countSessions) {
		this.countSessions = countSessions;
	}
}