package business;

import java.util.ArrayList;
import java.util.List;

import dao.BaseDAO;
import bean.FunctionModule;
import bean.Project;

public class FunctionModuleBusiness{
	
	private BaseDAO<FunctionModule> dao=new BaseDAO<FunctionModule>();
	
	public void create(FunctionModule p) {
		dao.create(p);
	}
	//p only need to have an id
	public FunctionModule find(FunctionModule p) {
		return dao.find(FunctionModule.class, p.getId());
	}
	
	public void update(FunctionModule p) {
		FunctionModule fm = dao.find(FunctionModule.class, p.getId());
		fm.setDescription(p.getDescription());
		fm.setDevLang(p.getDevLang());
		fm.setDevType(p.getDevType());
		fm.setName(p.getName());
		fm.setType(p.getType());
		dao.update(fm);
	}
	//p only need to have an id
	public void delete(FunctionModule p) {
		if(p.getChildrenModules()==null||p.getChildrenModules().isEmpty()){
			dao.delete(dao.find(FunctionModule.class, p.getId()));
		}
		else{
			for(FunctionModule fm:p.getChildrenModules()){
				delete(fm);
			}
		}
	}
	public List<FunctionModule> getSubModules(FunctionModule father,
			Project project) {
		if(father==null||father.getId()==null){
			return dao.list("select c from FunctionModule c where c.parentModule=null and c.project.id="+project.getId());
		}
		else{
			return new FunctionModuleBusiness().find(father).getChildrenModules();
		}
	}
	public List<FunctionModule> getAllAtomicFunctionByProject(Project project) {
		return dao.list("select c from FunctionModule c where c.project.id="+project.getId()+" and c.type='т╜всдё©И'");
	}
	public List<FunctionModule> getByProject(Project project) {
		return dao.list("select c from FunctionModule c where c.project.id="+project.getId());
	}
}
