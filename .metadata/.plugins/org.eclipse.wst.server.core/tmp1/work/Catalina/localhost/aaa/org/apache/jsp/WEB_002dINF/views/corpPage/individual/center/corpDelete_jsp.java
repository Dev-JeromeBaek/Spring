/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.39
 * Generated at: 2017-04-02 01:16:44 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.corpPage.individual.center;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class corpDelete_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("jar:file:/C:/Users/Yeob's/Desktop/eclipse/Spring_Works/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/aaa/WEB-INF/lib/jstl-1.2.jar!/META-INF/c.tld", Long.valueOf(1153352682000L));
    _jspx_dependants.put("/WEB-INF/lib/jstl-1.2.jar", Long.valueOf(1487668142835L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

final java.lang.String _jspx_method = request.getMethod();
if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
return;
}

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("    \r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("\t<meta charset=\"UTF-8\">\r\n");
      out.write("\t<title>Insert title here</title>\r\n");
      out.write("\t<style type=\"text/css\">\r\n");
      out.write("\t\t.cancelLegend {\r\n");
      out.write("\t\t\tfont-family: \"스웨거 TTF\";\r\n");
      out.write("\t\t\tfont-style: bold;\r\n");
      out.write("\t\t\tfont-size: 40px;\r\n");
      out.write("\t\t\ttext-decoration: none;\r\n");
      out.write("\t\t\tborder: none;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t.corpDeleteField {\r\n");
      out.write("\t\t\twidth: auto;\r\n");
      out.write("\t\t\theight: auto;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tp {\r\n");
      out.write("\t\t\tfont-size: large;\r\n");
      out.write("\t\t\tfont-family: \"배달의민족 한나는 열한살\";\r\n");
      out.write("\t\t\tcolor: red;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t</style>\r\n");
      out.write("<script>\"undefined\"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:\"60168\",secure:\"60173\"},c={nonSecure:\"http://\",secure:\"https://\"},r={nonSecure:\"127.0.0.1\",secure:\"gapdebug.local.genuitec.com\"},n=\"https:\"===window.location.protocol?\"secure\":\"nonSecure\";script=e.createElement(\"script\"),script.type=\"text/javascript\",script.async=!0,script.src=c[n]+r[n]+\":\"+t[n]+\"/codelive-assets/bundle.js\",e.getElementsByTagName(\"head\")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>\r\n");
      out.write("<body data-genuitec-lp-enabled=\"false\" data-genuitec-file-id=\"wc1-29\" data-genuitec-path=\"/aaa/src/main/webapp/WEB-INF/views/corpPage/individual/center/corpDelete.jsp\">\r\n");
      out.write("\t<br data-genuitec-lp-enabled=\"false\" data-genuitec-file-id=\"wc1-29\" data-genuitec-path=\"/aaa/src/main/webapp/WEB-INF/views/corpPage/individual/center/corpDelete.jsp\">\r\n");
      out.write("\t<fieldset class=\"corpDeleteField\">\r\n");
      out.write("\t<legend class=\"cancelLegend\">[ 기업회원 탈퇴 신청 ]</legend>\r\n");
      out.write("\t\t<div style=\"border: 3px solid #E5E5E5; padding: 10px; text-align: left;\">\r\n");
      out.write("\t\t&nbsp;&nbsp;&nbsp;&nbsp;회원 탈퇴 신청에 앞서 아래의 사항을 반드시 확인하여 주시기 바랍니다.<br>\r\n");
      out.write("\t\t1. 회원탈퇴 시 처리내용<br>\r\n");
      out.write("\t\t&nbsp;(1) 다삼캐쉬·적립금: 잔여 금액은 소멸되며 환불되지 않습니다.<br>\r\n");
      out.write("\t\t&nbsp;(2) 보유 정보: 다삼 구매 정보가 삭제됩니다.<br>\r\n");
      out.write("\t\t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;단, 티켓 구매 특성상 유효기간이 남은 미사용 티켓 관련 정보는 삭제되지 아니하고 유효기간 만료일까지 보관됩니다.<br>\r\n");
      out.write("\t\t&nbsp;(3) 소비자보호에 관한 법률 제6조(거래기록의 보전 등) 및 동법 시행령 제6조에 의거,<br>\r\n");
      out.write("\t\t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* 계약 또는 청약철회 등에 관한 기록은5년,<br>\r\n");
      out.write("\t\t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;대금결제 및 재화등의 공급에 관한 기록은5년,<br>\r\n");
      out.write("\t\t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* 소비자의 불만 또는 분쟁처리에 관한 기록은3년동안 보관됩니다.<br>\r\n");
      out.write("\t\t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;동 개인정보는 법률에 의한 경우가 아니고서는 보유 되어지는 이외의 다른 목적으로는 이용되지 않습니다.<br>\r\n");
      out.write("\t\t&nbsp;(4) 회원 정보: 회원탈퇴 완료 시 당사 사이트 이용 권한이 삭제되며,<br>\r\n");
      out.write("\t\t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;기존 구매 티켓에 대한 본인인증 필요성 등을 위해 회원가입에 따른 사용자정보는 6개월 동안<br>\r\n");
      out.write("\t\t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;보관됩니다.<br>\r\n");
      out.write("\t\t2. 회원탈퇴 시 게시물 관리<br>\r\n");
      out.write("\t\t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원탈퇴 후 당사 사이트에 입력하신 게시물 및 댓글은 삭제되지 않으며, 회원정보 삭제로 인해 작성자 본인을 확인할 수 없으므로 <br>\r\n");
      out.write("\t\t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;게시물 편집 및 삭제 처리가 원천적으로 불가능 합니다. 게시물 삭제를 원하시는 경우에는 먼저 해당 게시물을 삭제 하신 후,<br>\r\n");
      out.write("\t\t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;탈퇴를 신청하시기 바랍니다.<br>\r\n");
      out.write("\t\t3. 회원탈퇴 후 재가입 규정<br>\r\n");
      out.write("\t\t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;탈퇴 회원이 재가입하더라도 기존의 다삼 적립금은 이미 소멸되었으므로 현재의 다삼 적립금에 양도되지 않습니다.<br>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<br>\r\n");
      out.write("\t\t<div><input type=\"checkbox\" class=\"chee\"><span>위 내용을 모두 확인하였습니다</span></div>\r\n");
      out.write("\t\t<br>\r\n");
      out.write("\t\t<div style=\"width: 500px; margin-left: 450px;\">\r\n");
      out.write("\t\t\t<fieldset>\r\n");
      out.write("\t\t\t\t<legend style=\"font-size: large; border: 0px solid white;\"><strong>회원탈퇴를 위한 회원정보 인증절차</strong></legend>\r\n");
      out.write("\t\t\t\t<div style=\"font-size: small;\">회원가입 시 등록한 정보를 입력해주세요</div><br>\r\n");
      out.write("\t\t\t\t<div style=\"text-align: left;\">\r\n");
      out.write("\t\t\t\t\t<div>\r\n");
      out.write("\t\t\t\t\t\t<span style=\"margin-left: 70px;\">회사 이름 </span>\r\n");
      out.write("\t\t\t\t\t\t<span style=\"margin-left: 35px;\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ corpLogin.getC_name() }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</span>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div>\r\n");
      out.write("\t\t\t\t\t\t<span style=\"margin-left: 70px;\">비밀 번호 </span>\r\n");
      out.write("\t\t\t\t\t\t<span style=\"margin-left: 30px;\"><input type=\"password\" id=\"corpPassword\" \r\n");
      out.write("\t\t\t\t\t\t\tautocomplete=\"off\" placeholder=\"비밀번호를 입력하세요\"><br></span>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div>\r\n");
      out.write("\t\t\t\t\t\t<span style=\"margin-left: 70px;\">대표 이름 </span>\r\n");
      out.write("\t\t\t\t\t\t<span style=\"margin-left: 30px;\"><input type=\"text\" id=\"corpCeoName\" \r\n");
      out.write("\t\t\t\t\t\t\tautocomplete=\"off\" placeholder=\"대표자 이름을 입력하세요\"></span>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</fieldset>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<p align=\"center\">&nbsp;\r\n");
      out.write("\t\t<button onclick=\"deleteCheck()\" \r\n");
      out.write("\t\t\tstyle=\"cursor: pointer; \r\n");
      out.write("\t\t\t\tbackground-color: #FFDF32; \r\n");
      out.write("\t\t\t\twidth: 180px;\r\n");
      out.write("\t\t\t\theight: 50px;\r\n");
      out.write("\t\t\t\tcolor: white; \r\n");
      out.write("\t\t\t\tfont-size: large;\">회원탈퇴</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n");
      out.write("\t\t<button onclick=\"deleteCancel()\"\r\n");
      out.write("\t\t\tstyle=\"cursor: pointer; \r\n");
      out.write("\t\t\t\tborder: 1px solid #A8A8A9;\r\n");
      out.write("\t\t\t\twidth: 180px;\r\n");
      out.write("\t\t\t\theight: 50px;\r\n");
      out.write("\t\t\t\tcolor: black;\r\n");
      out.write("\t\t\t\tfont-size: large;\">취소하기</button>&nbsp;\r\n");
      out.write("\t\t</p>\r\n");
      out.write("\t</fieldset>\r\n");
      out.write("\t<script type=\"text/javascript\">\r\n");
      out.write("\t\tfunction deleteCheck() {\r\n");
      out.write("\t\t\tif(!document.getElementsByClassName(\"chee\").item(0).checked){\r\n");
      out.write("\t\t\t\talert(\"위 사항에 동의함에 체크해주세요.\");\r\n");
      out.write("\t\t\t\treturn;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tif(document.getElementById(\"corpPassword\").value != \"\") {\r\n");
      out.write("\t\t\t\tif(document.getElementById(\"corpCeoName\").value != \"\") {\r\n");
      out.write("\t\t\t\t\tvar pwCheck = document.getElementById(\"corpPassword\").value;\r\n");
      out.write("\t\t\t\t\tvar ceoCheck = document.getElementById(\"corpCeoName\").value;\r\n");
      out.write("\t\t\t\t\tvar params = \"c_pw=\"+pwCheck+\"&c_ceo=\"+ceoCheck;\r\n");
      out.write("\t\t\t\t\tsendRequest(\"/aaa/idvCorp/deleteCorpCheck\", params, haha, \"post\");\r\n");
      out.write("\t\t\t\t} else {\r\n");
      out.write("\t\t\t\t\talert(\"대표자 명을 입력해주세요.\");\r\n");
      out.write("\t\t\t\t\tdocument.getElementById(\"corpCeoName\").focus();\r\n");
      out.write("\t\t\t\t\treturn;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t} else {\r\n");
      out.write("\t\t\t\talert(\"비밀번호를 입력해주세요.\");\r\n");
      out.write("\t\t\t\tdocument.getElementById(\"corpPassword\").focus();\r\n");
      out.write("\t\t\t\treturn;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tfunction haha() {\r\n");
      out.write("\t\t\tif(httpRequest.readyState == 4) {\r\n");
      out.write("\t\t\t\tif(httpRequest.status == 200) {\r\n");
      out.write("\t\t\t\t\tvar rcvData = httpRequest.responseText;\r\n");
      out.write("\t\t\t\t\tif(rcvData == \"정보가 올바르게 삭제되었습니다.\") {\r\n");
      out.write("\t\t\t\t\t\topener.location.href=\"/aaa/corp/corpLogout?deleteCorp=YES\";\r\n");
      out.write("\t\t\t\t\t\tself.close();\r\n");
      out.write("\t\t\t\t\t} else if(rcvData == \"비밀번호가 일치하지 않습니다.\") {\r\n");
      out.write("\t\t\t\t\t\tdocument.getElementById(\"corpPassword\").value = \"\";\r\n");
      out.write("\t\t\t\t\t\tdocument.getElementById(\"corpPassword\").focus();\r\n");
      out.write("\t\t\t\t\t} else if(rcvData == \"대표자 정보가 일치하지 않습니다.\") {\r\n");
      out.write("\t\t\t\t\t\tdocument.getElementById(\"corpCeoName\").value = \"\";\r\n");
      out.write("\t\t\t\t\t\tdocument.getElementById(\"corpCeoName\").focus();\r\n");
      out.write("\t\t\t\t\t} else {\r\n");
      out.write("\t\t\t\t\t\talert(rcvData);\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t} else {\r\n");
      out.write("\t\t\t\t\talert(\"*** 실패 : \" + httpRequest.status);\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tfunction deleteCancel() {\r\n");
      out.write("\t\t\tlocation.href=\"/aaa/idvCorp/corpHome\";\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\r\n");
      out.write("\t</script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}