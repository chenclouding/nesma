package bean;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

/** 软件开发代价 */

@Entity
public class CostEstimate extends BaseBean {
	private Double effortOptimistic;// 工作量上限值
	private Double effortStandard;// 工作量标准值
	private Double effortPessimistic;// 工作量下限值
	private Double budgetOptimistic;// 成本上限值
	private Double budgetStandard;// 成本标准值
	private Double budgetPessimistic;// 成本下限值
	private Double durationOptimistic;// 工期上限值
	private Double durationStandard;// 工期标准值
	private Double durantionPessimistic;// 工期下限值
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