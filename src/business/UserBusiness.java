package business;

import java.util.List;

import dao.BaseDAO;
import bean.Organization;
import bean.Project;
import bean.User;

public class UserBusiness{
	
	private BaseDAO<User> dao=new BaseDAO<User>();
	
	public void create(User p) {
		dao.create(p);
	}
	//p only need to have an id
	public User find(User p) {
		return dao.find(User.class, p.getId());
	}
	
	//p only need to have an id
	public User getUserById(int userId) {
		return dao.find(User.class, userId);
	}
	
	public void update(User p) {
		User user = dao.find(User.class, p.getId());
		user.setComment(p.getComment());
		user.setMail(p.getMail());
		user.setName(p.getName());
		user.setPassword(p.getPassword());
		user.setRealName(p.getRealName());
		dao.update(user);
	}
	//p only need to have an id
	public void delete(User p) {
		dao.delete(dao.find(User.class, p.getId()));
	}
	/*
	 * 返回除type=org即组织管理员外的本组织所有用户
	 */
	public List<User> getUsersByOrganization(Organization o) {
		return dao.list("select c from User c where c.role<>'org' and c.organization.id="+o.getId());
	}
	/*
	 * 查找满足用户名密码的第一个用户，否则返回空
	 */
	public User findUserByNamePassword(String name, String password) {
		List<User> users=dao.list("select c from User c where c.name='"+name+"' and c.password='"+password+"'");
		if(users==null||users.isEmpty())
			return null;
		else
			return users.get(0);
	}
}
