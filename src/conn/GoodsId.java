package conn;

/**
 * GoodsId entity. @author MyEclipse Persistence Tools
 */

@SuppressWarnings("serial")
public class GoodsId implements java.io.Serializable {

	// Fields

	private String wreaid;
	private String wname;
	private Integer wprice;
	private Integer wstock;

	// Constructors

	/** default constructor */
	public GoodsId() {
	}

	/** minimal constructor */
	public GoodsId(String wreaid) {
		this.wreaid = wreaid;
	}

	/** full constructor */
	public GoodsId(String wreaid, String wname, Integer wprice, Integer wstock) {
		this.wreaid = wreaid;
		this.wname = wname;
		this.wprice = wprice;
		this.wstock = wstock;
	}

	// Property accessors

	public String getWreaid() {
		return this.wreaid;
	}

	public void setWreaid(String wreaid) {
		this.wreaid = wreaid;
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

	public Integer getWstock() {
		return this.wstock;
	}

	public void setWstock(Integer wstock) {
		this.wstock = wstock;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof GoodsId))
			return false;
		GoodsId castOther = (GoodsId) other;

		return ((this.getWreaid() == castOther.getWreaid()) || (this
				.getWreaid() != null && castOther.getWreaid() != null && this
				.getWreaid().equals(castOther.getWreaid())))
				&& ((this.getWname() == castOther.getWname()) || (this
						.getWname() != null && castOther.getWname() != null && this
						.getWname().equals(castOther.getWname())))
				&& ((this.getWprice() == castOther.getWprice()) || (this
						.getWprice() != null && castOther.getWprice() != null && this
						.getWprice().equals(castOther.getWprice())))
				&& ((this.getWstock() == castOther.getWstock()) || (this
						.getWstock() != null && castOther.getWstock() != null && this
						.getWstock().equals(castOther.getWstock())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getWreaid() == null ? 0 : this.getWreaid().hashCode());
		result = 37 * result
				+ (getWname() == null ? 0 : this.getWname().hashCode());
		result = 37 * result
				+ (getWprice() == null ? 0 : this.getWprice().hashCode());
		result = 37 * result
				+ (getWstock() == null ? 0 : this.getWstock().hashCode());
		return result;
	}

}