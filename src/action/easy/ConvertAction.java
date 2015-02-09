package action.easy;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import bean.CountSession;
import bean.Project;
import business.CountSessionBusiness;
import business.FPConvertBusiness;

import com.opensymphony.xwork2.ActionSupport;

public class ConvertAction extends ActionSupport {
	public CountSession countSession;
	public List<CountSession> countSessions = new ArrayList<CountSession>();
	public Double convertFpc;
	public String convertFpcStr; // ��ʱ�ӵ�
	public List<String> deviation = new ArrayList<String>();

	/* NESMA��indicative����������IFPUG����������ת�� */
	public String convert() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		Integer countSessionId = (Integer) session.getAttribute("countSessionId");
		CountSessionBusiness csb = new CountSessionBusiness();
		countSession = csb.findById(countSessionId);
		Project project = countSession.getProject();
		countSessions = project.getCountSessions();
		FPConvertBusiness fb = new FPConvertBusiness();
		convertFpc = fb.convertToIfpugBusiness(countSession.getUfpc());// ʹ�ù�ʽ����ת��
		NumberFormat nf = NumberFormat.getPercentInstance();
		nf.setMaximumIntegerDigits(2);// С����ǰ������λ
		nf.setMinimumFractionDigits(2);// С���������λ
		Double d;
		java.text.DecimalFormat df = new java.text.DecimalFormat("#0.00");
		convertFpcStr = df.format(convertFpc); // �������յ�ת�������ʽ����Ľ��
		for (int i = 0; i < countSessions.size(); i++) {
			CountSession cs = countSessions.get(i);
			if (cs.getMethodType().equals("��ϸ�͹��ܵ����") && cs.getUfpc() != 0) {
				d = Math.abs(convertFpc - cs.getUfpc()) / cs.getUfpc(); // ����ƫ����
				deviation.add(nf.format(d));
			}
		}
		return SUCCESS;
	}

	public CountSession getCountSession() {
		return countSession;
	}

	public void setCountSession(CountSession countSession) {
		this.countSession = countSession;
	}

	public Double getConvertFpc() {
		return convertFpc;
	}

	public void setConvertFpc(Double convertFpc) {
		this.convertFpc = convertFpc;
	}

	public List<CountSession> getCountSessions() {
		return countSessions;
	}

	public void setCountSessions(List<CountSession> countSessions) {
		this.countSessions = countSessions;
	}

	public List<String> getDeviation() {
		return deviation;
	}

	public void setDeviation(List<String> deviation) {
		this.deviation = deviation;
	}

	public String getConvertFpcStr() {
		return convertFpcStr;
	}

	public void setConvertFpcStr(String convertFpcStr) {
		this.convertFpcStr = convertFpcStr;
	}

}
