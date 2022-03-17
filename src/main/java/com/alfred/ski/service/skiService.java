package com.alfred.ski.service;

import com.alfred.ski.domain.ski;
import com.alfred.ski.vo.skiVo;
import com.alfred.sys.utils.DataGridView;

public interface skiService {

    /**
     * 查询所有雪具
     * @param skiVo
     * @return
     */
    public DataGridView queryAllski(skiVo skiVo);

    /**
     * 添加雪具
     * @param skiVo
     */
    public void addski(skiVo skiVo);

    /**
     * 修改雪具
     * @param skiVo
     */
    public void updateski(skiVo skiVo);

    /**
     * 根据id删除雪具
     * @param skinumber
     */
    public void deleteski(String skinumber);

    /**
     * 批量删除雪具
     * @param skinumbers
     */
    public void deleteBatchski(String[] skinumbers);

    /**
     * 根据车牌号查询
     * @param skinumber
     * @return
     */
    ski queryskiByskiNumber(String skinumber);
}
