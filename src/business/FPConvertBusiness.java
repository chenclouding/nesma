package business;

public class FPConvertBusiness {
	/* ���ܵ�ת���� IFPUG���ܵ���� = - 4.10 + 0.726 ��Ԥ�����ܵ���� */
	public Double convertToIfpugBusiness(Double fpc) {
		return (-4.10 + 0.726 * fpc);
	}

}
