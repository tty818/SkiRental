package com.alfred.ski.mapper;

import com.alfred.ski.domain.ski;
import com.alfred.ski.vo.skiVo;

import java.util.List;

public interface skiMapper {
    int deleteByPrimaryKey(String skinumber);

    int insert(ski record);

    int insertSelective(ski record);

    ski selectByPrimaryKey(String skinumber);

    int updateByPrimaryKeySelective(ski record);

    int updateByPrimaryKey(ski record);

    List<ski> queryAllski(skiVo skiVo);
}