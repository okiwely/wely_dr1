package com.huizu.project.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.huizu.common.annotation.Excel;
import com.huizu.common.core.domain.BaseEntity;

/**
 * 信用卡管理对象 pro_customer_card
 *
 * @author huizu
 * @date 2024-09-20
 */
public class ProCustomerCard extends BaseEntity{
    private static final long serialVersionUID = 1L;

    /** 序号 */
    private Integer id;

    /** 用户id */
    @Excel(name = "用户id")
    private Long customerId;

    /** 卡号 */
    @Excel(name = "卡号")
    private String cardNo;

    /** 安全码 */
    @Excel(name = "安全码")
    private String securityCode;

    /** 日期 */
    @Excel(name = "日期")
    private String expire;

    /** 是否默认 */
    @Excel(name = "是否默认", dictType = "yes_no")
    private String isDefault;

    /** 卡名 */
    @Excel(name = "卡名")
    private String name;

    /** 启用状态（0.停用，1.启用） */
    @Excel(name = "启用状态")
    private String status;

    /** 删除标记（0.正常，1.删除） */
    private String delFlag;

    /** 备用1 */
    private String standby1;

    /** 备用2 */
    private String standby2;

    /** 备用3 */
    private String standby3;

    /** 备用4 */
    private String standby4;

    /** 备用5 */
    private String standby5;

    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }

    public Long getCustomerId() {
        return customerId;
    }
    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }

    public String getCardNo() {
        return cardNo;
    }
    public void setCardNo(String cardNo) {
        this.cardNo = cardNo;
    }

    public String getSecurityCode() {
        return securityCode;
    }
    public void setSecurityCode(String securityCode) {
        this.securityCode = securityCode;
    }

    public String getExpire() {
        return expire;
    }
    public void setExpire(String expire) {
        this.expire = expire;
    }

    public String getIsDefault() {
        return isDefault;
    }
    public void setIsDefault(String isDefault) {
        this.isDefault = isDefault;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }

    public String getDelFlag() {
        return delFlag;
    }
    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag;
    }

    public String getStandby1() {
        return standby1;
    }
    public void setStandby1(String standby1) {
        this.standby1 = standby1;
    }

    public String getStandby2() {
        return standby2;
    }
    public void setStandby2(String standby2) {
        this.standby2 = standby2;
    }

    public String getStandby3() {
        return standby3;
    }
    public void setStandby3(String standby3) {
        this.standby3 = standby3;
    }

    public String getStandby4() {
        return standby4;
    }
    public void setStandby4(String standby4) {
        this.standby4 = standby4;
    }

    public String getStandby5() {
        return standby5;
    }
    public void setStandby5(String standby5) {
        this.standby5 = standby5;
    }


    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("customerId", getCustomerId())
            .append("cardNo", getCardNo())
            .append("securityCode", getSecurityCode())
            .append("expire", getExpire())
            .append("isDefault", getIsDefault())
            .append("name", getName())
            .append("status", getStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .append("delFlag", getDelFlag())
            .append("standby1", getStandby1())
            .append("standby2", getStandby2())
            .append("standby3", getStandby3())
            .append("standby4", getStandby4())
            .append("standby5", getStandby5())
            .toString();
    }
}
