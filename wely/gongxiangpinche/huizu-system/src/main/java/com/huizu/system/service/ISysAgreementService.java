package com.huizu.system.service;

import java.util.List;
import com.huizu.system.domain.SysAgreement;

/**
 * 协议管理Service接口
 * 
 * @author huizu
 * @date 2024-07-09
 */
public interface ISysAgreementService 
{
    /**
     * 查询协议管理
     * 
     * @param id 协议管理主键
     * @return 协议管理
     */
    public SysAgreement selectSysAgreementById(Integer id);

    /**
     * 查询协议管理列表
     * 
     * @param sysAgreement 协议管理
     * @return 协议管理集合
     */
    public List<SysAgreement> selectSysAgreementList(SysAgreement sysAgreement);

    /**
     * 新增协议管理
     * 
     * @param sysAgreement 协议管理
     * @return 结果
     */
    public int insertSysAgreement(SysAgreement sysAgreement);

    /**
     * 修改协议管理
     * 
     * @param sysAgreement 协议管理
     * @return 结果
     */
    public int updateSysAgreement(SysAgreement sysAgreement);

    /**
     * 批量删除协议管理
     * 
     * @param ids 需要删除的协议管理主键集合
     * @return 结果
     */
    public int deleteSysAgreementByIds(Integer[] ids);

    /**
     * 删除协议管理信息
     * 
     * @param id 协议管理主键
     * @return 结果
     */
    public int deleteSysAgreementById(Integer id);
}
