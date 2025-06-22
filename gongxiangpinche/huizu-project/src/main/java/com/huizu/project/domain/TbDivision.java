package com.huizu.project.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.huizu.common.annotation.Excel;
import com.huizu.common.core.domain.BaseEntity;

/**
 * 行政区划对象 tb_division
 *
 * @author huizu
 * @date 2024-08-14
 */
public class TbDivision extends BaseEntity{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 编码 */
    @Excel(name = "编码")
    private String code;

    /** 都道府県名 */
    @Excel(name = "都道府県名")
    private String cityC;

    /** 市区町村名 */
    @Excel(name = "市区町村名")
    private String areaC;

    /** 都道府県名(日文) */
    @Excel(name = "都道府県名(日文)")
    private String city;

    /** 市区町村名(日文) */
    @Excel(name = "市区町村名(日文)")
    private String area;

    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }
    public void setCode(String code) {
        this.code = code;
    }

    public String getCityC() {
        return cityC;
    }
    public void setCityC(String cityC) {
        this.cityC = cityC;
    }

    public String getAreaC() {
        return areaC;
    }
    public void setAreaC(String areaC) {
        this.areaC = areaC;
    }

    public String getCity() {
        return city;
    }
    public void setCity(String city) {
        this.city = city;
    }

    public String getArea() {
        return area;
    }
    public void setArea(String area) {
        this.area = area;
    }


    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("code", getCode())
                .append("cityC", getCityC())
                .append("areaC", getAreaC())
                .append("city", getCity())
                .append("area", getArea())
                .toString();
    }
}
