package bean;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/** ������������ */

@Entity
public class QualityFactor extends BaseBean {
	private String description;// ���
	private Integer value;// ֵ
	private String type;// admin,org,user
	@ManyToOne
	@JoinColumn(name = "organization_id")
	private Organization organization;
	@ManyToOne
	@JoinColumn(name = "setAdjust_id")
	private SetAdjust setAdjust;

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getValue() {
		return value;
	}

	public void setValue(Integer value) {
		this.value = value;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Organization getOrganization() {
		return organization;
	}

	public void setOrganization(Organization organization) {
		this.organization = organization;
	}

	public SetAdjust getSetAdjust() {
		return setAdjust;
	}

	public void setSetAdjust(SetAdjust setAdjust) {
		this.setAdjust = setAdjust;
	}

}