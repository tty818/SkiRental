<%--
  Created by IntelliJ IDEA.
  ski: YQF
  Date: 2019/10/14
  Time: 18:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>雪具管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <%--<link rel="icon" href="favicon.ico">--%>
    <link rel="stylesheet" href="${alfred}/resources/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="${alfred}/resources/css/public.css" media="all"/>
</head>
<body class="childrenBody">

<!-- 搜索条件开始 -->
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>查询条件</legend>
</fieldset>
<form class="layui-form" method="post" id="searchFrm">

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">雪具号:</label>
            <div class="layui-input-inline" style="padding: 5px">
                <input type="text" name="skinumber" autocomplete="off" class="layui-input layui-input-inline"
                       placeholder="请输入雪具号" style="height: 30px;border-radius: 10px">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">雪具类型:</label>
            <div class="layui-input-inline" style="padding: 5px">
                <input type="text" name="skitype" autocomplete="off" class="layui-input layui-input-inline"
                       placeholder="请输入雪具类型" style="height: 30px;border-radius: 10px">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">雪具颜色:</label>
            <div class="layui-input-inline" style="padding: 5px">
                <input type="text" name="color" autocomplete="off" class="layui-input layui-input-inline"
                       placeholder="请输入雪具颜色" style="height: 30px;border-radius: 10px">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">雪具描述:</label>
            <div class="layui-input-inline" style="padding: 5px">
                <input type="text" name="description" autocomplete="off" class="layui-input layui-input-inline"
                       placeholder="请输入雪具描述" style="height: 30px;border-radius: 10px">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">是否出租:</label>
            <div class="layui-input-inline">
                <input type="radio" name="isrenting" value="1" title="已出租">
                <input type="radio" name="isrenting" value="0" title="未出租">
            </div>
            <button type="button"
                    class="layui-btn layui-btn-normal layui-icon layui-icon-search layui-btn-radius layui-btn-sm"
                    id="doSearch" style="margin-top: 4px">查询
            </button>
            <button type="reset"
                    class="layui-btn layui-btn-warm layui-icon layui-icon-refresh layui-btn-radius layui-btn-sm"
                    style="margin-top: 4px">重置
            </button>
        </div>
    </div>

</form>

<!-- 数据表格开始 -->
<table class="layui-hide" id="skiTable" lay-filter="skiTable"></table>
<div id="skiToolBar" style="display: none;">
    <button type="button" class="layui-btn layui-btn-sm layui-btn-radius" lay-event="add">增加</button>
    <button type="button" class="layui-btn layui-btn-danger layui-btn-sm layui-btn-radius" lay-event="deleteBatch">
        批量删除
    </button>
</div>
<div id="skiBar" style="display: none;">
    <a class="layui-btn layui-btn-xs layui-btn-radius" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs layui-btn-radius" lay-event="del">删除</a>
    <a class="layui-btn layui-btn-warm layui-btn-xs layui-btn-radius" lay-event="viewImage">查看大图</a>
</div>

<!-- 添加和修改的弹出层-->
<div style="display: none;padding: 20px" id="saveOrUpdateDiv">
    <form class="layui-form layui-row layui-col-space10" lay-filter="dataFrm" id="dataFrm">
        <div class="layui-col-md12 layui-col-xs12">
            <div class="layui-row layui-col-space10">
                <div class="layui-col-md9 layui-col-xs7">

                    <div class="layui-form-item magt3">
                        <label class="layui-form-label">雪具号:</label>
                        <div class="layui-input-block" style="padding: 5px">
                            <input type="text" name="skinumber" id="skinumber" autocomplete="off" class="layui-input"
                                   lay-verify="required"
                                   placeholder="请输入雪具号" style="height: 30px;border-radius: 10px">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">雪具类型:</label>
                        <div class="layui-input-block" style="padding: 5px">
                            <input type="text" name="skitype" autocomplete="off" class="layui-input"
                                   placeholder="请输入雪具类型" style="height: 30px;border-radius: 10px">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">雪具颜色:</label>
                        <div class="layui-input-block" style="padding: 5px">
                            <input type="text" name="color" autocomplete="off" class="layui-input"
                                   placeholder="请输入雪具颜色" style="height: 30px;border-radius: 10px">
                        </div>
                    </div>
                </div>
                <div class="layui-col-md3 layui-col-xs5">
                    <div class="layui-upload-list thumbBox mag0 magt3" id="skiimgDiv">
                        <%--显示要上传的图片--%>
                        <img class="layui-upload-img thumbImg" id="showskiImg">
                        <%--保存当前显示图片的地址--%>
                        <input type="hidden" name="skiimg" id="skiimg">
                    </div>
                </div>
            </div>
            <div class="layui-form-item magb0">
                <label class="layui-form-label">雪具描述:</label>
                <div class="layui-input-block" style="padding: 5px">
                    <input type="text" name="description" autocomplete="off" class="layui-input"
                           placeholder="请输入雪具描述" style="height: 30px;border-radius: 10px">
                </div>
            </div>
            <div class="layui-form-item magb0">
                <div class="layui-inline">
                    <label class="layui-form-label">雪具价格:</label>
                    <div class="layui-input-block" style="padding: 5px">
                        <input type="text" name="price" class="layui-input" lay-verify="required|number"
                               placeholder="请输入雪具价格" style="height: 30px;border-radius: 10px">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">出租价格:</label>
                    <div class="layui-input-block" style="padding: 5px">
                        <input type="text" name="rentprice" class="layui-input" lay-verify="required|number"
                               placeholder="请输入雪具出租价格" style="height: 30px;border-radius: 10px">
                    </div>
                </div>
            </div>
            <div class="layui-form-item magb0">
                <div class="layui-inline">
                    <label class="layui-form-label">出租押金:</label>
                    <div class="layui-input-block" style="padding: 5px">
                        <input type="text" name="deposit" class="layui-input" lay-verify="required|number"
                               placeholder="请输入雪具出租押金" style="height: 30px;border-radius: 10px">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">是否出租:</label>
                    <div class="layui-input-inline">
                        <input type="radio" name="isrenting" value="1" title="已出租">
                        <input type="radio" name="isrenting" value="0" checked="checked" title="未出租">
                    </div>
                </div>
            </div>
            <div class="layui-form-item magb0">
                <div class="layui-input-block" style="text-align: center;padding-right: 120px">
                    <button type="button"
                            class="layui-btn layui-btn-normal layui-btn-md layui-icon layui-icon-release layui-btn-radius"
                            lay-filter="doSubmit" lay-submit="">提交
                    </button>
                    <button type="reset"
                            class="layui-btn layui-btn-warm layui-btn-md layui-icon layui-icon-refresh layui-btn-radius">
                        重置
                    </button>
                </div>
            </div>
        </div>
    </form>
</div>

<%--查看大图弹出的层开始--%>
<div id="viewskiImageDiv" style="display: none;text-align: center">
    <img alt="雪具图片" width="700px" height="450px" id="view_skiimg">
</div>

<script src="${alfred}/resources/layui/layui.js"></script>
<script type="text/javascript">
    var tableIns;
    layui.use(['jquery', 'layer', 'form', 'table', 'upload'], function () {
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;
        var table = layui.table;
        var dtree = layui.dtree;
        var upload = layui.upload;
        //渲染数据表格
        tableIns = table.render({
            elem: '#skiTable'   //渲染的目标对象
            , url: '${alfred}/ski/loadAllski.action' //数据接口
            , title: '雪具数据表'//数据导出来的标题
            , toolbar: "#skiToolBar"   //表格的工具条
            , height: 'full-205'
            , cellMinWidth: 100 //设置列的最小默认宽度
            , page: true  //是否启用分页
            , cols: [[   //列表数据
                {type: 'checkbox', fixed: 'left'}
                , {field: 'skinumber', title: '雪具号', align: 'center', width: '110'}
                , {field: 'skitype', title: '雪具类型', align: 'center', width: '90'}
                , {field: 'color', title: '雪具颜色', align: 'center', width: '90'}
                , {field: 'price', title: '雪具价格', align: 'center', width: '90'}
                , {field: 'rentprice', title: '出租价格', align: 'center', width: '90'}
                , {field: 'deposit', title: '出租押金', align: 'center', width: '90'}
                , {
                    field: 'isrenting', title: '出租状态', align: 'center', width: '90', templet: function (d) {
                        return d.isrenting == '1' ? '<font color=blue>已出租</font>' : '<font color=red>未出租</font>';
                    }
                }
                , {field: 'description', title: '雪具描述', align: 'center', width: '150'}
                , {
                    field: 'skiimg', title: '缩略图', align: 'center', width: '80', templet: function (d) {
                        return "<img width=40 height=40 src=${alfred}/file/downloadShowFile.action?path=" + d.skiimg + "/>";
                    }
                }
                , {field: 'createtime', title: '录入时间', align: 'center', width: '165'}
                , {fixed: 'right', title: '操作', toolbar: '#skiBar', align: 'center', width: '190'}
            ]],
            done: function (data, curr, count) {
                //不是第一页时，如果当前返回的数据为0那么就返回上一页
                if (data.data.length == 0 && curr != 1) {
                    tableIns.reload({
                        page: {
                            curr: curr - 1
                        }
                    })
                }
            }
        });

        //模糊查询
        $("#doSearch").click(function () {
            var params = $("#searchFrm").serialize();
//            alert(params);
            tableIns.reload({
                url: "${alfred}/ski/loadAllski.action?" + params,
                page: {curr: 1}
            })
        });

        //监听头部工具栏事件
        table.on("toolbar(skiTable)", function (obj) {
            switch (obj.event) {
                case 'add':
                    openAddski();
                    break;
                case 'deleteBatch':
                    deleteBatch();
                    break;
            }
        });

        //监听行工具事件
        table.on('tool(skiTable)', function (obj) {
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if (layEvent === 'del') { //删除
                layer.confirm('真的删除【' + data.skinumber + '】这个雪具么？', function (index) {
                    //向服务端发送删除指令
                    $.post("${alfred}/ski/deleteski.action", {skinumber: data.skinumber}, function (res) {
                        layer.msg(res.msg);
                        //刷新数据表格
                        tableIns.reload();
                    })
                });
            } else if (layEvent === 'edit') { //编辑
                //编辑，打开修改界面
                openUpdateski(data);
            }else if (layEvent === 'viewImage'){ //查看大图
                showskiImage(data);
            }
        });

        var url;
        var mainIndex;

        //打开添加页面
        function openAddski() {
            mainIndex = layer.open({
                type: 1,
                title: '添加雪具',
                content: $("#saveOrUpdateDiv"),
                area: ['700px', '480px'],
                success: function (index) {
                    //清空表单数据
                    $("#dataFrm")[0].reset();
                    //设置默认图片
                    $("#showskiImg").attr("src", "${alfred}/file/downloadShowFile.action?path=images/defaultskiimage.jpg");
                    $("#skiimg").val("images/defaultskiimage.jpg");
                    url = "${alfred}/ski/addski.action";
                    $("#skinumber").removeAttr("readonly","readonly");
                }
            });
        }

        //打开修改页面
        function openUpdateski(data) {
            mainIndex = layer.open({
                type: 1,
                title: '修改雪具',
                content: $("#saveOrUpdateDiv"),
                area: ['700px', '480px'],
                success: function (index) {
                    form.val("dataFrm", data);
                    $("#showskiImg").attr("src", "${alfred}/file/downloadShowFile.action?path=" + data.skiimg);
                    url = "${alfred}/ski/updateski.action";
                    $("#skinumber").attr("readonly","readonly");
                }
            });
        }

        //保存
        form.on("submit(doSubmit)", function (obj) {
            //序列化表单数据
            var params = $("#dataFrm").serialize();
            $.post(url, params, function (obj) {
                layer.msg(obj.msg);
                //关闭弹出层
                layer.close(mainIndex)
                //刷新数据 表格
                tableIns.reload();
            })
        });

        //批量删除
        function deleteBatch() {
            //得到选中的数据行
            var checkStatus = table.checkStatus('skiTable');
            var data = checkStatus.data;
            var params = "";
            $.each(data, function (i, item) {
                if (i == 0) {
                    params += "ids=" + item.skinumber;
                } else {
                    params += "&ids=" + item.skinumber;
                }
            });
            layer.confirm('真的要删除这些雪具么？', function (index) {
                //向服务端发送删除指令
                $.post("${alfred}/ski/deleteBatchski.action", params, function (res) {
                    layer.msg(res.msg);
                    //刷新数据表格
                    tableIns.reload();
                })
            });
        }

        //上传缩略图
        upload.render({
            elem: '#skiimgDiv',
            url: '${alfred}/file/uploadFile.action',
            method: "post",  //此处是为了演示之用，实际使用中请将此删除，默认用post方式提交
            acceptMime: 'images/*',
            field: "mf",
            done: function (res, index, upload) {
                $('#showskiImg').attr('src', "${alfred}/file/downloadShowFile.action?path=" + res.data.src);
                $('#skiimg').val(res.data.src);
                $('#skiimgDiv').css("background", "#fff");
            }
        });
        
        //查看大图
        function showskiImage(data) {
            mainIndex = layer.open({
                type: 1,
                title: "【"+data.skinumber+'】的雪具图片',
                content: $("#viewskiImageDiv"),
                area: ['750px', '500px'],
                success: function (index) {
                    $("#view_skiimg").attr("src","${alfred}/file/downloadShowFile.action?path="+data.skiimg);
                }
            });
        }

    });

</script>
</body>
</html>

