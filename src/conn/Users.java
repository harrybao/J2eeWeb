package conn;

/**
 * Users entity. @author MyEclipse Persistence Tools
 */

@SuppressWarnings("serial")
public class Users implements java.io.Serializable {

	// Fields

	private String userid;
	private String uspwd;

	// Constructors

	/** default constructor */
	public Users() {
	}

	/** full constructor */
	public Users(String userid, String uspwd) {
		this.userid = userid;
		this.uspwd = uspwd;
	}

	// Property accessors

	public String getUserid() {
		return this.userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUspwd() {
		return this.uspwd;
	}

	public void setUspwd(String uspwd) {
		this.uspwd = uspwd;
	}

}