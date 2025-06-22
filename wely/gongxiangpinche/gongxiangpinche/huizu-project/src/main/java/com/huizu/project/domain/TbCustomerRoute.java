package com.huizu.project.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.huizu.common.annotation.Excel;
import com.huizu.common.core.domain.BaseEntity;

/**
 * 行程管理;对象 tb_customer_route
 *
 * @author huizu
 * @date 2024-08-12
 */
public class TbCustomerRoute extends BaseEntity{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 用户id */
    @Excel(name = "用户id")
    private Integer customerId;
    private String customerName;

    /** 类型（1用户 2司机） */
    @Excel(name = "类型", dictType = "pro_customer_type")
    private String type;

    /** 描述 */
    @Excel(name = "描述")
    private String describe;

    /** 出发时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "出发时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;

    /** 到达时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "到达时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date endTime;

    /** 出发地址 */
    @Excel(name = "出发地址")
    private String startAddress;

    /** 目的地址 */
    @Excel(name = "目的地址")
    private String endAddress;

    /** 出发地经纬度 */
    @Excel(name = "出发地经纬度")
    private String startLonLat;

    /** 目的地经纬度 */
    @Excel(name = "目的地经纬度")
    private String endLonLat;

    /** 车型号 */
    @Excel(name = "车型号")
    private String model;

    /** 车牌号 */
    @Excel(name = "车牌号")
    private String number;

    /** 单价 */
    @Excel(name = "单价")
    private BigDecimal price;

    /** 可乘坐数量 */
    @Excel(name = "可乘坐数量")
    private Integer total;

    /** 已乘坐数量 */
    @Excel(name = "已乘坐数量")
    private Integer alreadyTotal;

    /** 事前注意事项 */
    @Excel(name = "事前注意事项")
    private String attention;

    /** 评论 */
    @Excel(name = "评论")
    private String comment;

    /** 访问人数 */
    @Excel(name = "访问人数")
    private Integer viewTotal;

    /** 行程状态（） */
    @Excel(name = "行程状态")
    private String state;
    private String week;

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


    public String getWeek() {
        return week;
    }

    public void setWeek(String week) {
        this.week = week;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
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

    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
    }

    public String getDescribe() {
        return describe;
    }
    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public Date getStartTime() {
        return startTime;
    }
    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }
    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public String getStartAddress() {
        return startAddress;
    }
    public void setStartAddress(String startAddress) {
        this.startAddress = startAddress;
    }

    public String getEndAddress() {
        return endAddress;
    }
    public void setEndAddress(String endAddress) {
        this.endAddress = endAddress;
    }

    public String getStartLonLat() {
        return startLonLat;
    }
    public void setStartLonLat(String startLonLat) {
        this.startLonLat = startLonLat;
    }

    public String getEndLonLat() {
        return endLonLat;
    }
    public void setEndLonLat(String endLonLat) {
        this.endLonLat = endLonLat;
    }

    public String getModel() {
        return model;
    }
    public void setModel(String model) {
        this.model = model;
    }

    public String getNumber() {
        return number;
    }
    public void setNumber(String number) {
        this.number = number;
    }

    public BigDecimal getPrice() {
        return price;
    }
    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getTotal() {
        return total;
    }
    public void setTotal(Integer total) {
        this.total = total;
    }

    public Integer getAlreadyTotal() {
        return alreadyTotal;
    }
    public void setAlreadyTotal(Integer alreadyTotal) {
        this.alreadyTotal = alreadyTotal;
    }

    public String getAttention() {
        return attention;
    }
    public void setAttention(String attention) {
        this.attention = attention;
    }

    public String getComment() {
        return comment;
    }
    public void setComment(String comment) {
        this.comment = comment;
    }

    public Integer getViewTotal() {
        return viewTotal;
    }
    public void setViewTotal(Integer viewTotal) {
        this.viewTotal = viewTotal;
    }

    public String getState() {
        return state;
    }
    public void setState(String state) {
        this.state = state;
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
            .append("type", getType())
            .append("describe", getDescribe())
            .append("startTime", getStartTime())
            .append("endTime", getEndTime())
            .append("startAddress", getStartAddress())
            .append("endAddress", getEndAddress())
            .append("startLonLat", getStartLonLat())
            .append("endLonLat", getEndLonLat())
            .append("model", getModel())
            .append("number", getNumber())
            .append("price", getPrice())
            .append("total", getTotal())
            .append("alreadyTotal", getAlreadyTotal())
            .append("attention", getAttention())
            .append("comment", getComment())
            .append("viewTotal", getViewTotal())
            .append("state", getState())
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
