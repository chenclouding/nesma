package bean;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

/** 组织信息 */

@Entity
public class Organization extends BaseBean {
	private String name;// 名称
	private String type;// 类型
	private String description;// 简介
	private String contact;// 联系人
	private String address;// 地址
	private String nation;// 国家
	private String province;// 省
	private String city;// 市
	private String postcode;// 邮编
	private String fax;// 传真
	private String phone;// 固定电话
	private String mail;// 电子邮件
	@OneToMany(mappedBy = "organization")
	@LazyCollection(LazyCollectionOption.FALSE)
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN, CascadeType.ALL })
	private List<User> users = new ArrayList<User>();

	// cascade new
	@OneToMany(mappedBy = "organization")
	@LazyCollection(LazyCollectionOption.FALSE)
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN, CascadeType.ALL })
	private List<TeamExperienceFactor> teamExperienceFactors = new ArrayList<TeamExperienceFactor>();

	@OneToMany(mappedBy = "organization")
	@LazyCollection(LazyCollectionOption.FALSE)
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN, CascadeType.ALL })
	private List<QualityFactor> qualityFactors = new ArrayList<QualityFactor>();

	@OneToMany(mappedBy = "organization")
	@LazyCollection(LazyCollectionOption.FALSE)
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN, CascadeType.ALL })
	private List<Project> projects = new ArrayList<Project>();

	@OneToMany(mappedBy = "organization")
	@LazyCollection(LazyCollectionOption.FALSE)
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN, CascadeType.ALL })
	private List<FactorValue> factorValues = new ArrayList<FactorValue>();

	@OneToMany(mappedBy = "organization")
	@LazyCollection(LazyCollectionOption.FALSE)
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN, CascadeType.ALL })
	private List<DevLangFactor> devLangFactors = new ArrayList<DevLangFactor>();

	@OneToMany(mappedBy = "organization")
	@LazyCollection(LazyCollectionOption.FALSE)
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN, CascadeType.ALL })
	private List<AppTypeFactor> appTypeFactors = new ArrayList<AppTypeFactor>();

	@OneToMany(mappedBy = "organization")
	@LazyCollection(LazyCollectionOption.FALSE)
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN, CascadeType.ALL })
	private List<ApplyAreaFactor> applyAreaFactors = new ArrayList<ApplyAreaFactor>();

	@OneToMany(mappedBy = "organization")
	@LazyCollection(LazyCollectionOption.FALSE)
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN, CascadeType.ALL })
	private List<AdjustParam> adjustParams = new ArrayList<AdjustParam>();

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
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

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public List<TeamExperienceFactor> getTeamExperienceFactors() {
		return teamExperienceFactors;
	}

	public void setTeamExperienceFactors(List<TeamExperienceFactor> teamExperienceFactors) {
		this.teamExperienceFactors = teamExperienceFactors;
	}

	public List<QualityFactor> getQualityFactors() {
		return qualityFactors;
	}

	public void setQualityFactors(List<QualityFactor> qualityFactors) {
		this.qualityFactors = qualityFactors;
	}

	public List<Project> getProjects() {
		return projects;
	}

	public void setProjects(List<Project> projects) {
		this.projects = projects;
	}

	public List<FactorValue> getFactorValues() {
		return factorValues;
	}

	public void setFactorValues(List<FactorValue> factorValues) {
		this.factorValues = factorValues;
	}

	public List<DevLangFactor> getDevLangFactors() {
		return devLangFactors;
	}

	public void setDevLangFactors(List<DevLangFactor> devLangFactors) {
		this.devLangFactors = devLangFactors;
	}

	public List<AppTypeFactor> getAppTypeFactors() {
		return appTypeFactors;
	}

	public void setAppTypeFactors(List<AppTypeFactor> appTypeFactors) {
		this.appTypeFactors = appTypeFactors;
	}

	public List<ApplyAreaFactor> getApplyAreaFactors() {
		return applyAreaFactors;
	}

	public void setApplyAreaFactors(List<ApplyAreaFactor> applyAreaFactors) {
		this.applyAreaFactors = applyAreaFactors;
	}

	public List<AdjustParam> getAdjustParams() {
		return adjustParams;
	}

	public void setAdjustParams(List<AdjustParam> adjustParams) {
		this.adjustParams = adjustParams;
	}

}