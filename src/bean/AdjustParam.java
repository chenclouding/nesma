package bean;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/** 其他参数 */
@Entity
public class AdjustParam extends BaseBean {
	private Double sizeChangedFactor;// 规模变更因子
	private Double fpCostPessimistic;// 功能点耗时率上限
	private Double fpCostStandard;// 功能点耗时率标准
	private Double fpCostOptimistic;// 功能点耗时率下限
	private Double pmRate;// 人月费率
	private Double grossMargin;// 毛利润率
	private String type;// admin,org,user
	@ManyToOne
	@JoinColumn(name = "organization_id")
	private Organization organization;
	@ManyToOne
	@JoinColumn(name = "setAdjust_id")
	private SetAdjust setAdjust;

	public Double getSizeChangedFactor() {
		return sizeChangedFactor;
	}

	public void setSizeChangedFactor(Double sizeChangedFactor) {
		this.sizeChangedFactor = sizeChangedFactor;
	}

	public Double getFpCostPessimistic() {
		return fpCostPessimistic;
	}

	public void setFpCostPessimistic(Double fpCostPessimistic) {
		this.fpCostPessimistic = fpCostPessimistic;
	}

	public Double getFpCostStandard() {
		return fpCostStandard;
	}

	public void setFpCostStandard(Double fpCostStandard) {
		this.fpCostStandard = fpCostStandard;
	}

	public Double getFpCostOptimistic() {
		return fpCostOptimistic;
	}

	public void setFpCostOptimistic(Double fpCostOptimistic) {
		this.fpCostOptimistic = fpCostOptimistic;
	}

	public Double getPmRate() {
		return pmRate;
	}

	public void setPmRate(Double pmRate) {
		this.pmRate = pmRate;
	}

	public Double getGrossMargin() {
		return grossMargin;
	}

	public void setGrossMargin(Double grossMargin) {
		this.grossMargin = grossMargin;
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