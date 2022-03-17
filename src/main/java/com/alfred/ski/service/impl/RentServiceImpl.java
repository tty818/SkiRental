package com.alfred.ski.service.impl;

import com.alfred.ski.domain.ski;
import com.alfred.ski.domain.Rent;
import com.alfred.ski.mapper.RentMapper;
import com.alfred.ski.service.RentService;
import com.alfred.ski.vo.RentVo;
import com.alfred.sys.constant.SysConstant;
import com.alfred.sys.utils.DataGridView;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class RentServiceImpl implements RentService {

    @Autowired
    private RentMapper rentMapper;

    @Autowired
    private com.alfred.ski.mapper.skiMapper skiMapper;

    @Override
    public void addRent(RentVo rentVo) {
        this.rentMapper.insertSelective(rentVo);
        //更改雪具出租的状态
        ski ski = new ski();
        ski.setskinumber(rentVo.getskinumber());
        //设置状态为已出租
        ski.setIsrenting(SysConstant.RENT_BACK_TRUE);
        skiMapper.updateByPrimaryKeySelective(ski);
    }

    @Override
    public DataGridView queryAllRent(RentVo rentVo) {
        Page<Object> page = PageHelper.startPage(rentVo.getPage(),rentVo.getLimit());
        List<Rent> data = this.rentMapper.queryAllRent(rentVo);
        return new DataGridView(page.getTotal(),data);
    }


    @Override
    public void updateRent(RentVo rentVo) {
        this.rentMapper.updateByPrimaryKeySelective(rentVo);
    }

    @Override
    public void deleteRent(String rentid) {
        //更改雪具状态，将已出租的状态转换成未出租的状态
        Rent rent = this.rentMapper.selectByPrimaryKey(rentid);
        ski ski = new ski();
        ski.setskinumber(rent.getskinumber());
        //转换成未出租的状态
        ski.setIsrenting(SysConstant.RENT_ski_FALSE);
        skiMapper.updateByPrimaryKeySelective(ski);
        this.rentMapper.deleteByPrimaryKey(rentid);
    }

    /**
     * 根据出租单好查询出租单信息
     * @param rentid
     * @return
     */
    @Override
    public Rent queryRentByRentId(String rentid) {
        return this.rentMapper.selectByPrimaryKey(rentid);
    }

}
