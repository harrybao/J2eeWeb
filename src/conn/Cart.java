package conn;

/**
 * Cart entity. @author MyEclipse Persistence Tools
 */

@SuppressWarnings("serial")
public class Cart implements java.io.Serializable {

	// Fields

	private CartId id;

	// Constructors

	/** default constructor */
	public Cart() {
	}

	/** full constructor */
	public Cart(CartId id) {
		this.id = id;
	}

	// Property accessors

	public CartId getId() {
		return this.id;
	}

	public void setId(CartId id) {
		this.id = id;
	}

}