<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>이니페이 에스크로 가입사실 확인</title>
        <link rel="stylesheet" href="/aaa/resources/css/yeob/aaa.css" />
        <script type="text/javascript">
        <!--
            function MM_preloadImages() { //v3.0
                var d = document;
                if (d.images) {
                    if (!d.MM_p)
                        d.MM_p = new Array();
                    var i, j = d.MM_p.length, a = MM_preloadImages.arguments;
                    for (i = 0; i < a.length; i++)
                        if (a[i].indexOf("#") != 0) {
                            d.MM_p[j] = new Image;
                            d.MM_p[j++].src = a[i];
                        }
                }
            }
        //-->
        </script>
        <style type="text/css">
            <!--
            @charset "utf-8";
            /* CSS Document */

            /* Common */ 
            html,body{height:auto;margin:0;padding:0;border:0;font-family:dotum,'돋움',Helvetica,sans-serif;font-size:12px;color:#585858;line-height:1.5;text-align:left;} 
            h1, h2, h3, h4, h5, h6, h7 {font-size:1em; margin:0;}
            address, em, strong { font-style:normal;}
            img, fieldset, form {border:0 none; margin:0; padding:0; vertical-align:middle;}
            input, select, button {vertical-align:middle; margin:0; padding:0;}
            legend, .hide { overflow:hidden; position:absolute; top:0; left:0; font-size:1%; line-height:1%;}
            hr {visibility:hidden;overflow:hidden;position:absolute;top:0;left:0;width:1px;height:1px;font-size:0;line-height:0}
            img {border:0;}
            ul,ol,dl{list-style:none;}
            ul,ol,dl,li,dt,dd,p{margin:0; padding:0}
            input, textarea, select {font-family:Gulim,'굴림',Helvetica,sans-serif;font-size:12px;color:#585858;line-height:1.5;text-align:left;}


            a:link,a:active,a:visited{color:#585858;text-decoration:none}
            a:hover,a:focus{color:#92278f;font-weight:normal;text-decoration:underline}

            .ac {text-align:center;}

            /* 팝업 */
            #pop_wrapper {position:relative;}
            #pop_wrapper h1 {height:102px; background:url(images/popup/bg_header.gif) repeat-x; padding-left:32px;}
            #pop_wrapper h1 img {margin-top:23px;}
            #pop_wrapper .pop_cont {padding:25px 40px 20px; padding-left:40px; padding-right:40px;  color:#585858;}
            #pop_wrapper .pop_cont .pop_summary {margin-top:-3px; margin-bottom:33px;} 

            #pop_wrapper .payment_time .state {position:absolute; top:68px; right:30px;}
            #pop_wrapper .payment_time .time {position:absolute; top:25px; right:30px; color:#fff;}


            .security_util {background:url(http://image.inicis.com/mkt/certmark/escrow/escrow_74x74_color.png) no-repeat; padding-left:105px; display:table-cell; height:81px; vertical-align:middle; *padding-top:15px; *margin-bottom:-15px;}
            .security_util2 {background:url(http://image.inicis.com/mkt/certmark/escrow/escrow_74x74_color.png) no-repeat; padding-left:105px; display:table-cell; height:81px; vertical-align:middle; *padding-top:5px; *margin-bottom:-5px;}
            .security_info {background:url(images/popup/bg_info_lst.gif) repeat-y; border-top:1px solid #912790; margin-top:28px;}
            .security_info dl {overflow:hidden;}
            .security_info dl dt {float:left; width:130px; margin-right:10px; padding:11px 0 9px 15px; color:#444; font-weight:bold; border-bottom:1px solid #e6e6e6;}
            .security_info dl dd {border-bottom:1px solid #e6e6e6; padding:11px 0 9px;margin-left: 155px;}
            .security_info table {overflow:hidden;}
            .security_info .tit {font-weight:bold;padding:11px 0 9px 15px;border-bottom:1px solid #e6e6e6;}
            .security_info .cont {border-bottom:1px solid #e6e6e6; padding:11px 0 9px;margin-left: 155px;}
            .security_note {padding-top:22px;}
            .security_note p {padding-top:10px;}
            .security_note p a {text-decoration:underline; color:#585858; font-weight:bold;}

            .btn.vtxt {margin-top:30px; height:29px; display:inline-block;}
            .btn.vtxt a {display:block; height:29px; background:#90278e; padding:0 28px; line-height:29px; font-size:12px; color:#fff !important; font-weight:bold;}

            -->
        </style>
    </head>
    <body>
            <div id="pop_wrapper">
            <%--  style="background-color: #4A1F74" --%>
                <!-- HEADER --> 
                <div style="background-color: #4A1F74"><h1><img src="https://mark.inicis.com/mark/images/popup/h1_inisis_accout.gif" alt="이니페이 에스크로 가입사실 확인"></h1></div>
                <!-- //HEADER --> 
                <div class="payment_time" style="background-color: #371756">
                <%--  style="background-color: #371756" --%>
                    <p class="state" ><img src="https://mark.inicis.com/mark/images/popup/kg_security.gif" alt="결제보안 작동 중"></p>
                </div>
                <!-- CONTAINER --> 
                <div id="pop_container"> 
                    <div class="pop_cont">
                        <!-- pop content -->

                        <p class="security_util2">
                            아래와 같이 <strong><a href="#" target="_blank" class="service_link">www.dasam.com</a></strong>은 (주)이니시스의 결제대금 예치서비스인 이니페이 에스크로의 이용사용자로 등록하여 에스크로 서비스를 제공하고 있으며, 귀하의 결제 정보의 보안이 최상의 상태로 유지되고 있습니다. 
                            <br/><b>결제대금예치업 등록번호 : 02-006-00013</b>
                        </p> <!-- //1129 : 수정 -->
                        <div class="security_info">	
                            <!-- 	 
                                    <dl>
                                            <dt>상호</dt>
                                            <dd></dd>
                                            <dt>URL</dt>
                                            <dd></dd>
                                            <dt>사용결제수단</dt>
                                            <dd></dd>
                                            <dt>에스크로 결제수단</dt>
                                            <dd></dd>
                                            <dt>인증상태</dt>
                                            <dd>        ( ~ )
                            </dd>
                                            
                                    </dl>
                            -->
                            <table>
                                <colgroup>
                                    <col width="150"></col>
                                    <col width="*"></col>
                                </colgroup>
                                <tr>
                                    <td class="tit">상호</td>
                                    <td class="cont">다삼</td>
                                </tr>
                                <tr>
                                    <td class="tit">사업자번호</td>
                                    <td class="cont">9019197513</td>
                                </tr>
                                <tr>
                                    <td class="tit">URL</td>
                                    <td class="cont">www.dasam.com</td>
                                </tr>
                                <!-- 
                                <tr>
                                        <td class="tit">사용결제수단</td>
                                        <td class="cont"></td>
                                </tr>
                                -->
                                <tr>
                                    <td class="tit">에스크로 결제수단</td>
                                    <td class="cont">실시간계좌이체,가상계좌</td>
                                </tr>
                                <tr>
                                    <td class="tit">인증상태</dt>
                                        <td class="cont">
                                            <!-- 20141205, 인증상태 수정 by 이현욱 -->
                                            인증 (2016-09-12 ~ 2017-09-11)
                                        </td>
                                </tr>
                            </table>             
                        </div>  
                        <div class="security_note">
                            이니시스 결제 인증마크는 전자결제 No.1 이니시스의 심사를 통과하여 이니시스의 결제 시스템을 탑재한 가맹점만이 이용할 수 있습니다.				
                            <p><a href="#">[이니시스의 결제 시스템의 특징 자세히 보기]</a></p>
                        </div>

                        <div class="btn_wrap ac">
                            <span class="btn vtxt"><a href="#" onclick="window.close();
                                            return false;">닫기</a></span>
                        </div>


                        <!-- //pop content -->
                    </div> 
                </div> 
                <!-- //CONTAINER -->  
            </div>
            <!-- 중지나 해지 일때 -->
        <!-- 중지나 해지 일때 -->

    </body>
        </html>
