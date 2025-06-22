package com.huizu.project.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.huizu.common.annotation.Excel;
import com.huizu.common.core.domain.BaseEntity;

/**
 * 评价;对象 tb_customer_appraise
 *
 * @author huizu
 * @date 2024-08-12
 */
public class TbCustomerAppraise extends BaseEntity{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 评论人id */
    @Excel(name = "评论人id")
    private Integer customerId;
    private String customerName;

    /** 被评论人id */
    @Excel(name = "被评论人id")
    private Integer subId;
    private String subName;

    /** 星级 */
    @Excel(name = "星级")
    private String level;

    /** 内容 */
    @Excel(name = "内容")
    private String content;

    /** 状态（0停用 1启用） */
    @Excel(name = "状态")
    private String status;

    /** 删除标记（0正常，1删除） */
    private String delFlag;

    /** 备用1 */
    private String standby1;

    /** 备用2 */
    private String standby2;

    /** 备用3 */
    private String standby3;

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getSubName() {
        return subName;
    }

    public void setSubName(String subName) {
        this.subName = subName;
    }

    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }

    public Integer getCustomerId() {
        return customerId;
    }
    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public Integer getSubId() {
        return subId;
    }
    public void setSubId(Integer subId) {
        this.subId = subId;
    }

    public String getLevel() {
        return level;
    }
    public void setLevel(String level) {
        this.level = level;
    }

    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
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


    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("customerId", getCustomerId())
            .append("subId", getSubId())
            .append("level", getLevel())
            .append("content", getContent())
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
            .toString();
    }
}
