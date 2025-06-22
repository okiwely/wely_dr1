package com.huizu.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.huizu.common.annotation.Excel;
import com.huizu.common.core.domain.BaseEntity;

/**
 * 轮播图信息对象 sys_banner
 *
 * @author huizu
 * @date 2024-07-09
 */
public class SysBanner extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 序号 */
    private Integer id;

    /** 类型 */
    @Excel(name = "类型", dictType = "sys_banner_type")
    private String type;

    /** 图片地址 */
    @Excel(name = "图片地址")
    private String image;

    /** 跳转地址 */
    @Excel(name = "跳转地址")
    private String url;

    /** 启用状态（0.停用 1.启用） */
    @Excel(name = "启用状态", dictType = "sys_open_status")
    private Integer status;

    /** 删除标记（0.正常 1.删除） */
    private Integer delFlag;

    public void setId(Integer id)
    {
        this.id = id;
    }

    public Integer getId()
    {
        return id;
    }
    public void setType(String type)
    {
        this.type = type;
    }

    public String getType()
    {
        return type;
    }
    public void setImage(String image)
    {
        this.image = image;
    }

    public String getImage()
    {
        return image;
    }
    public void setUrl(String url)
    {
        this.url = url;
    }

    public String getUrl()
    {
        return url;
    }
    public void setStatus(Integer status)
    {
        this.status = status;
    }

    public Integer getStatus()
    {
        return status;
    }
    public void setDelFlag(Integer delFlag)
    {
        this.delFlag = delFlag;
    }

    public Integer getDelFlag()
    {
        return delFlag;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("type", getType())
            .append("image", getImage())
            .append("url", getUrl())
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
