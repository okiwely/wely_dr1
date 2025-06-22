package com.huizu.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.huizu.common.annotation.Excel;
import com.huizu.common.core.domain.BaseEntity;

/**
 * 存储app版本相关信息对象 sys_version
 *
 * @author huizu
 * @date 2024-07-24
 */
public class SysVersion extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 本表主键 */
    private Long id;

    /** 商店类型:1小米、2应用宝、3华为、4百度、5 360、6豌豆荚、7魅族 */
    @Excel(name = "商店类型:1小米、2应用宝、3华为、4百度、5 360、6豌豆荚、7魅族", dictType = "sys_audit")
    private String storeType;

    /** 系统类型：1安卓、2IOS */
    @Excel(name = "系统类型：1安卓、2IOS", dictType = "yes_no")
    private String systemType;

    /** 安装url */
    @Excel(name = "安装url")
    private String resUrl;

    /** 版本编码:递增值，每次加1 */
    @Excel(name = "版本编码:递增值，每次加1")
    private String versionCode;

    /** 版本名称:当前版本名称 */
    @Excel(name = "版本名称:当前版本名称")
    private String versionName;

    /** 更新内容 */
    @Excel(name = "更新内容")
    private String content;

    /** 是否强制更新：1强制、2不强制 */
    @Excel(name = "是否强制更新：1强制、2不强制")
    private String upFlag;

    /** 描述信息 */
    @Excel(name = "描述信息")
    private String description;

    /** 帐号状态（0正常 1停用） */
    @Excel(name = "帐号状态")
    private String status;

    /** 删除标签:1未删除、2删除 */
    private String delFlag;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setStoreType(String storeType)
    {
        this.storeType = storeType;
    }

    public String getStoreType()
    {
        return storeType;
    }
    public void setSystemType(String systemType)
    {
        this.systemType = systemType;
    }

    public String getSystemType()
    {
        return systemType;
    }
    public void setResUrl(String resUrl)
    {
        this.resUrl = resUrl;
    }

    public String getResUrl()
    {
        return resUrl;
    }
    public void setVersionCode(String versionCode)
    {
        this.versionCode = versionCode;
    }

    public String getVersionCode()
    {
        return versionCode;
    }
    public void setVersionName(String versionName)
    {
        this.versionName = versionName;
    }

    public String getVersionName()
    {
        return versionName;
    }
    public void setContent(String content)
    {
        this.content = content;
    }

    public String getContent()
    {
        return content;
    }
    public void setUpFlag(String upFlag)
    {
        this.upFlag = upFlag;
    }

    public String getUpFlag()
    {
        return upFlag;
    }
    public void setDescription(String description)
    {
        this.description = description;
    }

    public String getDescription()
    {
        return description;
    }
    public void setStatus(String status)
    {
        this.status = status;
    }

    public String getStatus()
    {
        return status;
    }
    public void setDelFlag(String delFlag)
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag()
    {
        return delFlag;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("storeType", getStoreType())
            .append("systemType", getSystemType())
            .append("resUrl", getResUrl())
            .append("versionCode", getVersionCode())
            .append("versionName", getVersionName())
            .append("content", getContent())
            .append("upFlag", getUpFlag())
            .append("description", getDescription())
            .append("status", getStatus())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("delFlag", getDelFlag())
            .toString();
    }
}
