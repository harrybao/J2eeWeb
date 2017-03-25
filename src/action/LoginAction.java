package action;
import org.springframework.context.*;
import org.springframework.context.support.*;
import conn.*;
import com.opensymphony.xwork2.ActionSupport;


@SuppressWarnings("serial")
public class LoginAction extends ActionSupport {
	private Users u;
	public String execute() {
		try{
			ApplicationContext ctx = new ClassPathXmlApplicationContext("a.xml");
			UsersDAO dao = UsersDAO.getFromApplicationContext(ctx);
			dao.save(u);
		}catch(Exception ex){
			ex.printStackTrace();
			return "error";
		}
		return SUCCESS;
	}
	
	
	
	public Users getU() {
		return u;
	}
	public void setU(Users u) {
		this.u = u;
	}
	
}
