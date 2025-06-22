package com.huizu.project.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.huizu.common.annotation.Excel;
import com.huizu.common.core.domain.BaseEntity;

/**
 * 汽车管理对象 tb_customer_car
 *
 * @author huizu
 * @date 2024-08-12
 */
public class TbCustomerCar extends BaseEntity{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 用户id */
    @Excel(name = "用户id")
    private Integer customerId;
    private String customerName;

    /** 车辆信息 */
    @Excel(name = "车辆信息")
    private String info;

    /** 汽油型号 */
    @Excel(name = "汽油型号", dictType = "tb_car_gasoline")
    private String gasoline;

    /** 排气量 */
    @Excel(name = "排气量", dictType = "car_cc")
    private String carCc;

    /** 乘坐人数 */
    @Excel(name = "乘坐人数", dictType = "tb_car_total")
    private String total;

    /** ETC */
    @Excel(name = "ETC", dictType = "yes_no")
    private String isEtc;

    /** 制造商 */
    @Excel(name = "制造商")
    private String manufacturer;

    /** 模型 */
    @Excel(name = "模型")
    private String model;

    /** 颜色 */
    @Excel(name = "颜色")
    private String color;

    /** 年代 */
    @Excel(name = "年代")
    private String decade;

    /** 内饰等级 */
    @Excel(name = "内饰等级")
    private String grade;

    /** 是否有导航仪 */
    @Excel(name = "是否有导航仪", dictType = "yes_no")
    private String isNavigation;

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

    public String getInfo() {
        return info;
    }
    public void setInfo(String info) {
        this.info = info;
    }

    public String getGasoline() {
        return gasoline;
    }
    public void setGasoline(String gasoline) {
        this.gasoline = gasoline;
    }

    public String getCarCc() {
        return carCc;
    }
    public void setCarCc(String carCc) {
        this.carCc = carCc;
    }

    public String getTotal() {
        return total;
    }
    public void setTotal(String total) {
        this.total = total;
    }

    public String getIsEtc() {
        return isEtc;
    }
    public void setIsEtc(String isEtc) {
        this.isEtc = isEtc;
    }

    public String getManufacturer() {
        return manufacturer;
    }
    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public String getModel() {
        return model;
    }
    public void setModel(String model) {
        this.model = model;
    }

    public String getColor() {
        return color;
    }
    public void setColor(String color) {
        this.color = color;
    }

    public String getDecade() {
        return decade;
    }
    public void setDecade(String decade) {
        this.decade = decade;
    }

    public String getGrade() {
        return grade;
    }
    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getIsNavigation() {
        return isNavigation;
    }
    public void setIsNavigation(String isNavigation) {
        this.isNavigation = isNavigation;
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
            .append("info", getInfo())
            .append("gasoline", getGasoline())
            .append("carCc", getCarCc())
            .append("total", getTotal())
            .append("isEtc", getIsEtc())
            .append("manufacturer", getManufacturer())
            .append("model", getModel())
            .append("color", getColor())
            .append("decade", getDecade())
            .append("grade", getGrade())
            .append("isNavigation", getIsNavigation())
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
