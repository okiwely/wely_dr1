package com.huizu.system.mapper;

import java.util.List;
import com.huizu.system.domain.SysIdea;

/**
 * 意见反馈Mapper接口
 *
 * @author huizu
 * @date 2024-07-10
 */
public interface SysIdeaMapper
{
    /**
     * 查询意见反馈
     *
     * @param id 意见反馈主键
     * @return 意见反馈
     */
    SysIdea selectSysIdeaById(Integer id);

    /**
     * 查询意见反馈列表
     *
     * @param sysIdea 意见反馈
     * @return 意见反馈集合
     */
    List<SysIdea> selectSysIdeaList(SysIdea sysIdea);

    /**
     * 新增意见反馈
     *
     * @param sysIdea 意见反馈
     * @return 结果
     */
    int insertSysIdea(SysIdea sysIdea);

    /**
     * 修改意见反馈
     *
     * @param sysIdea 意见反馈
     * @return 结果
     */
    int updateSysIdea(SysIdea sysIdea);

    /**
     * 删除意见反馈
     *
     * @param id 意见反馈主键
     * @return 结果
     */
    int deleteSysIdeaById(Integer id);

    /**
     * 批量删除意见反馈
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    int deleteSysIdeaByIds(Integer[] ids);
}
