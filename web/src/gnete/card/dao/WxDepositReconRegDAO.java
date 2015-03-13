package gnete.card.dao;

import java.util.List;
import java.util.Map;

import flink.util.Paginater;
import gnete.card.entity.WxDepositReconReg;

public interface WxDepositReconRegDAO extends BaseDAO {

	Paginater findPage(Map<String, Object> params, int pageNumber, int pageSize);

	List<WxDepositReconReg> findList(Map<String, Object> params);
}