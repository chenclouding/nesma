package bean;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/** 业务领域调整因子 */

@Entity
public class ApplyAreaFactor extends BaseBean {
	private String description;// 类别描述
	private Double value;// 值
	private String type;// admin,org,user
	@ManyToOne
	@JoinColumn(name = "organization_id")
	private Organization organization;

	public Organization getOrganization() {
		return organization;
	}

	public void setOrganization(Organization organization) {
		this.organization = organization;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Double getValue() {
		return value;
	}

	public void setValue(Double value) {
		this.value = value;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
}