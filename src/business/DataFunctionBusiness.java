package business;

import java.util.List;

import bean.CountSession;
import bean.DataFunction;
import bean.FunctionModule;
import bean.Ret;
import dao.BaseDAO;

public class DataFunctionBusiness {

	private BaseDAO<DataFunction> dao = new BaseDAO<DataFunction>();

	public void create(DataFunction p) {
		p.setUfpc(calUfpc(p));// 设置对应功能模块的功能点数
		dao.create(p);
	}

	/* 计算对应模块的功能点数 */
	public Double calUfpc(DataFunction p) {
		// p=dao.find(DataFunction.class, p.getId());
		double ufpc = 0;
		if (p.getIsCounted().equals("计入")) {
			ufpc = 1;
		}
		if (p.getIsCounted().equals("未定")) {
			ufpc = 0.5;
		}
		if (p.getIsCounted().equals("不计入")) {
			ufpc = 0;
		}

		if (p.getCountSession() != null && p.getCountSession().getMethodType() != null) {
			if (p.getCountSession().getMethodType().equals("预估型功能点计数")) {
				if (p.getType().equals("EIF")) {
					ufpc *= 15;
				}
				if (p.getType().equals("ILF")) {
					ufpc *= 35;
				}
			}
			if (p.getCountSession().getMethodType().equals("估计型功能点计数")) {
				if (p.getType().equals("EIF")) {
					ufpc *= 5;
				}
				if (p.getType().equals("ILF")) {
					ufpc *= 7;
				}
			}
			if (p.getCountSession().getMethodType().equals("详细型功能点计数")) {
				double num_ret = 0;
				double num_det = 0;
				List<Ret> rets = p.getRets();

				if (rets != null && rets.size() > 0) {
					num_ret = rets.size();
					for (Ret r : rets) {
						num_det += r.getDet();
					}
					String type = "";
					if (num_ret == 1 && num_det <= 50 && num_det >= 1) {
						type = "L";
					} else if (num_ret == 1 && num_det >= 51) {
						type = "A";
					} else if (num_ret >= 2 && num_ret <= 5 && num_det >= 1 && num_det <= 19) {
						type = "L";
					} else if (num_ret >= 2 && num_ret <= 5 && num_det >= 20 && num_det <= 50) {
						type = "A";
					} else if (num_ret >= 2 && num_ret <= 5 && num_det >= 51) {
						type = "H";
					} else if (num_ret >= 6 && num_det >= 1 && num_det <= 19) {
						type = "A";
					} else if (num_ret >= 6 && num_det >= 20) {
						type = "H";
					}
					if (type.equals("L")) {
						if (p.getType().equals("EIF"))
							ufpc *= 5;
						else if (p.getType().equals("ILF"))
							ufpc *= 7;
					}
					if (type.equals("A")) {
						if (p.getType().equals("EIF"))
							ufpc *= 7;
						else if (p.getType().equals("ILF"))
							ufpc *= 10;
					}
					if (type.equals("H")) {
						if (p.getType().equals("EIF"))
							ufpc *= 10;
						else if (p.getType().equals("ILF"))
							ufpc *= 15;
					}
				} else
					ufpc = 0;
			}
		}
		return ufpc;
	}

	// p only need to have an id
	public DataFunction find(DataFunction p) {
		return dao.find(DataFunction.class, p.getId());
	}

	/*
	 * whenever change jsp page, this method should be changed
	 */
	public void update(DataFunction b) {
		DataFunction d = dao.find(DataFunction.class, b.getId());
		d.setDescription(b.getDescription());
		d.setName(b.getName());
		d.setType(b.getType());
		d.setIsCounted(b.getIsCounted());
		d.setIgnoreReason(b.getIgnoreReason());
		d.setFitType(b.getFitType());
		d.setMethodType(b.getMethodType());
		d.setUfpc(calUfpc(d));
		dao.update(d);
	}

	// p only need to have an id
	public void delete(DataFunction p) {
		dao.delete(dao.find(DataFunction.class, p.getId()));
	}

	/*
	 * 选择数据功能，满足他们属于同一个估算场景,同一个模块
	 */
	public List<DataFunction> listAllByCountSessionFunctionModule(CountSession countSession, FunctionModule functionModule) {
		return dao.list("select c from DataFunction c where c.countSession.id=" + countSession.getId() + " and c.functionModule.id="
				+ functionModule.getId());
	}

	/*
	 * 选择所有数据功能，满足他们属于同一个估算场景
	 */
	public List<DataFunction> getAllByCountSession(CountSession countSession) {
		return dao.list("select c from DataFunction c where c.countSession.id=" + countSession.getId());
	}

	public List<DataFunction> getDataFunctionByCountSessionFunctionModule(CountSession countSession, FunctionModule fm) {
		return dao.list("select c from DataFunction c where c.countSession.id=" + countSession.getId() + " and c.functionModule.id="
				+ fm.getId());
	}

	/* 获取未调整功能点数 */
	public double getUfpc(CountSession countSession, FunctionModule fm) {
		double ufpc = 0;
		for (DataFunction df : getDataFunctionByCountSessionFunctionModule(countSession, fm)) {
			ufpc += df.getUfpc();
		}
		return ufpc;
	}

	/* 获取调整后功能点数 */
	public double getUfpcFit(CountSession countSession, FunctionModule fm) {
		double ufpc = 0;
		for (DataFunction df : getDataFunctionByCountSessionFunctionModule(countSession, fm)) {
			if (df.getIsCounted().equals("不计入"))
				continue;
			if (countSession.getMethodType().equals("预估型功能点计数")) {
				if (df.getType().equals("EIF")) {
					if (df.getType().equals("高"))
						ufpc += 5;
					else if (df.getType().equals("中"))
						ufpc += 10;
					else
						ufpc += 15;
				} else if (df.getType().equals("ILF")) {
					if (df.getType().equals("高"))
						ufpc += 35 / 3;
					else if (df.getType().equals("中"))
						ufpc += 70 / 3;
					else
						ufpc += 35;
				} else {
					if (df.getType().equals("高"))
						ufpc += 17.5 / 3;
					else if (df.getType().equals("中"))
						ufpc += 35 / 3;
					else
						ufpc += 17.5;
				}
				continue;
			}
			if (countSession.getMethodType().equals("估计型功能点计数")) {
				if (df.getType().equals("EIF")) {
					if (df.getType().equals("高"))
						ufpc += 5 / 3;
					else if (df.getType().equals("中"))
						ufpc += 10 / 3;
					else
						ufpc += 5;
				} else if (df.getType().equals("ILF")) {
					if (df.getType().equals("高"))
						ufpc += 7 / 3;
					else if (df.getType().equals("中"))
						ufpc += 14 / 3;
					else
						ufpc += 7;
				} else {
					if (df.getType().equals("高"))
						ufpc += 2;
					else if (df.getType().equals("中"))
						ufpc += 4;
					else
						ufpc += 6;
				}
				continue;
			}
			if (countSession.getMethodType().equals("详细型功能点计数")) {
				double num_ret = 0;
				double num_det = 0;
				List<Ret> rets = df.getRets();
				num_ret = rets.size();
				for (Ret r : rets) {
					num_det += r.getDet();
				}
				String type = "";
				if (num_ret == 1 && num_det <= 50 && num_det >= 1) {
					type = "L";
				}
				if (num_ret >= 2 && num_ret <= 5 && num_det >= 1 && num_det <= 19) {
					type = "L";
				}
				if (num_ret >= 2 && num_ret <= 5 && num_det >= 20 && num_det <= 50) {
					type = "A";
				}
				if (num_ret >= 2 && num_ret <= 5 && num_det >= 51) {
					type = "H";
				}
				if (num_ret >= 6 && num_det >= 1 && num_det <= 19) {
					type = "A";
				}
				if (num_ret >= 6 && num_det >= 20) {
					type = "H";
				}
				if (type.equals("L")) {
					if (df.getType().equals("EIF")) {
						if (df.getType().equals("高"))
							ufpc += 5 / 3;
						else if (df.getType().equals("中"))
							ufpc += 10 / 3;
						else
							ufpc += 5;
					} else if (df.getType().equals("ILF")) {
						if (df.getType().equals("高"))
							ufpc += 7 / 3;
						else if (df.getType().equals("中"))
							ufpc += 14 / 3;
						else
							ufpc += 7;
					} else {
						if (df.getType().equals("高"))
							ufpc += 2;
						else if (df.getType().equals("中"))
							ufpc += 4;
						else
							ufpc += 6;
					}
					continue;
				}
				if (type.equals("A")) {
					if (df.getType().equals("EIF")) {
						if (df.getType().equals("高"))
							ufpc += 7 / 3;
						else if (df.getType().equals("中"))
							ufpc += 14 / 3;
						else
							ufpc += 7;
					} else if (df.getType().equals("ILF")) {
						if (df.getType().equals("高"))
							ufpc += 10 / 3;
						else if (df.getType().equals("中"))
							ufpc += 20 / 3;
						else
							ufpc += 10;
					} else {
						if (df.getType().equals("高"))
							ufpc += 8.5 / 3;
						else if (df.getType().equals("中"))
							ufpc += 17 / 3;
						else
							ufpc += 8.5;
					}
					continue;
				}
				if (type.equals("H")) {
					if (df.getType().equals("EIF")) {
						if (df.getType().equals("高"))
							ufpc += 10 / 3;
						else if (df.getType().equals("中"))
							ufpc += 20 / 3;
						else
							ufpc += 10;
					} else if (df.getType().equals("ILF")) {
						if (df.getType().equals("高"))
							ufpc += 5;
						else if (df.getType().equals("中"))
							ufpc += 10;
						else
							ufpc += 15;
					} else {
						if (df.getType().equals("高"))
							ufpc += 12.5 / 3;
						else if (df.getType().equals("中"))
							ufpc += 25 / 3;
						else
							ufpc += 12.5;
					}
					continue;
				}
			}
		}
		return ufpc;
	}

}
