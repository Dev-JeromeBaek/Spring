<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <style type="text/css">
    .arrow {
	float: right;
	}
    
    </style>

    <title>SB Admin 2 - Bootstrap Admin Theme</title>

    <!-- Bootstrap Core CSS -->
    <link href="/aaa/resources/bootstrap.min.css" rel="stylesheet">

	 <!-- jQuery -->
    <script src="/aaa/resources/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/aaa/resources/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/aaa/resources/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/aaa/resources/sb-admin-2.js"></script>
	

<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60168",secure:"60173"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>

<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-54" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/corpPage/individual/left/corpMenu.jsp">
	<div class="navbar-default sidebar" role="navigation" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-54" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/corpPage/individual/left/corpMenu.jsp">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                </button>
                            </span>
                            </div>
                            <!-- /input-group -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-dashboard fa-fw"></i> Home</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> 나의 딜 보기<span class="arrow">▼</span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/aaa/idvCorp/showApproveDealList"> └ 판매중 딜</a>
                                </li>
                                <li>
                                    <a href="/aaa/idvCorp/showWaitDealList"> └ 승인 대기 딜</a>
                                </li>
                                <li>
                                    <a href="/aaa/idvCorp/showCancelDealList"> └ 승인 취소 딜</a>
                                </li>
                                <li>
                                    <a href="/aaa/idvCorp/showDealListAll"> └ 모아보기</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-sitemap fa-fw"></i> 판매 현황<span class="arrow">▼</span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="#"> └ 매출 관리<span class="arrow">▼</span></a>
                                    <ul class="nav nav-third-level">
                                        <li>
                                            <a href="/aaa/idvCorp/showSalesAll">  └ 전체 매출 보기</a>
                                        </li>
                                        <li>
                                            <a href="/aaa/idvCorp/showSalesMonth">  └ 이번달 매출 보기</a>
                                        </li>
                                        <li>
                                            <a href="/aaa/idvCorp/showSalesWeek">  └ 이번주 매출 보기</a>
                                        </li>
                                        <li>
                                            <a href="/aaa/idvCorp/showSalesDay">  └ 오늘 매출 보기</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#"> └ 고객 관리<span class="arrow">▼</span></a>
                                    <ul class="nav nav-third-level">
                                        <li>
                                            <a href="/aaa/idvCorp/dealQnA">  └ 상품 Q&A관리</a>
                                        </li>
                                        <li>
                                            <a href="/aaa/idvCorp/memBuyList">  └ 구매고객 리스트</a>
                                        </li>
                                        <li>
                                            <a href="/aaa/idvCorp/TopDealList">  └ 딜 리스트(인기)</a>
                                        </li>
                                        <li>
                                            <a href="#">  └ ----</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#"> └ 딜 관리<span class="arrow">▼</span></a>
                                    <ul class="nav nav-third-level">
                                        <li>
                                            <a href="/aaa/idvCorp/dealInsert">  └ 딜 추가하기</a>
                                        </li>
                                        <li>
                                            <a href="/aaa/idvCorp/dealModify">  └ 딜 수정하기</a>
                                        </li>
                                        <li>
                                            <a href="/aaa/idvCorp/dealDelete">  └ 딜 삭제하기</a>
                                        </li>
                                    </ul>
                                    <!-- /.nav-third-level -->
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-files-o fa-fw"></i> My Page<span class="arrow">▼</span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/aaa/idvCorp/corpModify"> └ 정보 수정</a>
                                </li>
                                <li>
                                    <a href="/aaa/idvCorp/corpLeave"> └ 회원 탈퇴</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a onclick="closePop()" style="cursor: pointer;"><i class="fa fa-table fa-fw"></i> 페이지 닫기</a>
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
<script type="text/javascript">
	function closePop() {
		self.close();
	}
</script>
</body>
</html>
