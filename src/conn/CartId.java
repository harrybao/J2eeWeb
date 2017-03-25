package conn;

/**
 * CartId entity. @author MyEclipse Persistence Tools
 */

@SuppressWarnings("serial")
public class CartId implements java.io.Serializable {

	// Fields

	private Integer wid;
	private String wname;
	private Integer wprice;

	// Constructors

	/** default constructor */
	public CartId() {
	}

	/** minimal constructor */
	public CartId(Integer wid) {
		this.wid = wid;
	}

	/** full constructor */
	public CartId(Integer wid, String wname, Integer wprice) {
		this.wid = wid;
		this.wname = wname;
		this.wprice = wprice;
	}

	// Property accessors

	public Integer getWid() {
		return this.wid;
	}

	public void setWid(Integer wid) {
		this.wid = wid;
	}

	public String getWname() {
		return this.wname;
	}

	public void setWname(String wname) {
		this.wname = wname;
	}

	public Integer getWprice() {
		return this.wprice;
	}

	public void setWprice(Integer wprice) {
		this.wprice = wprice;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof CartId))
			return false;
		CartId castOther = (CartId) other;

		return ((this.getWid() == castOther.getWid()) || (this.getWid() != null
				&& castOther.getWid() != null && this.getWid().equals(
				castOther.getWid())))
				&& ((this.getWname() == castOther.getWname()) || (this
						.getWname() != null && castOther.getWname() != null && this
						.getWname().equals(castOther.getWname())))
				&& ((this.getWprice() == castOther.getWprice()) || (this
						.getWprice() != null && castOther.getWprice() != null && this
						.getWprice().equals(castOther.getWprice())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getWid() == null ? 0 : this.getWid().hashCode());
		result = 37 * result
				+ (getWname() == null ? 0 : this.getWname().hashCode());
		result = 37 * result
				+ (getWprice() == null ? 0 : this.getWprice().hashCode());
		return result;
	}

}