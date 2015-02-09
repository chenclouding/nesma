package bean;

import javax.persistence.*;

@MappedSuperclass
public class BaseBean {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
		
	@Version
	private Integer version;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getVersion() {
		return version;
	}

	public void setVersion(Integer version) {
		this.version = version;
	}
	
}
