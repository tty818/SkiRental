package com.alfred.ski.controller;

import com.alfred.ski.domain.ski;
import com.alfred.ski.service.skiService;

import com.alfred.ski.vo.skiVo;
import com.alfred.sys.constant.SysConstant;
import com.alfred.sys.utils.AppFileUtils;
import com.alfred.sys.utils.DataGridView;
import com.alfred.sys.utils.ResultObj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

@RestController
@RequestMapping("ski")
public class skiController {

    @Autowired
    private skiService skiService;

    /**
     * 加载雪具列表返回DataGridView
     * @param skiVo
     * @return
     */
    @RequestMapping("loadAllski")
    public DataGridView loadAllski(skiVo skiVo){
        return this.skiService.queryAllski(skiVo);
    }

    /**
     * 添加一个雪具
     * @param skiVo
     * @return
     */
    @RequestMapping("addski")
    public ResultObj addski(skiVo skiVo){
        try{
            skiVo.setCreatetime(new Date());
            //如果不是默认图片就去掉图片的_temp的后缀
            if(!skiVo.getskiimg().equals(SysConstant.DEFAULT_ski_IMG)){
                String filePath = AppFileUtils.updateFileName(skiVo.getskiimg(), SysConstant.FILE_UPLOAD_TEMP);
                skiVo.setskiimg(filePath);
            }
            this.skiService.addski(skiVo);
            return ResultObj.ADD_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }

    /**
     * 修改一个雪具
     * @param skiVo
     * @return
     */
    @RequestMapping("updateski")
    public ResultObj updateski(skiVo skiVo){
        try{
            String skiimg = skiVo.getskiimg();
            if (skiimg.endsWith(SysConstant.FILE_UPLOAD_TEMP)) {
                String filePath =AppFileUtils.updateFileName(skiVo.getskiimg(), SysConstant.FILE_UPLOAD_TEMP);
                skiVo.setskiimg(filePath);
                //把原来的删除
                ski  ski = this.skiService.queryskiByskiNumber(skiVo.getskinumber());
                AppFileUtils.removeFileByPath(ski.getskiimg());

            }
            this.skiService.updateski(skiVo);
            return ResultObj.UPDATE_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
    }

    /**
     * 删除一个雪具
     * @param skiVo
     * @return
     */
    @RequestMapping("deleteski")
    public ResultObj deleteski(skiVo skiVo){
        try {
            this.skiService.deleteski(skiVo.getskinumber());
            return ResultObj.DELETE_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

    /**
     * 批量删除雪具
     * @param skiVo
     * @return
     */
    @RequestMapping("deleteBatchski")
    public ResultObj deleteBatchski(skiVo skiVo){
        try{
            this.skiService.deleteBatchski(skiVo.getIds());
            return ResultObj.DELETE_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

}
