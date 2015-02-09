package bean;
import javax.persistence.*;
import javax.persistence.Entity;
import org.hibernate.annotations.*;


@Entity
public class SessionAdjustFactor extends BaseBean{
	private Double value;
	@ManyToOne
	@LazyCollection(LazyCollectionOption.FALSE)
	@JoinColumn(name="countSession_id")
	private CountSession countSession;
	@ManyToOne
	@LazyCollection(LazyCollectionOption.FALSE)
	@JoinColumn(name="factor_id")
	private Factor factor;
	public Double getValue() {
		return value;
	}
	public void setValue(Double value) {
		this.value = value;
	}
	public CountSession getCountSession() {
		return countSession;
	}
	public void setCountSession(CountSession countSession) {
		this.countSession = countSession;
	}
	public Factor getFactor() {
		return factor;
	}
	public void setFactor(Factor factor) {
		this.factor = factor;
	}
	
}