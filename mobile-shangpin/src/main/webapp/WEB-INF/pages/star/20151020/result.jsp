<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common/include.inc.jsp"%>

<rapid:override name="title">
	尚品网CEO红包,快抢！
</rapid:override>
<rapid:override name="custum">
	<link href="${cdn:css(pageContext.request)}/styles/shangpin/css/star-packet/20151020/base.css${ver}" rel="stylesheet" />
	<link href="${cdn:css(pageContext.request)}/styles/shangpin/css/star-packet/20151020/ceo_packet.css${ver}" rel="stylesheet" />
</rapid:override>

<rapid:override name="page_title">
	尚品网CEO红包,快抢！
</rapid:override>

<rapid:override name="content">
 <input type="hidden" id="amount" value="${amount }">
 <input type="hidden" name="_shareUrl"  id="_shareUrl"  value="http://m.shangpin.com/star/index?star=ceo"/>
	<input type="hidden" name="_mainTitle"  id="_mainTitle"  value="尚品网CEO，1亿红包任性送，人人有份，快来抢现金！"/>
	<input type="hidden" name="_mainDesc"  id="_mainDesc"  value="更有尚品网轻奢购物狂欢节，10月22日-28日 精彩不容错过。"/>
	<input type="hidden" name="_mainImgUrl" id="_mainImgUrl"  value="${cdn:pic(pageContext.request)}/styles/shangpin/images/star-packet/20151020/300X300.jpg"/>
	<input type="hidden" name="_currentUrl" id="_currentUrl"  value=""/>
<div class="wapper1">
 
  <!--内容区域 start-->
  <section class="main main-box">  
    <div class="img-box bg-box">
    	<i class="right_tag_icon"><img src="${cdn:pic(pageContext.request)}/styles/shangpin/images/star-packet/20151020/right_tag_icon.png" ></i>
        <div class="red-val">
          <!--<h3><i><img src="img/packet_icon.png" width="42" ></i>恭喜您获得了</h3>-->
          <img src="${cdn:pic(pageContext.request)}/styles/shangpin/images/star-packet/20151020/win_img.png" />
          <h4>
          <c:if test="${amount ne '0'}">
          <em>${amount }</em>元现金和
          </c:if>
          <em>1020</em>元红包</h4>
        </div>
    </div>
    <div class="img-box bg-box show-cash">
    	<i class="title_tag"><img src="${cdn:pic(pageContext.request)}/styles/shangpin/images/star-packet/20151020/title_tag02.png" ></i>
        <img src="${cdn:pic(pageContext.request)}/styles/shangpin/images/star-packet/20151020/ewm_img.png" >
    </div>
    <div class="img-box bg-box">
    	<i class="title_tag"><img src="${cdn:pic(pageContext.request)}/styles/shangpin/images/star-packet/20151020/title_tag01.png" ></i>
    	<p class="user-red-text">1020元红包将在10分钟内存入您尚品网账户中，使用手机号${phoneNum}登录尚品网APP，即可在“个人中心”中查看我的优惠券。</p>
        <p class="coupon-p"><img src="${cdn:pic(pageContext.request)}/styles/shangpin/images/star-packet/20151020/c_img1.png" ></p>
        <p class="coupon-p"><img src="${cdn:pic(pageContext.request)}/styles/shangpin/images/star-packet/20151020/c_img2.png" ></p>
        <p class="coupon-p"><img src="${cdn:pic(pageContext.request)}/styles/shangpin/images/star-packet/20151020/c_img3.png" ></p>
        <p class="coupon-p"><img src="${cdn:pic(pageContext.request)}/styles/shangpin/images/star-packet/20151020/c_img4.png" ></p>
        <p class="coupon-p"><img src="${cdn:pic(pageContext.request)}/styles/shangpin/images/star-packet/20151020/c_img5.png" ></p>
        <p class="coupon-p"><img src="${cdn:pic(pageContext.request)}/styles/shangpin/images/star-packet/20151020/c_img6.png" ></p>
        <p class="coupon-p"><img src="${cdn:pic(pageContext.request)}/styles/shangpin/images/star-packet/20151020/c_img7.png" ></p>
        <p class="coupon-p"><img src="${cdn:pic(pageContext.request)}/styles/shangpin/images/star-packet/20151020/c_img8.png" ></p>
    </div>
	
    <div class="bg-box1"> 
    <a href="${ctx }/subject/product/list?topicId=51018647">  
    <img src="${cdn:pic(pageContext.request)}/styles/shangpin/images/star-packet/20151020/ad_img01.jpg"> 
    </a>
    </div>
    <div class="bg-box1">  
    <a href="${ctx }/meet/368">  
    <img src="${cdn:pic(pageContext.request)}/styles/shangpin/images/star-packet/20151020/ad_img02.jpg">
    </a>
    </div>
    <div class="bg-box1">
    <a href="http://m.shangpin.com/download"> 
      <img src="${cdn:pic(pageContext.request)}/styles/shangpin/images/star-packet/20151020/ad_img03.jpg">
    </a>     
    </div>
    
    <p class="link_box">
        <!--<a class="download-btn" href="#">99元活动专区</a>
        <a class="download-btn" href="#">199元活动专区</a>-->
        <span class="clr">
        	<a href="${ctx }/red/coupon/rule">如何使用</a>
            <a href="${ctx }/coupon/list">查看我的券</a>
        </span>
    </p>
    <p class="service-phone">如您在领取现金或红包过程中遇到任何问题<br>请立即致电尚品网客服 <a href="tel:4006-900-900">4006－900-900</a></p>
    <!---->
    
  </section>
  <!--内容区域 start-->
    
</div>
</rapid:override>

<rapid:override name="static_file">
    <script src="${cdn:js(pageContext.request)}/styles/weixin/jweixin-1.0.0.js${ver}" type="text/javascript" charset="utf-8"></script>
	<script src="${cdn:js(pageContext.request)}/styles/shangpin/js/star-packet/20151020/jquery.min.js${ver}" type="text/javascript" charset="utf-8"></script>
	<script src="${cdn:js(pageContext.request)}/styles/shangpin/js/star-packet/20151020/weixin_ready.js${ver}" type="text/javascript" charset="utf-8"></script>
	<script src="${cdn:js(pageContext.request)}/styles/shangpin/js/star-packet/20151020/ceo_packet.js${ver}" type="text/javascript" charset="utf-8"></script>
</rapid:override>

<%@ include file="/WEB-INF/pages/common/star_red_packet_base.jsp" %>