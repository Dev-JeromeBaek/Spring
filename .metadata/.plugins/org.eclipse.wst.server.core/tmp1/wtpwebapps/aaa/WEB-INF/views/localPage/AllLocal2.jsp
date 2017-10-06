<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
/* Demo purposes only */
$(".hover").mouseleave(
  function() {
    $(this).removeClass("hover");
  }
);
</script>

<style type="text/css">
@import url(http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css);
@import url(https://fonts.googleapis.com/css?family=Oswald:300,400);
.snip1492 {
  font-family: 'Oswald', Arial, sans-serif;
  position: relative;
  float: left;
  margin: 10px 1%;
  min-width: 230px;
  max-width: 315px;
  width: 100%;
  background: #ffffff;
  text-align: center;
  color: #000000;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.15);
  font-size: 16px;
}

.snip1492 * {
  -webkit-box-sizing: border-box;
  box-sizing: padding-box;
  -webkit-transition: all 0.2s ease-out;
  transition: all 0.2s ease-out;
}

.snip1492 img {
  max-width: 100%;
  vertical-align: top;
  position: relative;
  background-color: #666666;
  padding-top: 40px;
}

.snip1492 figcaption {
  padding: 20px;
}

.snip1492 h3,
.snip1492 p {
  margin: 0;
}

.snip1492 h3 {
  font-size: 1.3em;
  font-weight: 400;
  margin-bottom: 5px;
  text-transform: uppercase;
}

.snip1492 p {
  font-size: 0.9em;
  letter-spacing: 1px;
  font-weight: 300;
}

.snip1492 .price {
  font-weight: 500;
  font-size: 1.4em;
  line-height: 48px;
  letter-spacing: 1px;
}

.snip1492 .price s {
  margin-right: 5px;
  opacity: 0.5;
  font-size: 0.9em;
}

.snip1492 i {
  position: absolute;
  top: 0;
  left: 50%;
  -webkit-transform: translate(-50%, 0%);
  transform: translate(-50%, 0%);
  width: 56px;
  line-height: 56px;
  text-align: center;
  border-radius: 50%;
  background-color: #666666;
  color: #ffffff;
  font-size: 36px;
}

.snip1492 a {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  z-index: 1;
}

.snip1492:hover i,
.snip1492.hover i,
.snip1492:hover img,
.snip1492.hover img {
  background-color: #2980b9;
}

.snip1492:hover i,
.snip1492.hover i {
  -webkit-transform: translate(-50%, 5px);
  transform: translate(-50%, 5px);
}


/* Demo purposes only */

body {
  background-color: #212121;
}

</style>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60168",secure:"60173"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-66" data-genuitec-path="/aaa/src/main/webapp/WEB-INF/views/localPage/AllLocal2.jsp">
<c:forEach var="i" items="${detail}"> 
<figure class="snip1492">
  <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sample85.jpg" alt="sample85" />
  <figcaption>
    <h3>상품 ${i.dd_name}</h3>
    <p>수량${i.dd_amount}</p>
    <div class="price">
      <s>$24.00</s>가격${i.dd_price}></s>
    </div>
  </figcaption><i class="ion-plus-round"></i>
  <a href="#"></a>
</figure>
</c:forEach>

</body>
</html>

