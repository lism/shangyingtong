package gnete.card.dao.impl;

import java.util.Map;

import org.springframework.stereotype.Repository;

import flink.util.Paginater;
import gnete.card.dao.ExternalCardImportRegDAO;

@Repository
public class ExternalCardImportRegDAOImpl extends BaseDAOIbatisImpl implements ExternalCardImportRegDAO {

    public String getNamespace() {
        return "ExternalCardImportReg";
    }
    
    public Paginater findPage(Map<String, Object> params, int pageNumber,
    		int pageSize) {
    	return this.queryForPage("findPage", params, pageNumber, pageSize);
    }
}