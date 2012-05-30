<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/common/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<title>学生贷款记录导入</title>
		<script type="text/javascript">      
	//国家助学贷款学生贷款记录导入
	function rymd_import(){
		window.open("<%=request.getContextPath()%>/edu/stmg/dateimp/date-imp-filed!uploadPage.action?model.dateImpTable.id=2c9c80d2304eb74c01304ecb9d2b0004",'上传页面',"width=900,status=no,toolbar=no, menubar=no,location=no,scrollbars=yes");
	}

    //生源地学生贷款记录导入
	function syd_import(){
		window.open("<%=request.getContextPath()%>/edu/stmg/dateimp/date-imp-filed!uploadPage.action?model.dateImpTable.id=2c9c80e934358a5b0134365e9d0f0008",'上传页面',"width=900,status=no,toolbar=no, menubar=no,location=no,scrollbars=yes");
	}
	
	//function exportExcel(){
       //var form =  document.forms['logForm'];
       //form.action = "<%=request.getContextPath()%>/zxdkgl/zxdkxx_lri!exportExcel.action"; 
       //form.target = "_blank";
      // form.submit();
   // }	
	
</script>
	</head>
	<body>
		<s:form id="logForm" namespace="/zxdkgl"
			action="zxdkxx_lri!pagedQuery.action">
			<s:hidden name="pageSize" id="pageSize" />
			<table cellpadding="1" cellspacing="1" class="search">
				<s:hidden name="idh" />
				<tr class="listr2">
					<td align="right">
						贷款类型
					</td>
					<td align="left">
						<s:select name="entity.dklx"  list="#{'1':'国开行','2':'信用社'}"/>
					</td>
					<td align="right">
						学号
					</td>
					<td align="left">
						<s:textfield name="entity.xh.xh" />
					</td>
					<td align="right">
						姓名
					</td>
					<td align="left">
						<s:textfield name="entity.xm" />
					</td>
				</tr>
				<tr class="listr2">
					<td align="right" colspan="6">
						<s:submit cssClass="search_btn" value="查 询" />
						&nbsp;&nbsp;
						<input name="Submit9" type="reset" class="search_btn" value="重 置" />
					</td>
				</tr>
			</table>
		</s:form>

		<div class="botton">
           <s:if test="entity.dklx==1">
              <input type="button" class="export_btn_all" value="导入"
				onclick="rymd_import()" />
			  &nbsp;
           </s:if>
		  <s:if test="entity.dklx==2">
              <input type="button" class="export_btn_all" value="导入"
				onclick="syd_import()" />
			  &nbsp;
           </s:if>
            <!--  input type="button" value="导出EXCEL" class="export_btn_all" onclick="exportExcel()" />-->
		</div>
		<table cellspacing="1" cellpadding="1" class="tablelist">
        <s:if test="entity.dklx==1">
              <tr>
				<td class="toptitle">
					考生号
				</td>
				<td class="toptitle">
					姓名
				</td>
				<td class="toptitle">
					性别
				</td>
				<td class="toptitle">
					专业
				</td>
				<td class="toptitle">
				        贷款类型
				</td>
				<td class="toptitle">
					入学年份
				</td>
				<td class="toptitle">
					申请年度
				</td>
				<td class="toptitle">
					发放指令批次
				</td>
				<td class="toptitle">
					申请金额
				</td>
				<td class="toptitle">
					申请年限
				</td>
				<td class="toptitle">
					放款金额
				</td>
				<td class="toptitle">
					放款年限
				</td>
				<td class="toptitle">
					放款日期
				</td>
				<td class="toptitle">
					操作
				</td>
			</tr>
        </s:if>
        <s:if test="entity.dklx==2">
               <td class="toptitle">
					学号
				</td>
				<td class="toptitle">
					姓名
				</td>
				<td class="toptitle">
					学院
				</td>
				 <td class="toptitle">
				        贷款类型
				</td>
				<td class="toptitle">
					入学年份
				</td>
				<td class="toptitle">
					申请年度
				</td>
				<td class="toptitle">
				         支付宝帐号
				</td>
				<td class="toptitle">
				         合同编号
				</td>
				<td class="toptitle">
				        高校转账金额
				</td>
				<td class="toptitle">
				       发到高校日期
				</td>
				<td class="toptitle">
				      转账备注
				</td>
				<td class="toptitle">
					操作
				</td>
        </s:if>
			<s:form id="pageList" name="pageList" namespace="/zxdkgl"
				action="zxdkxx_lri!deleteSelect.action">
				<s:iterator value="page.res" status="status">
					<s:if test="#status.even">
						<tr class="listr1" onmouseover="this.className='listr3'"
							onmouseout="this.className='listr1'">
					</s:if>
					<s:else>
						<tr class="listr2" onmouseover="this.className='listr3'"
							onmouseout="this.className='listr2'">
					</s:else>
<s:if test="entity.dklx==1">
					<td>
						&nbsp;
						<s:property value="ksh"/>
					</td>
					<td>
						&nbsp;
						<s:property value="xm"/>
					</td>
					<td>
						&nbsp;
						<s:property value="xb.xbmc"/>
					</td>
					<td>
						&nbsp;
						<s:property value="zy.zymc"/>
					</td>
					<td>
					   <s:if test="dklx==1">
					               国家助学贷款
					   </s:if>
					</td>
					<td>
						&nbsp;
                        <s:date format="yyyy年MM月dd日 " name="rxny"/>					
                    </td>
					<td>
						&nbsp;
						<s:property value="sqnd"/>年
					</td>
					<td>
						&nbsp;
						<s:property value="ffzlpc"/>
					</td>
					<td>
						&nbsp;
						<s:property value="sqje"/>
					</td>
					<td>
						&nbsp;
						<s:property value="sqnx"/>
					</td>
					<td>
						&nbsp;
						<s:property value="fkje"/>
					</td>
					<td>
						&nbsp;
						<s:property value="fknx"/>
					</td>
					<td>
						&nbsp;
						 <s:date format="yyyy年MM月dd日" name="fkrq"/>
					</td>
</s:if>
<s:if test="entity.dklx==2">
                   <td>
						&nbsp;
						<s:property value="xh.xh"/>
					</td>
                    <td>
						&nbsp;
						<s:property value="xh.xm"/>
					</td>
                    <td>
						&nbsp;
						<s:property value="xh.yx.dwmc"/>
					</td>
					<td>
					   <s:if test="dklx==2">
					               生源地贷款
					   </s:if>
					</td>
                    <td>
						&nbsp;
                        <s:date format="yyyy年MM月dd日" name="xh.rxny"/>
					</td>
					<td>
						&nbsp;
						<s:property value="sqnd"/>年
					</td>
                    <td>
						&nbsp;
						<s:property value="zfbzh"/>
					</td>
                    <td>
						&nbsp;
						<s:property value="htbh"/>
					</td>
                    <td>
						&nbsp;
						<s:property value="gxzzje"/>
					</td>
                    <td>
						&nbsp;
						<s:date format="yyyy年MM月dd日" name="fdgxrq"/>
					</td>
                    <td>
						&nbsp;
						<s:property value="zzremark"/>
					</td>
</s:if>
					<td>
					    &nbsp;
					    
						<s:url id="sbjybUrl" namespace="/zxdkgl"
							action="zxdkxx_lri!exportExcel.action">
							<s:param name="ksh">
								<s:if test="dklx==1">
									<s:property value="ksh" />
								</s:if>
								<s:if test="dklx==2">
									<s:property value="xh.ksh" />
								</s:if>
								
							</s:param>
						</s:url>
						<s:a href='%{sbjybUrl}'>上报教育部</s:a>
						&nbsp;
						<s:url id="viewUrl" namespace="/zxdkgl"
							action="zxdkxx_lri!view.action">
							<s:param name="id">
								<s:property value="id" />
							</s:param>
						</s:url>
						<s:a href='%{viewUrl}'>查看</s:a>
					</td>
					</tr>
				</s:iterator>
			</s:form>
			<s:set var="totle" scope="request" value="page.count" />
			<s:set var="pageSize" scope="request" value="pageSize" />
			<%
				Integer count = (Integer) request.getAttribute("totle");
				Integer pageSize = (Integer) request.getAttribute("pageSize");
			%>

			<tr>
				<td class="listr4" colspan="17">
					<pg:pager url="zxdkxx_lri!pagedQuery.action"
						items='<%=count.intValue()%>' maxPageItems='<%=pageSize%>'
						export="currentPage=pageNumber">
						<pg:param name="entity.dklx"/>
						<pg:param name="entity.xh.xh" />
						<pg:param name="pageSize" />
						<pg:index export="pages">
						<pg:param name="zy" />
						<pg:param name="entity.xy.dwdm" />
							<table>
								<tr>
									<td>
										当前
										<b class="fontred"><%=currentPage%></b>/<%=pages%>页&nbsp;&nbsp;&nbsp;&nbsp;
									</td>
									<td>
										<pg:first>
											<a href="<%=pageUrl%>&pageNo=<%=pageNumber%>">首页</a>
										</pg:first>
									</td>
									<td>
										<pg:prev>
											<a href="<%=pageUrl%>&pageNo=<%=pageNumber%>">上一页</a>
										</pg:prev>
									</td>
									<td>
										<pg:pages>
											<%
												if (currentPage == pageNumber) {
											%>
											<font color="red"><%=pageNumber%></font>
											<%
												} else {
											%>
											<a href="<%=pageUrl%>&pageNo=<%=pageNumber%>"><%=pageNumber%></a>
											<%
												}
											%>
										</pg:pages>
									</td>
									<td>
										<pg:next>
											<a href="<%=pageUrl%>&pageNo=<%=pageNumber%>">下一页</a>
										</pg:next>
									</td>
									<td>
										<pg:last>
											<a href="<%=pageUrl%>&pageNo=<%=pageNumber%>">末页</a>&nbsp;&nbsp;&nbsp;&nbsp;
				</pg:last>
									</td>

									<td>
										&nbsp;共
										<font color="red"><%=count.intValue()%></font>条
									</td>
									<td style="padding-left: 10px;">
										每页显示的记录数
									</td>
									<td>
										<input type="text" class="inputDftText" value="<%=pageSize%>"
											onchange="javascript:checkPageSize(this.value,<%=count.intValue()%>,Ext.get('logForm').dom)" />
									</td>
									<td>
										条
									</td>
									<td>
										&nbsp;
									</td>
								</tr>
							</table>
						</pg:index>
					</pg:pager>
				</td>
			</tr>
		</table>
	</body>
</html>