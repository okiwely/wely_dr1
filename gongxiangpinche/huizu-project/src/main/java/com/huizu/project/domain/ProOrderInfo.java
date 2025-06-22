package com.huizu.project.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.huizu.common.annotation.Excel;
import com.huizu.common.core.domain.BaseEntity;

/**
 * 订单信息对象 pro_order_info
 *
 * @author huizu
 * @date 2024-08-26
 */
public class ProOrderInfo extends BaseEntity{
    private static final long serialVersionUID = 1L;

    /** 序号 */
    private Integer id;

    /** 用户id */
    @Excel(name = "用户id")
    private Integer customerId;
    private String  customerName;

    /** 司机id */
    @Excel(name = "司机id")
    private Integer driverId;
    private String driverName;

    /** 行程id */
    @Excel(name = "行程id")
    private Integer routeId;

    /** 订单类型（1.商城订单 2.宅配卡订单 3.积分商城 4.加价购 5.砍价订单 6.拼团订单 7.秒杀订单 8.推荐有礼） */
    @Excel(name = "订单类型")
    private String orderType;

    /** 订单编号 */
    @Excel(name = "订单编号")
    private String orderCode;

    /** 总数量 */
    @Excel(name = "总数量")
    private Long totalNum;

    /** 总金额 */
    @Excel(name = "总金额")
    private BigDecimal totalPrice;

    /** 优惠金额 */
    @Excel(name = "优惠金额")
    private BigDecimal discountPrice;

    /** 实付金额 */
    @Excel(name = "实付金额")
    private BigDecimal actualPrice;

    /** 保证金 */
    @Excel(name = "保证金")
    private BigDecimal bondPrice;

    /** 优惠券编号 */
    @Excel(name = "优惠券编号")
    private Integer couponId;

    /** 实付积分 */
    @Excel(name = "实付积分")
    private BigDecimal integral;

    /** 运费 */
    @Excel(name = "运费")
    private BigDecimal freight;

    /** 套餐编号 */
    @Excel(name = "套餐编号")
    private Integer packageId;

    /** 配送时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "配送时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date sendTime;

    /** 配送箱数 */
    @Excel(name = "配送箱数")
    private Integer sendCnt;

    /** 收货人 */
    @Excel(name = "收货人")
    private String people;

    /** 联系电话 */
    @Excel(name = "联系电话")
    private String phone;

    /** 收货地址 */
    @Excel(name = "收货地址")
    private String address;

    /** 支付方式（1.微信支付 2.支付宝支付 3.积分支付 4.微信+积分支付） */
    @Excel(name = "支付方式")
    private String payType;

    /** 支付时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "支付时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date payTime;

    /** 发货人 */
    @Excel(name = "发货人")
    private Long pushPeople;

    /** 订单状态(待支付，已支付，已完成) */
    @Excel(name = "订单状态(待支付，已支付，已完成)")
    private String orderStatus;

    /** 收货方式 */
    @Excel(name = "收货方式")
    private String takeType;

    /** 仓库名称 */
    @Excel(name = "仓库名称")
    private String storehouse;

    /** 出发地 */
    @Excel(name = "出发地")
    private String startAddress;

    /** 目的地 */
    @Excel(name = "目的地")
    private String endAddress;

    /** 出发时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "出发时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;

    /** 到达时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "到达时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date endTime;

    /** 删除标记 */
    private Integer delFlag;

    public String getDriverName() {
        return driverName;
    }

    public void setDriverName(String driverName) {
        this.driverName = driverName;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCustomerId() {
        return customerId;
    }
    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public Integer getDriverId() {
        return driverId;
    }
    public void setDriverId(Integer driverId) {
        this.driverId = driverId;
    }

    public Integer getRouteId() {
        return routeId;
    }
    public void setRouteId(Integer routeId) {
        this.routeId = routeId;
    }

    public String getOrderType() {
        return orderType;
    }
    public void setOrderType(String orderType) {
        this.orderType = orderType;
    }

    public String getOrderCode() {
        return orderCode;
    }
    public void setOrderCode(String orderCode) {
        this.orderCode = orderCode;
    }

    public Long getTotalNum() {
        return totalNum;
    }
    public void setTotalNum(Long totalNum) {
        this.totalNum = totalNum;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }
    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    public BigDecimal getDiscountPrice() {
        return discountPrice;
    }
    public void setDiscountPrice(BigDecimal discountPrice) {
        this.discountPrice = discountPrice;
    }

    public BigDecimal getActualPrice() {
        return actualPrice;
    }
    public void setActualPrice(BigDecimal actualPrice) {
        this.actualPrice = actualPrice;
    }

    public BigDecimal getBondPrice() {
        return bondPrice;
    }
    public void setBondPrice(BigDecimal bondPrice) {
        this.bondPrice = bondPrice;
    }

    public Integer getCouponId() {
        return couponId;
    }
    public void setCouponId(Integer couponId) {
        this.couponId = couponId;
    }

    public BigDecimal getIntegral() {
        return integral;
    }
    public void setIntegral(BigDecimal integral) {
        this.integral = integral;
    }

    public BigDecimal getFreight() {
        return freight;
    }
    public void setFreight(BigDecimal freight) {
        this.freight = freight;
    }

    public Integer getPackageId() {
        return packageId;
    }
    public void setPackageId(Integer packageId) {
        this.packageId = packageId;
    }

    public Date getSendTime() {
        return sendTime;
    }
    public void setSendTime(Date sendTime) {
        this.sendTime = sendTime;
    }

    public Integer getSendCnt() {
        return sendCnt;
    }
    public void setSendCnt(Integer sendCnt) {
        this.sendCnt = sendCnt;
    }

    public String getPeople() {
        return people;
    }
    public void setPeople(String people) {
        this.people = people;
    }

    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }

    public String getPayType() {
        return payType;
    }
    public void setPayType(String payType) {
        this.payType = payType;
    }

    public Date getPayTime() {
        return payTime;
    }
    public void setPayTime(Date payTime) {
        this.payTime = payTime;
    }

    public Long getPushPeople() {
        return pushPeople;
    }
    public void setPushPeople(Long pushPeople) {
        this.pushPeople = pushPeople;
    }

    public String getOrderStatus() {
        return orderStatus;
    }
    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getTakeType() {
        return takeType;
    }
    public void setTakeType(String takeType) {
        this.takeType = takeType;
    }

    public String getStorehouse() {
        return storehouse;
    }
    public void setStorehouse(String storehouse) {
        this.storehouse = storehouse;
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

    public Integer getDelFlag() {
        return delFlag;
    }
    public void setDelFlag(Integer delFlag) {
        this.delFlag = delFlag;
    }


    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("customerId", getCustomerId())
            .append("driverId", getDriverId())
            .append("routeId", getRouteId())
            .append("orderType", getOrderType())
            .append("orderCode", getOrderCode())
            .append("totalNum", getTotalNum())
            .append("totalPrice", getTotalPrice())
            .append("discountPrice", getDiscountPrice())
            .append("actualPrice", getActualPrice())
            .append("bondPrice", getBondPrice())
            .append("couponId", getCouponId())
            .append("integral", getIntegral())
            .append("freight", getFreight())
            .append("packageId", getPackageId())
            .append("sendTime", getSendTime())
            .append("sendCnt", getSendCnt())
            .append("people", getPeople())
            .append("phone", getPhone())
            .append("address", getAddress())
            .append("payType", getPayType())
            .append("payTime", getPayTime())
            .append("pushPeople", getPushPeople())
            .append("orderStatus", getOrderStatus())
            .append("takeType", getTakeType())
            .append("storehouse", getStorehouse())
            .append("startAddress", getStartAddress())
            .append("endAddress", getEndAddress())
            .append("startTime", getStartTime())
            .append("endTime", getEndTime())
            .append("createTime", getCreateTime())
            .append("delFlag", getDelFlag())
            .toString();
    }
}
