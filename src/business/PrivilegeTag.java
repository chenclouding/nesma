package business;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class PrivilegeTag extends TagSupport {
	private static final long serialVersionUID = -532517444654109642L;

	 private String operateID;  //对应Attribute,加上set方法。

	 public void setOperateID(String operateID) {
		 this.operateID = operateID;
	 }

	 public int doStartTag() throws JspException {
		 int flag = 0;
		 if (operateID.equals("10020")) { //如果允许修改
			 return EVAL_PAGE;  
		 }	
		 if (operateID.equals("10030")) {//如果允许修删除
			 return EVAL_PAGE;  
		 }
		
		 return SKIP_BODY;
	 }
	 
	 public int doEndTag(){
		 if (operateID.equals("10021")) {
			  try {
				pageContext.getOut().write("<td  class = delimg><img src='/nesma/images/warn.png' alt='无权限' width='20'  height='20' border='0'/></td>");
			  } catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			  return EVAL_PAGE;  
		  }
		 if (operateID.equals("10031")) {
			  try {
				pageContext.getOut().write("<td  class = delimg><img src='/nesma/images/warn.png' alt='无权限' width='20'  height='20' border='0'/></td>");
			  } catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			  return EVAL_PAGE;  
		  }
		 return SKIP_BODY;
	 }
}