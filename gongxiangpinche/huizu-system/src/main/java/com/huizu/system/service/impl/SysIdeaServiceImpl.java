package com.huizu.system.service.impl;

import java.util.List;
import com.huizu.common.utils.DateUtils;
import com.huizu.common.annotation.DataScope;
import com.huizu.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.huizu.system.mapper.SysIdeaMapper;
import com.huizu.system.domain.SysIdea;
import com.huizu.system.service.ISysIdeaService;

/**
 * 意见反馈Service业务层处理
 *
 * @author huizu
 * @date 2024-07-10
 */
@Service
public class SysIdeaServiceImpl implements ISysIdeaService
{
    @Autowired
    private SysIdeaMapper sysIdeaMapper;

    /**
     * 查询意见反馈
     *
     * @param id 意见反馈主键
     * @return 意见反馈
     */
    @Override
    public SysIdea selectSysIdeaById(Integer id)
    {
        return sysIdeaMapper.selectSysIdeaById(id);
    }

    /**
     * 查询意见反馈列表
     *
     * @param sysIdea 意见反馈
     * @return 意见反馈
     */
    @Override
    @DataScope(userAlias = "a",deptAlias = "a")
    public List<SysIdea> selectSysIdeaList(SysIdea sysIdea)
    {
        return sysIdeaMapper.selectSysIdeaList(sysIdea);
    }

    /**
     * 新增意见反馈
     *
     * @param sysIdea 意见反馈
     * @return 结果
     */
    @Override
    public int insertSysIdea(SysIdea sysIdea)
    {
        //设置创建人
        sysIdea.setCreateBy(SecurityUtils.getUsername());
        //设置创建时间
        sysIdea.setCreateTime(DateUtils.getNowDate());
        return sysIdeaMapper.insertSysIdea(sysIdea);
    }

    /**
     * 修改意见反馈
     *
     * @param sysIdea 意见反馈
     * @return 结果
     */
    @Override
    public int updateSysIdea(SysIdea sysIdea)
    {
        //设置修改人
        sysIdea.setUpdateBy(SecurityUtils.getUsername());
        //设置修改时间
        sysIdea.setUpdateTime(DateUtils.getNowDate());
        return sysIdeaMapper.updateSysIdea(sysIdea);
    }

    /**
     * 批量删除意见反馈
     *
     * @param ids 需要删除的意见反馈主键
     * @return 结果
     */
    @Override
    public int deleteSysIdeaByIds(Integer[] ids)
    {
        return sysIdeaMapper.deleteSysIdeaByIds(ids);
    }

    /**
     * 删除意见反馈信息
     *
     * @param id 意见反馈主键
     * @return 结果
     */
    @Override
    public int deleteSysIdeaById(Integer id)
    {
        return sysIdeaMapper.deleteSysIdeaById(id);
    }
}
