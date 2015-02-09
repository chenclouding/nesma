package bean;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/** �������� */
@Entity
public class AdjustParam extends BaseBean {
	private Double sizeChangedFactor;// ��ģ�������
	private Double fpCostPessimistic;// ���ܵ��ʱ������
	private Double fpCostStandard;// ���ܵ��ʱ�ʱ�׼
	private Double fpCostOptimistic;// ���ܵ��ʱ������
	private Double pmRate;// ���·���
	private Double grossMargin;// ë������
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