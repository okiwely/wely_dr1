package com.huizu.common.core.domain.entity;

import com.huizu.common.core.domain.TreeSelect;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.stream.Collectors;

/**
 * 字典数据表 sys_dict_data
 *
 * @author huizu
 */
public class DictData
{
    private static final long serialVersionUID = 1L;

    /** 字典键值 */
    private String value;
    /** 字典标签 */
    private String label;

    public DictData(SysDictData sysDictData)
    {
        this.value = sysDictData.getDictValue();
        this.label = sysDictData.getDictLabel();
    }


//    /** 是否默认（Y是 N否） */
//    @Excel(name = "是否默认", readConverterExp = "Y=是,N=否")
//    private String isDefault;


//    public boolean getDefault()
//    {
//        return UserConstants.YES.equals(this.isDefault);
//    }
//
//    public String getIsDefault()
//    {
//        return isDefault;
//    }
//
//    public void setIsDefault(String isDefault)
//    {
//        this.isDefault = isDefault;
//    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("dictLabel", getLabel())
                .append("dictValue", getValue())
//                .append("isDefault", getIsDefault())
                .toString();
    }
}
