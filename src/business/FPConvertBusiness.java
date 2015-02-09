package business;

public class FPConvertBusiness {
	/* 功能点转换， IFPUG功能点个数 = - 4.10 + 0.726 ×预估功能点个数 */
	public Double convertToIfpugBusiness(Double fpc) {
		return (-4.10 + 0.726 * fpc);
	}

}
