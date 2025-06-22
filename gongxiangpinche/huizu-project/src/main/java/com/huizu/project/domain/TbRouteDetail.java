package com.huizu.project.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.huizu.common.annotation.Excel;
import com.huizu.common.core.domain.BaseEntity;

/**
 * 行程资金明细;对象 tb_route_detail
 *
 * @author huizu
 * @date 2024-08-12
 */
public class TbRouteDetail extends BaseEntity{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 行程id */
    @Excel(name = "行程id")
    private Integer routeId;

    /** 同乘人数 */
    @Excel(name = "同乘人数")
    private String total;

    /** 价格 */
    @Excel(name = "价格")
    private String price;

    /** 状态（0停用 1启用） */
    @Excel(name = "状态", dictType = "sys_open_status")
    private String status;

    /** 删除标记（0正常，1删除） */
    private String delFlag;

    /** 备用1 */
    private String standby1;

    /** 备用2 */
    private String standby2;

    /** 备用3 */
    private String standby3;

    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }

    public Integer getRouteId() {
        return routeId;
    }
    public void setRouteId(Integer routeId) {
        this.routeId = routeId;
    }

    public String getTotal() {
        return total;
    }
    public void setTotal(String total) {
        this.total = total;
    }

    public String getPrice() {
        return price;
    }
    public void setPrice(String price) {
        this.price = price;
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
            .append("routeId", getRouteId())
            .append("total", getTotal())
            .append("price", getPrice())
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
