package com.huizu.system.mapper;

import java.util.List;
import com.huizu.system.domain.SysBanner;

/**
 * 轮播图信息Mapper接口
 *
 * @author huizu
 * @date 2024-07-09
 */
public interface SysBannerMapper
{
    /**
     * 查询轮播图信息
     *
     * @param id 轮播图信息主键
     * @return 轮播图信息
     */
    SysBanner selectSysBannerById(Integer id);

    /**
     * 查询轮播图信息列表
     *
     * @param sysBanner 轮播图信息
     * @return 轮播图信息集合
     */
    List<SysBanner> selectSysBannerList(SysBanner sysBanner);

    /**
     * 新增轮播图信息
     *
     * @param sysBanner 轮播图信息
     * @return 结果
     */
    int insertSysBanner(SysBanner sysBanner);

    /**
     * 修改轮播图信息
     *
     * @param sysBanner 轮播图信息
     * @return 结果
     */
    int updateSysBanner(SysBanner sysBanner);

    /**
     * 删除轮播图信息
     *
     * @param id 轮播图信息主键
     * @return 结果
     */
    int deleteSysBannerById(Integer id);

    /**
     * 批量删除轮播图信息
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    int deleteSysBannerByIds(Integer[] ids);
}
