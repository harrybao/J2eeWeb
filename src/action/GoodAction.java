package action;
import java.util.List;

import org.springframework.context.*;
import org.springframework.context.support.*;

import conn.*;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class GoodAction extends ActionSupport{
	private Users ur;
	@SuppressWarnings("rawtypes")
	public String execute() {
		try{
			ApplicationContext ctx = new ClassPathXmlApplicationContext("a.xml");
			UsersDAO dao = UsersDAO.getFromApplicationContext(ctx);
			List accs = dao.findByQueryString("from Users  where Userid = 'ur.userid' and Uspwd='ur.uspwd'");
			if(accs!=null){
				return "goods";
			}
		}catch(Exception ex){
			ex.printStackTrace();
			return "fail";
		}
		return null;
	}
	public Users getUr() {
		return ur;
	}
	public void setUr(Users ur) {
		this.ur = ur;
	}
}
