package bean;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

/** ¼ÇÂ¼ÔªËØ */

@Entity
public class Ret extends BaseBean {
	private String name;// Ãû³Æ
	private String description;// ÃèÊö
	@ManyToOne
	@LazyCollection(LazyCollectionOption.FALSE)
	@JoinColumn(name = "dataFunction_id")
	private DataFunction dataFunction;
	private Integer det;

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

	public DataFunction getDataFunction() {
		return dataFunction;
	}

	public void setDataFunction(DataFunction dataFunction) {
		this.dataFunction = dataFunction;
	}

	public Integer getDet() {
		return det;
	}

	public void setDet(Integer det) {
		this.det = det;
	}

}