package gnete.card.dao;

import java.util.Map;

import flink.util.Paginater;

public interface CouponRegDAO extends BaseDAO {
	public Paginater findCouponReg(Map<String, Object> params, int pageNumber,
			int pageSize);
}