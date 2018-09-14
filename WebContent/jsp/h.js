require(["../../components/config"], function () {
    require(['jquery', 'AJAX', 'doT', 'ajaxCheckModel', 'blockUI','bootstrap-model', 'timepicker', 'datepicker-zh-CN', 'timepicker-zh-CN', 'maskedinput', 'Validation','fundComponent'],
    function ($, AJAX, doT, ajaxCheckModel, datepicker, datetimepicker) {
            function NewsListRender(){
                this.drawDoTable = function(GetListParameter, link) {
                    var dfd = new Promise(function (resolve, reject) {
                        $.ajax({
                            url: link,
                            type: 'POST',
                            dataType: 'json',
                            data: GetListParameter,
                            success: function (res) {
                                if (res.Code == 0) {
                                    var interText = doT.template($("#newsList_Tmp").text());
                                    $(".newsListContainer").html(interText(res.Items));
                                } else {
                                    alertify.alert(res.Message);
                                }
                                resolve(res);
                            },
                            error: (function (msg) {
                                alertSafs("提交查询请求失败，请重试或联系技术人员。原因：" + msg);
                            }),
                        });
                    });
                    return dfd;
                }
            }
            NewsListRender.prototype = {
                init: function(){
                    this.dataInject();
                    this.renderNewsList();
                    this.bindEvent();
                    this.setPermission();
                },
                dataInject: function(){
                    //注入全局变量供分页调用
                    link             = '/NewsList/GetNewsHeadlines',
                    container        = 'newsListContainerPageHook',
                    hrefLocation     = getQueryString('location') || 3;
                    herfKeywords     = getQueryString('keywords') || '';
                    currentPage      = 1,
                    pageSize         = 15,
                    GetListParameter = {
                        Data: {
                            Location   : hrefLocation,
                            Keywords   : herfKeywords,
                            Start      : null,
                            End        : null,
                        },
                        currentPage: currentPage,
                        pageSize   : pageSize
                    }
                    $(".newsCatagory").val(hrefLocation);
                    $(".keywords").val(herfKeywords);
                },
                renderNewsList: function(){
                    var that = this;
                    $(".fund-panel").blockMaskArea();
                    this.drawDoTable(GetListParameter, link).then(function (res) {
                        fundPaginator(res, container, that.drawDoTable);
                        $(".fund-panel").unblock();
                    });
                },
                bindEvent: function(){
                    var that = this;
                    $(".startDate,.endDate").mask("9999-99-99 99:99:99");
                    $(".newsDate").datetimepicker({
                        changeYear: true,
                        changeMonth: true
                    });
                    $(".dataFilter").click(function(){
                        GetListParameter.Data.Location = $(".newsCatagory").val();
                        GetListParameter.Data.Keywords = $(".keywords").val();
                        GetListParameter.currentPage =  1;
                        that.renderNewsList();
                    });
                    $(".confirmNews").click(function(){
                        var Title  = $(".Title ").val(),
                            Author = $(".Author").val(),
                            Type = $(".Type").val(),
                            Date = $(".Date ").val(),
                            From =$(".From ").val(),
                            Url = $(".Url").val(),
                            Content=$(".Content").val();
                        var link = "/NewsList/AddNewsInfo",
                            parameter = {
                                Title:Title,
                                Author:Author,
                                Type:Type,
                                Date:Date,
                                From:From,
                                Url:Url,
                                Content:Content,
                            };
                            checkStatus = true;
                            $(".notEmpty").each(function(){
                                $(this).validation('notEmpty');
                            })
                            if (!checkStatus){
                                return;
                            }
                            AJAX.post(link,parameter).done(function(data){
                                if (ajaxCheckModel.ajaxCheck(data)){
                                    alertify.alert("添加成功");
                                    document.getElementById("newsInfoForm").reset();
                                    $("#newNews").modal("hide");
                                }
                            }).fail(function(data){
                                alertify.alert("请联系管理员！");
                            })
                    });
                    $(".keywords").keydown(function(e) {  
                        if (e.keyCode == 13) {
                            $(".dataFilter").click()
                        }
                    });  
                },
                setPermission:function(){
                    var permissionList = [{
                        className: 'addNewsList--permission',
                        action: 'NewsList.AddNewsInfo'
                    } ];
                    permissionState = false;
                    $.controlPermission(permissionList);  
                }
            }
            var newsListIns = new  NewsListRender();
            newsListIns.init();
    });
});

