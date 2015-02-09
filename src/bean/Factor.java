package bean;
import javax.persistence.*;
import javax.persistence.Entity;
import org.hibernate.annotations.*;


@Entity
public class Factor extends BaseBean{
	private String name;
	private String subname;
	private Double defaultValue;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubname() {
		return subname;
	}
	public void setSubname(String subname) {
		this.subname = subname;
	}
	public Double getDefaultValue() {
		return defaultValue;
	}
	public void setDefaultValue(Double defaultValue) {
		this.defaultValue = defaultValue;
	}
	
}