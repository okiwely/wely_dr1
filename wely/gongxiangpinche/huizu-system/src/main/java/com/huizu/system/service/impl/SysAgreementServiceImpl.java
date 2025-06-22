package com.huizu.system.service.impl;

import java.util.List;
import com.huizu.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.huizu.system.mapper.SysAgreementMapper;
import com.huizu.system.domain.SysAgreement;
import com.huizu.system.service.ISysAgreementService;

/**
 * 协议管理Service业务层处理
 *
 * @author huizu
 * @date 2024-07-09
 */
@Service
public class SysAgreementServiceImpl implements ISysAgreementService
{
    @Autowired
    private SysAgreementMapper sysAgreementMapper;

    /**
     * 查询协议管理
     *
     * @param id 协议管理主键
     * @return 协议管理
     */
    @Override
    public SysAgreement selectSysAgreementById(Integer id)
    {
        return sysAgreementMapper.selectSysAgreementById(id);
    }

    /**
     * 查询协议管理列表
     *
     * @param sysAgreement 协议管理
     * @return 协议管理
     */
    @Override
    public List<SysAgreement> selectSysAgreementList(SysAgreement sysAgreement)
    {
        return sysAgreementMapper.selectSysAgreementList(sysAgreement);
    }

    /**
     * 新增协议管理
     *
     * @param sysAgreement 协议管理
     * @return 结果
     */
    @Override
    public int insertSysAgreement(SysAgreement sysAgreement)
    {
        sysAgreement.setCreateTime(DateUtils.getNowDate());
        return sysAgreementMapper.insertSysAgreement(sysAgreement);
    }

    /**
     * 修改协议管理
     *
     * @param sysAgreement 协议管理
     * @return 结果
     */
    @Override
    public int updateSysAgreement(SysAgreement sysAgreement)
    {
        sysAgreement.setUpdateTime(DateUtils.getNowDate());
        return sysAgreementMapper.updateSysAgreement(sysAgreement);
    }

    /**
     * 批量删除协议管理
     *
     * @param ids 需要删除的协议管理主键
     * @return 结果
     */
    @Override
    public int deleteSysAgreementByIds(Integer[] ids)
    {
        return sysAgreementMapper.deleteSysAgreementByIds(ids);
    }

    /**
     * 删除协议管理信息
     *
     * @param id 协议管理主键
     * @return 结果
     */
    @Override
    public int deleteSysAgreementById(Integer id)
    {
        return sysAgreementMapper.deleteSysAgreementById(id);
    }
}
