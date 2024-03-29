package gnete.card.entity;

import gnete.card.entity.type.CostCycleType;
import gnete.card.entity.type.SaleProxyRtnFeeType;

import java.math.BigDecimal;
import java.util.Date;

public class SaleProxyRtn extends SaleProxyRtnKey {
	private String feeType;

	private String costCycle;

	private BigDecimal feeRate;

	private String modifyDate;

	private String updateBy;

	private Date updateTime;

	private String curCode;

	// 新增
	private String branchName;
	private String proxyName;

	private BigDecimal newUlMoney;

	public String getFeeType() {
		return feeType;
	}

	public void setFeeType(String feeType) {
		this.feeType = feeType;
	}

	public String getCostCycle() {
		return costCycle;
	}

	public void setCostCycle(String costCycle) {
		this.costCycle = costCycle;
	}

	public BigDecimal getFeeRate() {
		return feeRate;
	}

	public void setFeeRate(BigDecimal feeRate) {
		this.feeRate = feeRate;
	}

	public String getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getUpdateBy() {
		return updateBy;
	}

	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getBranchName() {
		return branchName;
	}

	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}

	public String getProxyName() {
		return proxyName;
	}

	public void setProxyName(String proxyName) {
		this.proxyName = proxyName;
	}

	public String getCostCycleName() {
		return CostCycleType.valueOf(costCycle).getName();
	}

	public String getCurCode() {
		return curCode;
	}

	public void setCurCode(String curCode) {
		this.curCode = curCode;
	}

	public BigDecimal getNewUlMoney() {
		return newUlMoney;
	}

	public void setNewUlMoney(BigDecimal newUlMoney) {
		this.newUlMoney = newUlMoney;
	}

	public String getFeeTypeName() {
		return SaleProxyRtnFeeType.ALL.get(this.feeType) == null ? ""
				: SaleProxyRtnFeeType.valueOf(this.feeType).getName();
	}
}