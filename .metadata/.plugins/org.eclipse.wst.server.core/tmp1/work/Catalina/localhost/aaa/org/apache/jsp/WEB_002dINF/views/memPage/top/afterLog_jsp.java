/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.39
 * Generated at: 2017-04-02 04:03:33 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.memPage.top;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class afterLog_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<script>\"undefined\"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:\"60168\",secure:\"60173\"},c={nonSecure:\"http://\",secure:\"https://\"},r={nonSecure:\"127.0.0.1\",secure:\"gapdebug.local.genuitec.com\"},n=\"https:\"===window.location.protocol?\"secure\":\"nonSecure\";script=e.createElement(\"script\"),script.type=\"text/javascript\",script.async=!0,script.src=c[n]+r[n]+\":\"+t[n]+\"/codelive-assets/bundle.js\",e.getElementsByTagName(\"head\")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>\r\n");
      out.write("<body data-genuitec-lp-enabled=\"false\" data-genuitec-file-id=\"wc1-126\" data-genuitec-path=\"/aaa/src/main/webapp/WEB-INF/views/memPage/top/afterLog.jsp\">\r\n");
      out.write("\r\n");
      out.write("<div class=\"gnb_area\" data-genuitec-lp-enabled=\"false\" data-genuitec-file-id=\"wc1-126\" data-genuitec-path=\"/aaa/src/main/webapp/WEB-INF/views/memPage/top/afterLog.jsp\">\r\n");
      out.write("\t<div class=\"global\" id=\"globalgnb\">\r\n");
      out.write("\t\t<div class=\"login_on\">\r\n");
      out.write("\t\t\t<a href=\"\" class=\"level");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ memLogin.getM_grade() }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\"\r\n");
      out.write("\t\t\t\ttitle=\"[ ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ showGrade }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write(" ] 등급입니다.\">[ ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ showGrade }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write(" ]</a>\r\n");
      out.write("\t\t\t<a href=\"/aaa/mem/Myshipping\" class=\"user\"\r\n");
      out.write("\t\t\t\ttitle=\"마이페이지로 이동합니다.\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ memLogin.getM_name() }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("님</a>\r\n");
      out.write("\t\t\t<a href=\"/aaa/mem/logOut\" class=\"logout\">로그아웃</a>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<ul>\r\n");
      out.write("            <li><a href=\"/aaa/mem/Myshipping");
      out.write("\">마이페이지</a>\r\n");
      out.write("                <ul>\r\n");
      out.write("\t                <li><a href=\"/aaa/mem/Myshipping\"><span>구매&middot;배송 조회</span></a></li>\r\n");
      out.write("\t                <li><a href=\"/aaa/mem/MyCancel\"><span>취소&middot;환불&middot;교환</span></a></li>\r\n");
      out.write("\t                <li><a href=\"/aaa/mem/MyPoint\"><span>캐쉬&middot;적립금</span></a></li>\r\n");
      out.write("\t\t\t\t\t<li><a onclick=\"gradePop()\" style=\"cursor: pointer;\"><span>회원등급&middot;멤버십</span></a></li>\r\n");
      out.write("                </ul>\r\n");
      out.write("            </li>\r\n");
      out.write("            <li><span class=\"bar\">|</span><a href=\"#\">고객센터</a>\r\n");
      out.write("                <ul>\r\n");
      out.write("\t                <li><a href=\"/aaa/mem/everyQnA\"><span>자주묻는질문</span></a></li>\r\n");
      out.write("\t                <li><a href=\"/aaa/mem/memQnaList\"><span>1:1 문의하기</span></a></li>\r\n");
      out.write("\t                <li><a href=\"/aaa/admin/noticeList\"><span>공지사항</span></a></li>\r\n");
      out.write("                </ul>\r\n");
      out.write("            </li>\r\n");
      out.write("            <li>\r\n");
      out.write("             <span class=\"bar\">|</span>\r\n");
      out.write("            <a style=\"cursor:pointer\" class=\"redirect_cart\">\r\n");
      out.write("            <span class=\"ico_cart\"><img style=\"margin-bottom: 3px;\" alt=\"\" src=\"/aaa/resources/img/yeob/ico_cart.png\">\r\n");
      out.write("            </span>\r\n");
      out.write("            <strong><a href=\"/aaa/cart/memCart\">장바구니</a></strong> \r\n");
      out.write("            <em class=\"num_area\"><strong id=\"cartcc\">0");
      out.write("</strong>\r\n");
      out.write("            <span></span>\r\n");
      out.write("            </em>\r\n");
      out.write("            </a>\r\n");
      out.write("            </li>\r\n");
      out.write("\t\t</ul>\r\n");
      out.write("\t</div>\r\n");
      out.write("</div>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("function gradePop() {\r\n");
      out.write("\tvar url = \"/aaa/main/gradePop\";\t\r\n");
      out.write("\tvar popname = \"등급안내페이지\";\r\n");
      out.write("\tvar size = \"width=745px, height=510px, left=500px, top=200px\";\r\n");
      out.write("\twindow.open(url, popname, size);\r\n");
      out.write("}\r\n");
      out.write("function getCart() {\r\n");
      out.write("\tvar cookieList = document.cookie.split(\";\");\r\n");
      out.write("\tvar cartList;\r\n");
      out.write("\tfor(var i = 0; i <cookieList.length; i++) {\r\n");
      out.write("        var c = cookieList[i];\r\n");
      out.write("        while (c.charAt(0) == ' ') {\r\n");
      out.write("            c = c.substring(1);\r\n");
      out.write("        }\r\n");
      out.write("        if (c.indexOf(\"cart\") == 0) {\r\n");
      out.write("            return c.substring(5, c.length);\r\n");
      out.write("        }\r\n");
      out.write("    }\r\n");
      out.write("\treturn \"\";\r\n");
      out.write("}\r\n");
      out.write("// $(function(){\r\n");
      out.write("\tdocument.cookie = \"cart=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;\";\r\n");
      out.write("\tcc = ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${cartNum!=\"\" ? cartNum : 0}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write(";\r\n");
      out.write("\tdocument.getElementById(\"cartcc\").innerHTML=cc;\r\n");
      out.write("// });\r\n");
      out.write("\tfunction logout() {\r\n");
      out.write("\t\tlocation.href=\"/aaa/mem/logOut\";\r\n");
      out.write("\t}\r\n");
      out.write("</script>\r\n");
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
