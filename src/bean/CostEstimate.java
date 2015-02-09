package bean;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

/** ����������� */

@Entity
public class CostEstimate extends BaseBean {
	private Double effortOptimistic;// ����������ֵ
	private Double effortStandard;// ��������׼ֵ
	private Double effortPessimistic;// ����������ֵ
	private Double budgetOptimistic;// �ɱ�����ֵ
	private Double budgetStandard;// �ɱ���׼ֵ
	private Double budgetPessimistic;// �ɱ�����ֵ
	private Double durationOptimistic;// ��������ֵ
	private Double durationStandard;// ���ڱ�׼ֵ
	private Double durantionPessimistic;// ��������ֵ
	@ManyToOne
	@LazyCollection(LazyCollectionOption.FALSE)
	@JoinColumn(name = "countSession_id")
	private CountSession countSession;

	public Double getEffortOptimistic() {
		return effortOptimistic;
	}

	public void setEffortOptimistic(Double effortOptimistic) {
		this.effortOptimistic = effortOptimistic;
	}

	public Double getEffortStandard() {
		return effortStandard;
	}

	public void setEffortStandard(Double effortStandard) {
		this.effortStandard = effortStandard;
	}

	public Double getEffortPessimistic() {
		return effortPessimistic;
	}

	public void setEffortPessimistic(Double effortPessimistic) {
		this.effortPessimistic = effortPessimistic;
	}

	public Double getBudgetOptimistic() {
		return budgetOptimistic;
	}

	public void setBudgetOptimistic(Double budgetOptimistic) {
		this.budgetOptimistic = budgetOptimistic;
	}

	public Double getBudgetStandard() {
		return budgetStandard;
	}

	public void setBudgetStandard(Double budgetStandard) {
		this.budgetStandard = budgetStandard;
	}

	public Double getBudgetPessimistic() {
		return budgetPessimistic;
	}

	public void setBudgetPessimistic(Double budgetPessimistic) {
		this.budgetPessimistic = budgetPessimistic;
	}

	public Double getDurationOptimistic() {
		return durationOptimistic;
	}

	public void setDurationOptimistic(Double durationOptimistic) {
		this.durationOptimistic = durationOptimistic;
	}

	public Double getDurationStandard() {
		return durationStandard;
	}

	public void setDurationStandard(Double durationStandard) {
		this.durationStandard = durationStandard;
	}

	public Double getDurantionPessimistic() {
		return durantionPessimistic;
	}

	public void setDurantionPessimistic(Double durantionPessimistic) {
		this.durantionPessimistic = durantionPessimistic;
	}

	public CountSession getCountSession() {
		return countSession;
	}

	public void setCountSession(CountSession countSession) {
		this.countSession = countSession;
	}

}