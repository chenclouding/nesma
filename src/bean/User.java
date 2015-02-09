package bean;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

/** 用户信息 */

@Entity
public class User extends BaseBean {
	private String name;// 用户名
	private String password;// 密码
	private String role;// 角色 org、user
	private String realName;// 真实姓名
	private String comment;// 备注
	private String mail;// 电子邮箱
	private String permitType; // 权限类型（查看、修改、删除）待实现

	@ManyToOne
	@LazyCollection(LazyCollectionOption.FALSE)
	@JoinColumn(name = "organization_id")
	private Organization organization;

	@ManyToMany(mappedBy = "users")
	@LazyCollection(LazyCollectionOption.FALSE)
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN, CascadeType.ALL })
	private Set<Project> projects = new HashSet<Project>();

	// cascade new
	@OneToMany(mappedBy = "user")
	@LazyCollection(LazyCollectionOption.FALSE)
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN, CascadeType.ALL })
	private Set<UserPermit> userpermits = new HashSet<UserPermit>();

	public Set<UserPermit> getUserpermits() {
		return userpermits;
	}

	public void setUserpermits(Set<UserPermit> userpermits) {
		this.userpermits = userpermits;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getPermitType() {
		return permitType;
	}

	public void setPermitType(String permitType) {
		this.permitType = permitType;
	}

	public Organization getOrganization() {
		return organization;
	}

	public void setOrganization(Organization organization) {
		this.organization = organization;
	}

	public Set<Project> getProjects() {
		return projects;
	}

	public void setProjects(Set<Project> projects) {
		this.projects = projects;
	}

}