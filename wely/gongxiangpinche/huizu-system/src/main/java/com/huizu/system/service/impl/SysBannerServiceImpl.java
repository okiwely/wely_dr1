package com.huizu.system.service.impl;

import java.util.List;
import com.huizu.common.utils.DateUtils;
import com.huizu.common.annotation.DataScope;
import com.huizu.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.huizu.system.mapper.SysBannerMapper;
import com.huizu.system.domain.SysBanner;
import com.huizu.system.service.ISysBannerService;

/**
 * 轮播图信息Service业务层处理
 *
 * @author huizu
 * @date 2024-07-09
 */
@Service
public class SysBannerServiceImpl implements ISysBannerService
{
    @Autowired
    private SysBannerMapper sysBannerMapper;

    /**
     * 查询轮播图信息
     *
     * @param id 轮播图信息主键
     * @return 轮播图信息
     */
    @Override
    public SysBanner selectSysBannerById(Integer id)
    {
        return sysBannerMapper.selectSysBannerById(id);
    }

    /**
     * 查询轮播图信息列表
     *
     * @param sysBanner 轮播图信息
     * @return 轮播图信息
     */
    @Override
    @DataScope(userAlias = "a",deptAlias = "a")
    public List<SysBanner> selectSysBannerList(SysBanner sysBanner)
    {
        return sysBannerMapper.selectSysBannerList(sysBanner);
    }

    /**
     * 新增轮播图信息
     *
     * @param sysBanner 轮播图信息
     * @return 结果
     */
    @Override
    public int insertSysBanner(SysBanner sysBanner)
    {
        //设置创建人
        sysBanner.setCreateBy(SecurityUtils.getUsername());
        //设置创建时间
        sysBanner.setCreateTime(DateUtils.getNowDate());
        return sysBannerMapper.insertSysBanner(sysBanner);
    }

    /**
     * 修改轮播图信息
     *
     * @param sysBanner 轮播图信息
     * @return 结果
     */
    @Override
    public int updateSysBanner(SysBanner sysBanner)
    {
        //设置修改人
        sysBanner.setUpdateBy(SecurityUtils.getUsername());
        //设置修改时间
        sysBanner.setUpdateTime(DateUtils.getNowDate());
        return sysBannerMapper.updateSysBanner(sysBanner);
    }

    /**
     * 批量删除轮播图信息
     *
     * @param ids 需要删除的轮播图信息主键
     * @return 结果
     */
    @Override
    public int deleteSysBannerByIds(Integer[] ids)
    {
        return sysBannerMapper.deleteSysBannerByIds(ids);
    }

    /**
     * 删除轮播图信息信息
     *
     * @param id 轮播图信息主键
     * @return 结果
     */
    @Override
    public int deleteSysBannerById(Integer id)
    {
        return sysBannerMapper.deleteSysBannerById(id);
    }
}
