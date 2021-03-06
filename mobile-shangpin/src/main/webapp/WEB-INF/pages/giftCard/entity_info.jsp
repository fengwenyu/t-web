 <%@ page language="java" contentType="text/html; charset=UTF-8"
	trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/common/include.inc.jsp"%>
 
 <div class="product_info">
        <div>
          <ul class="tab_info">
            <li class="curr" id="product_tab_1"><span>图文详情</span></li>
            <c:if test="${productDetail.basic.isSize=='1'}">
           		<li id="product_tab_2"><span>尺码及试穿</span></li>
            </c:if>
            <c:if test="${productDetail.basic.isBrandStyle=='1'}">
           		<li id="product_tab_3"><span>品牌风尚</span></li>
            </c:if>
            <li id="product_tab_4"><span>评论<em>（${productDetail.basic.commentCount }）</em></span></li>
          </ul>
        </div>
        <div class="content_info">
          <div class="content_rand content_list rule-box">
              <section>
              	<p class="center_txt">
                	<img src="${cdn:js(pageContext.request)}/styles/shangpin/images/e.gif" lazy="${cdn:js(pageContext.request)}/styles/shangpin/images/giftcard/detail/e_giftcard02.png" />
                    <span>选择尚品、乐享生活</span>
                </p>
                
                <h3>购卡无忧</h3>
                <ul class="notice">
                	<li class="center_img"><img src="${cdn:js(pageContext.request)}/styles/shangpin/images/e.gif" lazy="${cdn:js(pageContext.request)}/styles/shangpin/images/giftcard/detail/dot03.png" /></li>
                    <li class="center_txt"><span>实物卡高端、大气、上档次，<br/>让您的“TA”倍有面子</span></li>
                </ul>
                <ul class="notice">
                    <li class="center_txt"><span>全面、高效、安全的配送体<br />系，及时传递祝福</span></li>
                	<li class="center_img"><img src="${cdn:js(pageContext.request)}/styles/shangpin/images/e.gif" lazy="${cdn:js(pageContext.request)}/styles/shangpin/images/giftcard/detail/dot04.png" /></li>
                </ul>
                <ul class="notice">
                	<li class="center_img"><img src="${cdn:js(pageContext.request)}/styles/shangpin/images/e.gif" lazy="${cdn:js(pageContext.request)}/styles/shangpin/images/giftcard/detail/dot05.png" /></li>
                    <li class="center_txt"><span>支持千万种商品购买，总有让<br />“TA”满意的一款</span></li>
                </ul>
                
                <h3>用卡无忧</h3>
                <ul class="notice">
                	<li class="center_img"><img src="${cdn:js(pageContext.request)}/styles/shangpin/images/e.gif" lazy="${cdn:js(pageContext.request)}/styles/shangpin/images/giftcard/detail/dot01.png" /></li>
                    <li class="center_txt"><span>安全绑定，礼品卡无被盗风险</span></li>
                </ul>
                <ul class="notice">
                    <li class="center_txt"><span>秘钥支付，安全放心</span></li>
                	<li class="center_img"><img src="${cdn:js(pageContext.request)}/styles/shangpin/images/e.gif" lazy="${cdn:js(pageContext.request)}/styles/shangpin/images/giftcard/detail/dot02.png" /></li>
                </ul>
                
                <h3>礼品卡使用规则</h3>
                <article>
                	<p>1.尚品礼品卡目前支持在尚品网www.shangpin全网站使用。</p>
                    <p>2.本卡不记名，不挂失，不兑现，请在收到卡片后即刻充值，充值完成后，卡片丢失无资金风险。</p>
                    <p>3.支付订单时，可选择“礼品卡支付”，我们支持多张卡片组合支付，支持礼品卡与其他支付方式组合支付。</p>
                    <p>4.如订单发生退款，使用礼品卡支付的部分，钱款将退回到卡账户中。</p>
                    <p>5.购买实物礼品卡开具普通发票。使用礼品卡支付的商品将不再提供发票。</p>
                    <p>6.本卡在余额未发生变动且赠品未使用的情况下，可支持退货。</p>
                    <p>7.本卡从售卡日起有效期3年，请在有效期内使用。</p>
                </article>
                
                
              </section>
            </div>
<!--           <div class="content_size content_list nobottom border_bottom" id="tabs_txt0" style="display:none"> -->
<!--           <div class="no_comment"> <p>暂无评论</p> </div> -->
<!--           </div> -->
          <!--评论start-->
          <div class="clr content_list nobottom border_bottom" id="for_comments" style="display:none">
            <div class="comment_height">
           </div>
           <c:if test="${productDetail.basic.commentCount*1 >3}">
	  			<div class="product_comment">
		              <a href="javascript:;" class="maintenance moreComment">
		                <span>查看更多评论</span>
		              </a>
		              <a href="javascript:;" class="maintenance putAwayComment hidden">
		                <span>收起评论</span>
		              </a>
	            </div>
          </c:if>
          	<input type="hidden" id ="pageIndex" name="pageIndex" value="1"/>
          	<input type="hidden" id ="commentCount" name="commentCount" value="${productDetail.basic.commentCount }"/>
          </div>
      </div>
      <!--评论end-->
    </div>  