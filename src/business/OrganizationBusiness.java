package business;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import dao.BaseDAO;

import bean.DataFunction;
import bean.Organization;
import bean.Project;
import bean.User;
public class OrganizationBusiness {
	private BaseDAO<Organization> dao=new BaseDAO<Organization>();
	
	public void create(Organization p) {
		dao.create(p);
	}
	//p only need to have an id
	public Organization find(Organization p) {
		return dao.find(Organization.class, p.getId());
	}
	
	public void update(Organization p) {
		Organization d=dao.find(Organization.class, p.getId());
		d.setAddress(p.getAddress());
		d.setCity(p.getCity());
		d.setContact(p.getContact());
		d.setDescription(p.getDescription());
		d.setFax(p.getFax());
		d.setMail(p.getMail());
		d.setName(p.getName());
		d.setNation(p.getNation());
		d.setPhone(p.getPhone());
		d.setPostcode(p.getPostcode());
		d.setProvince(p.getProvince());
		d.setType(p.getType());		
		dao.update(d);
	}
	//p only need to have an id
	public void delete(Organization p) {
		dao.delete(dao.find(Organization.class, p.getId()));
	}
	/*
	 * 获得所有的组织
	 */
	public List<Organization> getAllOrganization(){
		return dao.list("from Organization");
	}
	public Organization getOrgById(int orgId){
		return dao.find(Organization.class, orgId);
	}
	
	//获取该组织的管理员
//	public NesmaUser getOrgAdmin(int orgId){
//		NesmaOrganization org = getOrgById(orgId);
//		Set userSet = org.getNesmaUsers();
//		NesmaUser user = null;
//		if (userSet != null && userSet.size() != 0){
//			List userList = new ArrayList(userSet);
//			for (int i = 0; i < userList.size(); i ++){
//				user = (NesmaUser) userList.get(i);
//				if(user.getUserRole() == 1) break;
//			}
//		}
//		return user;
//	}
	//获取该组织包含的所有项目
	public List<Project> getProjectByOrgId(int orgId){
		BaseDAO<Project> daoProject=new BaseDAO<Project>();
		List<Project> projects=daoProject.list("select c from Project c where c.organization.id="+orgId);
		return projects;/*
		NesmaOrganization org = getOrgById(orgId);
		DataOperationBusiness dob = new DataOperationBusiness();
		List userList = new ArrayList(org.getNesmaUsers());
		dob.getUserListInOrder(userList);
		List list = new ArrayList();
		for (int i = 0; i < userList.size(); i ++){
			NesmaUser user = (NesmaUser) userList.get(i);
			Set projectSet = user.getNesmaProjects();			
			if(projectSet != null && projectSet.isEmpty() == false){
				List projectList = new ArrayList(projectSet);
				dob.getProjectListInOrder(projectList);
				list.addAll(projectList);
			}
		}		
		return list;*/
	}
	
	//获取该组织内所有项目（除去该用户拥有的项目）
	public List<Project> getOtherProjectByUserId(int orgId,int userId){
		BaseDAO<Project> daoProject=new BaseDAO<Project>();
		List<Project> projects=daoProject.list("select c from Project c where c.organization.id="+orgId);
		for(int i=0;i<projects.size();i++){
			Project p=projects.get(i);
			for(User u:p.getUsers()){
				if(u.getId()==userId){
					projects.remove(i);
					break;
				}
					
			}
		}
		return projects;
		/*
		int i;
		
		NesmaOrganization org = getOrgById(orgId);
		DataOperationBusiness dob = new DataOperationBusiness();
		List userList = new ArrayList(org.getNesmaUsers());
		//将当前用户从userlist中剔除
		for (i = 0; i < userList.size(); i ++){
			NesmaUser checkUser = (NesmaUser) userList.get(i);
			if(checkUser.getUserId() == userId){
				userList.remove(i);
				break;
			}
		}
		dob.getUserListInOrder(userList);
		List list = new ArrayList();
		for ( i = 0; i < userList.size(); i ++){
			NesmaUser user = (NesmaUser) userList.get(i);
			Set projectSet = user.getNesmaProjects();			
			if(projectSet != null && projectSet.isEmpty() == false){
				List projectList = new ArrayList(projectSet);
				dob.getProjectListInOrder(projectList);
				list.addAll(projectList);
			}
		}		
		return list;*/
	}
	
	
	public static void main(String[] args){
		OrganizationBusiness ob = new OrganizationBusiness();
		System.out.println(ob.getOtherProjectByUserId(1, 1).size());
	}
	

}
