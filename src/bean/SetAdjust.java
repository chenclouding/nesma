package bean;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
public class SetAdjust extends BaseBean {
	@ManyToOne
	@JoinColumn(name = "countSession_id")
	private CountSession countSession;
	@ManyToOne
	@JoinColumn(name = "applyAreaFactor_id")
	private ApplyAreaFactor applyAreaFactor;
	@ManyToOne
	@JoinColumn(name = "appTypeFactor_id")
	private AppTypeFactor appTypeFactor;
	@ManyToOne
	@JoinColumn(name = "devLangFactor_id")
	private DevLangFactor devLangFactor;
	@ManyToOne
	@JoinColumn(name = "teamExperienceFactor_id")
	private TeamExperienceFactor teamExperienceFactor;
	/*
	 * @ManyToOne
	 * 
	 * @JoinColumn(name="adjustParam_id") private AdjustParam adjustParam;
	 */

	@OneToMany(mappedBy = "setAdjust")
	@LazyCollection(LazyCollectionOption.FALSE)
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN, CascadeType.ALL })
	private List<AdjustParam> adjustParams = new ArrayList<AdjustParam>();

	// cascade new
	@OneToMany(mappedBy = "setAdjust")
	@LazyCollection(LazyCollectionOption.FALSE)
	@Cascade(value = { CascadeType.SAVE_UPDATE, CascadeType.DELETE_ORPHAN, CascadeType.ALL })
	private List<QualityFactor> qualityFactors = new ArrayList<QualityFactor>();

	private Integer softwareAdjustFactor;// 软件因素调整因子
	private Integer devAdjustFactor;// 开发因素调整因子
	private Integer sizeAdjustFactor;// 规模调整因子

	public CountSession getCountSession() {
		return countSession;
	}

	public void setCountSession(CountSession countSession) {
		this.countSession = countSession;
	}

	public ApplyAreaFactor getApplyAreaFactor() {
		return applyAreaFactor;
	}

	public void setApplyAreaFactor(ApplyAreaFactor applyAreaFactor) {
		this.applyAreaFactor = applyAreaFactor;
	}

	public AppTypeFactor getAppTypeFactor() {
		return appTypeFactor;
	}

	public void setAppTypeFactor(AppTypeFactor appTypeFactor) {
		this.appTypeFactor = appTypeFactor;
	}

	public DevLangFactor getDevLangFactor() {
		return devLangFactor;
	}

	public void setDevLangFactor(DevLangFactor devLangFactor) {
		this.devLangFactor = devLangFactor;
	}

	public TeamExperienceFactor getTeamExperienceFactor() {
		return teamExperienceFactor;
	}

	public void setTeamExperienceFactor(TeamExperienceFactor teamExperienceFactor) {
		this.teamExperienceFactor = teamExperienceFactor;
	}

	public Integer getSoftwareAdjustFactor() {
		return softwareAdjustFactor;
	}

	public void setSoftwareAdjustFactor(Integer softwareAdjustFactor) {
		this.softwareAdjustFactor = softwareAdjustFactor;
	}

	public Integer getDevAdjustFactor() {
		return devAdjustFactor;
	}

	public void setDevAdjustFactor(Integer devAdjustFactor) {
		this.devAdjustFactor = devAdjustFactor;
	}

	public Integer getSizeAdjustFactor() {
		return sizeAdjustFactor;
	}

	public void setSizeAdjustFactor(Integer sizeAdjustFactor) {
		this.sizeAdjustFactor = sizeAdjustFactor;
	}

	public List<QualityFactor> getQualityFactors() {
		return qualityFactors;
	}

	public void setQualityFactors(List<QualityFactor> qualityFactors) {
		this.qualityFactors = qualityFactors;
	}

	public List<AdjustParam> getAdjustParams() {
		return adjustParams;
	}

	public void setAdjustParams(List<AdjustParam> adjustParams) {
		this.adjustParams = adjustParams;
	}

}