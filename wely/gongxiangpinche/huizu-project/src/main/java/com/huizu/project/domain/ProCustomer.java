package com.huizu.project.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.huizu.common.annotation.Excel;
import com.huizu.common.core.domain.BaseEntity;

/**
 * 会员信息对象 pro_customer
 *
 * @author huizu
 * @date 2024-08-12
 */
public class ProCustomer extends BaseEntity{
    private static final long serialVersionUID = 1L;

    /** 序号 */
    private Long id;

    /** 用户类型(1用户，2司机) */
    @Excel(name = "用户类型(1用户，2司机)", dictType = "pro_customer_type")
    private String type;

    /** 头像地址 */
    @Excel(name = "头像地址")
    private String avatar;

    /** 姓名 */
    @Excel(name = "姓名")
    private String name;

    /** 昵称 */
    @Excel(name = "昵称")
    private String nickName;

    /** 极光账号 */
    @Excel(name = "极光账号")
    private String jimName;

    /** 性别（0.男 1.女） */
    @Excel(name = "性别", dictType = "sys_user_sex")
    private String sex;

    /** 年龄 */
    @Excel(name = "年龄")
    private Long age;

    /** 工龄 */
    @Excel(name = "工龄")
    private Integer workingAge;

    /** 身高 */
    @Excel(name = "身高")
    private BigDecimal height;

    /** 体重 */
    @Excel(name = "体重")
    private BigDecimal weight;

    /** 邮箱 */
    @Excel(name = "邮箱")
    private String email;

    /** 银行卡 */
    @Excel(name = "银行卡")
    private String bank;

    /** 身份证号 */
    @Excel(name = "身份证号")
    private String number;

    /** 联系方式 */
    @Excel(name = "联系方式")
    private String phone;

    /** 密码 */
    @Excel(name = "密码")
    private String password;

    /** 评分 */
    @Excel(name = "评分")
    private String score;

    /** 乘车次数 */
    @Excel(name = "乘车次数")
    private String carTotal;

    /** 回复率 */
    @Excel(name = "回复率")
    private String rate;

    /** 最终在线时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "最终在线时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date onLineTime;

    /** 登录日期 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "登录日期", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date loginDate;

    /** 省 */
    @Excel(name = "省")
    private String province;

    /** 省编号 */
    @Excel(name = "省编号")
    private String provinceCode;

    /** 市 */
    @Excel(name = "市")
    private String city;

    /** 市编号 */
    @Excel(name = "市编号")
    private String cityCode;

    /** 区 */
    @Excel(name = "区")
    private String area;

    /** 区编号 */
    @Excel(name = "区编号")
    private String areaCode;

    /** 主要出发地址 */
    @Excel(name = "主要出发地址")
    private String address;

    /** 经纬度 */
    @Excel(name = "经纬度")
    private String lonLat;

    /** 当前位置 */
    @Excel(name = "当前位置")
    private String currentAddress;

    /** 自我介绍 */
    @Excel(name = "自我介绍")
    private String content;

    /** 邀请码 */
    @Excel(name = "邀请码")
    private String code;

    /** 微信openid */
    @Excel(name = "微信openid")
    private String openId;

    /** 分享码 */
    @Excel(name = "分享码")
    private String qrcode;

    /** 上级邀请码 */
    @Excel(name = "上级邀请码")
    private String proCode;

    /** 上级编号 */
    @Excel(name = "上级编号")
    private Long upId;

    /** 余额 */
    @Excel(name = "余额")
    private BigDecimal money;

    /** 积分 */
    @Excel(name = "积分")
    private BigDecimal integral;

    /** 开始日期 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "开始日期", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;

    /** 到期日期 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "到期日期", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date endTime;

    /** 开通状态（0.未开通 1.已开通） */
    @Excel(name = "开通状态")
    private Integer openFlag;

    /** 观看状态（0.不可观看 1.可观看） */
    @Excel(name = "观看状态")
    private Integer watchFlag;

    /** 推流地址 */
    @Excel(name = "推流地址")
    private String pushUrl;

    /** 保证金 */
    @Excel(name = "保证金")
    private Long bond;

    /** 是否支付保证金 */
    @Excel(name = "是否支付保证金", dictType = "yes_no")
    private String bondFlag;

    /** 是否签署合同 */
    @Excel(name = "是否签署合同", dictType = "yes_no")
    private String contractFlag;

    /** 协议 */
    @Excel(name = "协议")
    private String bondFile;

    /** 是否认证 */
    @Excel(name = "是否认证", dictType = "yes_no")
    private String isAuth;

    /** 是否是司机 */
    @Excel(name = "是否是司机", dictType = "yes_no")
    private String isDriver;

    /** 驾照 */
    @Excel(name = "驾照")
    private String drivingLicense;

    /** 汽车保险 */
    @Excel(name = "汽车保险")
    private String insurance;

    /** 车险证 */
    @Excel(name = "车险证")
    private String insuranceCertificate;

    /** 启用状态（0.停用 1.启用） */
    @Excel(name = "启用状态", dictType = "sys_open_status")
    private String status;

    /** 删除标记 */
    private String delFlag;
    private String audit;
    private String numberImage;

    public String getAudit() {
        return audit;
    }

    public void setAudit(String audit) {
        this.audit = audit;
    }

    public String getNumberImage() {
        return numberImage;
    }

    public void setNumberImage(String numberImage) {
        this.numberImage = numberImage;
    }

    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
    }

    public String getAvatar() {
        return avatar;
    }
    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getNickName() {
        return nickName;
    }
    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getJimName() {
        return jimName;
    }
    public void setJimName(String jimName) {
        this.jimName = jimName;
    }

    public String getSex() {
        return sex;
    }
    public void setSex(String sex) {
        this.sex = sex;
    }

    public Long getAge() {
        return age;
    }
    public void setAge(Long age) {
        this.age = age;
    }

    public Integer getWorkingAge() {
        return workingAge;
    }
    public void setWorkingAge(Integer workingAge) {
        this.workingAge = workingAge;
    }

    public BigDecimal getHeight() {
        return height;
    }
    public void setHeight(BigDecimal height) {
        this.height = height;
    }

    public BigDecimal getWeight() {
        return weight;
    }
    public void setWeight(BigDecimal weight) {
        this.weight = weight;
    }

    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    public String getBank() {
        return bank;
    }
    public void setBank(String bank) {
        this.bank = bank;
    }

    public String getNumber() {
        return number;
    }
    public void setNumber(String number) {
        this.number = number;
    }

    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }

    public String getScore() {
        return score;
    }
    public void setScore(String score) {
        this.score = score;
    }

    public String getCarTotal() {
        return carTotal;
    }
    public void setCarTotal(String carTotal) {
        this.carTotal = carTotal;
    }

    public String getRate() {
        return rate;
    }
    public void setRate(String rate) {
        this.rate = rate;
    }

    public Date getOnLineTime() {
        return onLineTime;
    }
    public void setOnLineTime(Date onLineTime) {
        this.onLineTime = onLineTime;
    }

    public Date getLoginDate() {
        return loginDate;
    }
    public void setLoginDate(Date loginDate) {
        this.loginDate = loginDate;
    }

    public String getProvince() {
        return province;
    }
    public void setProvince(String province) {
        this.province = province;
    }

    public String getProvinceCode() {
        return provinceCode;
    }
    public void setProvinceCode(String provinceCode) {
        this.provinceCode = provinceCode;
    }

    public String getCity() {
        return city;
    }
    public void setCity(String city) {
        this.city = city;
    }

    public String getCityCode() {
        return cityCode;
    }
    public void setCityCode(String cityCode) {
        this.cityCode = cityCode;
    }

    public String getArea() {
        return area;
    }
    public void setArea(String area) {
        this.area = area;
    }

    public String getAreaCode() {
        return areaCode;
    }
    public void setAreaCode(String areaCode) {
        this.areaCode = areaCode;
    }

    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }

    public String getLonLat() {
        return lonLat;
    }
    public void setLonLat(String lonLat) {
        this.lonLat = lonLat;
    }

    public String getCurrentAddress() {
        return currentAddress;
    }
    public void setCurrentAddress(String currentAddress) {
        this.currentAddress = currentAddress;
    }

    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }

    public String getCode() {
        return code;
    }
    public void setCode(String code) {
        this.code = code;
    }

    public String getOpenId() {
        return openId;
    }
    public void setOpenId(String openId) {
        this.openId = openId;
    }

    public String getQrcode() {
        return qrcode;
    }
    public void setQrcode(String qrcode) {
        this.qrcode = qrcode;
    }

    public String getProCode() {
        return proCode;
    }
    public void setProCode(String proCode) {
        this.proCode = proCode;
    }

    public Long getUpId() {
        return upId;
    }
    public void setUpId(Long upId) {
        this.upId = upId;
    }

    public BigDecimal getMoney() {
        return money;
    }
    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public BigDecimal getIntegral() {
        return integral;
    }
    public void setIntegral(BigDecimal integral) {
        this.integral = integral;
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

    public Integer getOpenFlag() {
        return openFlag;
    }
    public void setOpenFlag(Integer openFlag) {
        this.openFlag = openFlag;
    }

    public Integer getWatchFlag() {
        return watchFlag;
    }
    public void setWatchFlag(Integer watchFlag) {
        this.watchFlag = watchFlag;
    }

    public String getPushUrl() {
        return pushUrl;
    }
    public void setPushUrl(String pushUrl) {
        this.pushUrl = pushUrl;
    }

    public Long getBond() {
        return bond;
    }
    public void setBond(Long bond) {
        this.bond = bond;
    }

    public String getBondFlag() {
        return bondFlag;
    }
    public void setBondFlag(String bondFlag) {
        this.bondFlag = bondFlag;
    }

    public String getContractFlag() {
        return contractFlag;
    }
    public void setContractFlag(String contractFlag) {
        this.contractFlag = contractFlag;
    }

    public String getBondFile() {
        return bondFile;
    }
    public void setBondFile(String bondFile) {
        this.bondFile = bondFile;
    }

    public String getIsAuth() {
        return isAuth;
    }
    public void setIsAuth(String isAuth) {
        this.isAuth = isAuth;
    }

    public String getIsDriver() {
        return isDriver;
    }
    public void setIsDriver(String isDriver) {
        this.isDriver = isDriver;
    }

    public String getDrivingLicense() {
        return drivingLicense;
    }
    public void setDrivingLicense(String drivingLicense) {
        this.drivingLicense = drivingLicense;
    }

    public String getInsurance() {
        return insurance;
    }
    public void setInsurance(String insurance) {
        this.insurance = insurance;
    }

    public String getInsuranceCertificate() {
        return insuranceCertificate;
    }
    public void setInsuranceCertificate(String insuranceCertificate) {
        this.insuranceCertificate = insuranceCertificate;
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


    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("type", getType())
            .append("avatar", getAvatar())
            .append("name", getName())
            .append("nickName", getNickName())
            .append("jimName", getJimName())
            .append("sex", getSex())
            .append("age", getAge())
            .append("workingAge", getWorkingAge())
            .append("height", getHeight())
            .append("weight", getWeight())
            .append("email", getEmail())
            .append("bank", getBank())
            .append("number", getNumber())
            .append("phone", getPhone())
            .append("password", getPassword())
            .append("score", getScore())
            .append("carTotal", getCarTotal())
            .append("rate", getRate())
            .append("onLineTime", getOnLineTime())
            .append("loginDate", getLoginDate())
            .append("province", getProvince())
            .append("provinceCode", getProvinceCode())
            .append("city", getCity())
            .append("cityCode", getCityCode())
            .append("area", getArea())
            .append("areaCode", getAreaCode())
            .append("address", getAddress())
            .append("lonLat", getLonLat())
            .append("currentAddress", getCurrentAddress())
            .append("content", getContent())
            .append("code", getCode())
            .append("openId", getOpenId())
            .append("qrcode", getQrcode())
            .append("proCode", getProCode())
            .append("upId", getUpId())
            .append("money", getMoney())
            .append("integral", getIntegral())
            .append("startTime", getStartTime())
            .append("endTime", getEndTime())
            .append("openFlag", getOpenFlag())
            .append("watchFlag", getWatchFlag())
            .append("pushUrl", getPushUrl())
            .append("bond", getBond())
            .append("bondFlag", getBondFlag())
            .append("contractFlag", getContractFlag())
            .append("bondFile", getBondFile())
            .append("isAuth", getIsAuth())
            .append("isDriver", getIsDriver())
            .append("drivingLicense", getDrivingLicense())
            .append("insurance", getInsurance())
            .append("insuranceCertificate", getInsuranceCertificate())
            .append("status", getStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .append("delFlag", getDelFlag())
            .toString();
    }
}
