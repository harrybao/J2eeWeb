package conn;

/**
 * Goods entity. @author MyEclipse Persistence Tools
 */

@SuppressWarnings("serial")
public class Goods implements java.io.Serializable {

	// Fields

	private GoodsId id;

	// Constructors

	/** default constructor */
	public Goods() {
	}

	/** full constructor */
	public Goods(GoodsId id) {
		this.id = id;
	}

	// Property accessors

	public GoodsId getId() {
		return this.id;
	}

	public void setId(GoodsId id) {
		this.id = id;
	}

}