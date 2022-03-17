package com.alfred.ski.service.impl;

import com.alfred.ski.domain.ski;
import com.alfred.ski.service.skiService;
import com.alfred.ski.vo.skiVo;
import com.alfred.sys.constant.SysConstant;
import com.alfred.sys.utils.AppFileUtils;
import com.alfred.sys.utils.DataGridView;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class skiServiceImpl implements skiService {

    @Autowired
    private com.alfred.ski.mapper.skiMapper skiMapper;

    /**
     * 查询所有信息
     * @param skiVo
     * @return
     */
    @Override
    public DataGridView queryAllski(skiVo skiVo) {
        Page<Object> page = PageHelper.startPage(skiVo.getPage(), skiVo.getLimit());
        List<ski> data = this.skiMapper.queryAllski(skiVo);

        return new DataGridView(page.getTotal(),data);
    }

    /**
     * 添加一个雪具
     * @param skiVo
     */
    @Override
    public void addski(skiVo skiVo) {
        this.skiMapper.insertSelective(skiVo);
    }

    /**
     * 更新一个雪具
     * @param skiVo
     */
    @Override
    public void updateski(skiVo skiVo) {
        this.skiMapper.updateByPrimaryKeySelective(skiVo);
    }

    /**
     * 删除一个雪具
     * @param skinumber
     */
    @Override
    public void deleteski(String skinumber) {
        //先删除图片
        ski ski = this.skiMapper.selectByPrimaryKey(skinumber);
        //如果不是默认图片就删除
        if (!ski.getskiimg().equals(SysConstant.DEFAULT_ski_IMG)){
            AppFileUtils.deleteFileUsePath(ski.getskiimg());
        }
        //删除数据库的数据
        this.skiMapper.deleteByPrimaryKey(skinumber);
    }

    /**
     * 批量删除雪具
     * @param skinumbers
     */
    @Override
    public void deleteBatchski(String[] skinumbers) {
        for (String skinumber : skinumbers) {
            this.deleteski(skinumber);
        }

    }

    @Override
    public ski queryskiByskiNumber(String skinumber) {
        return this.skiMapper.selectByPrimaryKey(skinumber);
    }
}
