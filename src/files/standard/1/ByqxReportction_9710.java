package com.sungard.edu.bygl.qxgl.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.king.DbfUtil;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.sungard.edu.bygl.qxgl.domain.ByglByqxlb;
import com.sungard.edu.bygl.qxgl.domain.Byqx;
import com.sungard.edu.bygl.qxgl.domain.Byqxtxsm;
import com.sungard.edu.bygl.qxgl.service.IByqxReportService;
import com.sungard.edu.bygl.qxgl.service.IByqxService;
import com.sungard.edu.bygl.qxgl.service.IByqxtxsmService;
import com.sungard.edu.util.ExportExcel;
import com.sungard.framework.app.ApplicationParameter;
import com.sungard.framework.domain.PublicCode;
import com.sungard.framework.security.UserUtil;
import com.sungard.framework.service.CodeException;
import com.sungard.framework.util.CodeUtil;
import com.sungard.framework.util.Utility;
import com.sungard.framework.util.date.DateHelper;

/**
 * 去向报表
 * @author GQ
 *
 */
@SuppressWarnings({"serial","unchecked"})
@Scope("prototype")
@Controller
public class ByqxReportction extends ActionSupport{

	private IByqxtxsmService byqxtxsmService;
	private IByqxService byqxService;
	private IByqxReportService byqxReportService;
	private Byqx model;
	
	private String xh;
	private String byqxlbdm;
	private ByglByqxlb byqxlb;
	private Byqxtxsm byqxtxsm;
	
	private List<PublicCode> listnf;
	private List<ByglByqxlb> listQxlb;
	private List<PublicCode> yxdmList;
	private List<PublicCode> zydmList;
	private List<PublicCode> bjdmList;
	private List<PublicCode> xldmList;
	private List<PublicCode> xzqhdmList;
	private List topList; 
	private List reportList;
	private Integer count;
	private Map listTjlb;
	private String tjlb;
	private String bynf;
	
	
	public String exportJyDBF(){
		if(!UserUtil.isLogged()) return "error";
		//HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/x-dbf");
		try {
			response.addHeader("Content-Disposition", "attachment; filename=\""
					+ new String("jz10254.DBF".getBytes(), "UTF-8")
					+ "\"");
			List jydbfList = new ArrayList();
			List list = new ArrayList();
			if(model!=null && model.getStudent()!=null){
				jydbfList = byqxReportService.listJyDBF(model.getStudent().getBynf(),model);
			}
			/*String[] fieldNames = {"身份证号", "学校代码","学校名称",
			"专业代码","专业名称","学号","姓名","性别代码","学历代码",
			"学制","生源地区代码","培养方式代码","备注","政治面貌代码","生源地区名称",
			"信息登记号","组织机构码","单位名称","单位地区代码","单位地区名称","主管部门名称",
			"毕业去向代码","蓝表批准文号","未就业标志","未就业原因","联系地址","邮编",
			"电话","保管档案标志","自定义字段","自定义字段","自定义字段","自定义字段",
			"自定义字段","居住证或蓝表标志位","生源地主管单位名称","单位性质代码","主管部门代码"
			};*/
			String[] t_fieldNames = {"ID", "XXDM","XXMC","ZYDM","ZYMC",
					"XSXH","NAME","XBDM","XLDM","XZDM",					
					"SYDQDM","PYFSDM","MEMO","ZZMMDM","SYDQMC",
					"XXDJH","ZZJGDM","DWMC","DWDQDM","DWDQMC",
					"ZGBMDM","BYQX","BLUENO","WJYBZ","WJYYY",
					"LXDZ","YB","DH","BGDABZ","BZ1",
					"BZ2","BZ3","BZ4","BZ5","JZZBZ",
					"SYDZGDW","DWXZDM","ZGBMDM"				
					};
			/*String[] t_fieldNames = {"ID", "XXDM",
					"ZYDM","ZYMC","XSXH","NAME","XBDM","XLDM",
					"XZDM","SYDQDM","PYFSDM","MEMO",
					"XXDJH",
					"DWMC","DWDQDM","DWDQMC","ZGBMMC",
					"BYQX","BLUENO",
					"BZ1","BZ2","BZ3","BZ4",
					"BZ5","JZZBZ","SYDZGDW","DWXZDM","ZGBMDM"
					};*/
			String[] fieldNames = new String[t_fieldNames.length];
			for(int i=0; i<t_fieldNames.length; i++){
				fieldNames[i] = t_fieldNames[i].toLowerCase();
			}
			int[] fieldLengths = {18, 5, 30,
					8,30,20,10,1,2,
					3,6,1,20,3,20,
					7,9,50,6,20,20,
					2,5,1,128,128,6,
					16,1,100,100,100,100,
					100,1,50,2,3
					};
			/*int[] fieldLengths = {18, 5,
					8,50,12,8,1,2,
					3,6,2,50,
					7,
					50,6,20,20,
					2,5,
					50,50,50,50,
					50,1,50,2,3
					};*/
			if(jydbfList != null && jydbfList.size()!=0){
				for(int i=0; i<jydbfList.size(); i++){
					Map map = (Map)jydbfList.get(i);
					if(map!= null){
						Object []rowData = new String[t_fieldNames.length];
						rowData[0] = map.get("SFZH");
						rowData[1] = "10254";
						rowData[2] = "上海海事大学";
					    rowData[3] = map.get("ZYDM");
					    rowData[4] = map.get("ZYMC");
					   
					    rowData[5] = map.get("XH");					    
					    rowData[6] = map.get("XM");
					    rowData[7] = map.get("XB");
					    rowData[8] = map.get("XL");
					    rowData[9] = map.get("XZ");
					    
					    rowData[10] = map.get("SYD");	//生源地代码				    
					    rowData[11] = map.get("PYFS");
					    rowData[12] = map.get("YXMC");
					    rowData[13] = map.get("ZZMM");
					    rowData[14] = map.get("SYDQMC");//生源地名称
					   
					    rowData[15] = map.get("XXDJH");					    
					    rowData[16] = map.get("DWJGM");
					    rowData[17] = map.get("DWMC");
					    if("110000".equals(map.get("DWSZDQ"))){
					    	 rowData[18]="110100";
					    }else if("310000".equals(map.get("DWSZDQ"))){
					    	rowData[18]="310100";
					    }else if("120000".equals(map.get("DWSZDQ"))){
					    	rowData[18]="120100";
					    }else if("500000".equals(map.get("DWSZDQ"))){
					    	rowData[18]="500100";
					    }else {
					    	if(map.get("DWSZDQ")!=null&&!"".equals(map.get("DWSZDQ"))){
					    		String str = (String) map.get("DWSZDQ");//单位地区代码
						    	String strtemp=str.substring(0, str.length()-2);
						    	rowData[18]=strtemp+"00";
					    	}else{
					    		rowData[18]= map.get("DWSZDQ");//单位地区代码
					    	}
					    	
					    }
					    
					    

					    rowData[19] = map.get("DWDQMC");//单位地区名称
		   

					    rowData[20] = map.get("DWZGBM");					    
					    rowData[21] = map.get("QXLB");
					    rowData[22] = map.get("BLUENO");
					    rowData[23] = map.get("WJYBZ");
					    rowData[24] = map.get("WJYYY");
					  
					    rowData[25] = map.get("JTDZ");					    
					    rowData[26] = map.get("JTYB");
					    rowData[27] = map.get("LXDH");
					    rowData[28] = map.get("BGDABZS");
					    rowData[29] = map.get("BZ1");
					
					    rowData[30] = map.get("BZ2");					    
					    rowData[31] = map.get("BZ3");
					    rowData[32] = map.get("BZ4");
					    rowData[33] = map.get("BZ5");
					    rowData[34] = map.get("JZZBZ");
		
					    rowData[35] = map.get("SYDZGDW");					    
					    rowData[36] = map.get("DWXZ");
					    rowData[37] = map.get("DWZGBM");

					    
					    
					   
					    if(!Utility.isEmpty(rowData[21])){
					    	String qxlb =  String.valueOf(rowData[21]);
					    	if ("04".equals(qxlb)) { //04出国
					    		rowData[17] = map.get("XX");rowData[19] = map.get("GJMC");
					    		
							    if("110000".equals(map.get("SYD"))){
							    	 rowData[18]="110100";
							    }else if("310000".equals(map.get("SYD"))){
							    	rowData[18]="310100";
							    }else if("120000".equals(map.get("SYD"))){
							    	rowData[18]="120100";
							    }else if("500000".equals(map.get("SYD"))){
							    	rowData[18]="500100";
							    }else {
							    	if(map.get("SYD")!=null&&!"".equals(map.get("SYD"))){
							    		String str = (String) map.get("SYD");//单位地区代码
								    	String strtemp=str.substring(0, str.length()-2);
								    	rowData[18]=strtemp+"00";
							    	}else{
							    		rowData[18]= map.get("SYD");//单位地区代码
							    	}
							    }

								rowData[19] = map.get("SYDQMC");//单位地区名称
//							    2011-11-01 将学生的生源地区代码和名称分别显示在单位地区代码和单位地区名称中			
							}else if ("02".equals(qxlb)) {//升学研究生
								rowData[17] = map.get("XX");
								
							    if("110000".equals(map.get("XXSZD"))){
							    	 rowData[18]="110100";
							    }else if("310000".equals(map.get("XXSZD"))){
							    	rowData[18]="310100";
							    }else if("120000".equals(map.get("XXSZD"))){
							    	rowData[18]="120100";
							    }else if("500000".equals(map.get("XXSZD"))){
							    	rowData[18]="500100";
							    }else {
							    	 rowData[18] = map.get("XXSZD");//单位地区代码
							    }
								
								rowData[19] = map.get("XXSZDMC");
							}else if ("12".equals(qxlb)) {//升学专升本
								rowData[17] = map.get("XX");
							    if("110000".equals(map.get("XXSZD"))){
							    	 rowData[18]="110100";
							    }else if("310000".equals(map.get("XXSZD"))){
							    	rowData[18]="310100";
							    }else if("120000".equals(map.get("XXSZD"))){
							    	rowData[18]="120100";
							    }else if("500000".equals(map.get("XXSZD"))){
							    	rowData[18]="500100";
							    }else {
							    	 rowData[18] = map.get("XXSZD");//单位地区代码
							    }
								rowData[19] = map.get("XXSZDMC");
							}
					    }
					    list.add(rowData);
					}
				}
			}
			DbfUtil.writeDBF(fieldNames,fieldLengths, list,response.getOutputStream());
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return null;
	}
	public String exportJyExcel(){
		if(!UserUtil.isLogged()) return "error";
		//HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		try {
			response.setContentType("application/vnd.ms-excel");
			response.addHeader("Content-Disposition", "attachment; filename=\""
					+ new String("jz10254.xls".getBytes(), "ISO8859-1")
					+ "\"");
			List jydbfList = new ArrayList();
			//List list = new ArrayList();
			if(model!=null && model.getStudent()!=null){
				jydbfList = byqxReportService.listJyDBF(model.getStudent().getBynf(),model);
			}
			ExportExcel ee = new ExportExcel();
			String[] keys = {"XM","XH","SFZH", "XXDM","XXMC",
					"ZYDM","ZYMC","XL","XB",
					"XZ","ZZMM","SYD","PYFS","YXMC","BYJJ",
					"XXDJH","DWJGM","DWMC","DWSZDQ","DWDQMC","DWZGBMMC",  
//					"XXDJH","DWJGM","DWMC","SYD","SYDQMC","DWZGBMMC", 
					"QXLB","BLUENO","WJYBZ","WJYYY","LXDZ","JTYB",
					"LXDH","BGDABZS","BZ1","BZ2","BZ3","BZ4",
					"BZ5","JZZBZ","SYDZGDW","DWXZ","DWZGBM","QXTXLX",
					"LHJYLX","XWTJFX","SYDQMC"//添加灵活就业类型和希望推荐方向导出
					};
			String[] headers = new String[]{"NAME","XSXH","ID", "XXDM","XXMC",
					"ZYDM","ZYMC","XLDM","XBDM",
					"XZDM","ZZMMDM","SYDQDM","PYFSDM","MEMO","BYJJ",
					"XXDJH","ZZJGDM","DWMC","DWDQDM","DWDQMC","ZGDMMC",
					"BYQX","BLUENO","WJYBZ","WJYYY","LXDZ","YB",
					"DH","BGDABZ","BZ1","BZ2","BZ3","BZ4",
					"BZ5","JZZBZ","SYDZGDW","DWXZDM","ZGBMDM","QXTXLX",
					"LHJYLX","XWTJFX","SYDQMC"//添加灵活就业类型和希望推荐方向导出
					};
			if(jydbfList != null && jydbfList.size()!=0){
				for(int i=0; i<jydbfList.size(); i++){
					Map map = (Map)jydbfList.get(i);
					if(map!= null){
						map.put("BYJJ", "");
					    //04出国
					    String qxlb =  String.valueOf(map.get("QXLB"));
					    if(!Utility.isEmpty(qxlb)){
					    	if ("04".equals(qxlb)) {
					    		map.put("DWMC", map.get("XX"));
//	2011-11-01 				    map.put("DWDQMC", map.get("GJMC"));
					    		
					    		map.put("DWDQDM", map.get("SYD"));
					    		map.put("DWDQMC", map.get("SYDQMC"));
//2011-11-01 将学生的生源地区代码和名称分别显示在单位地区代码和单位地区名称中					    		
							}else if ("02".equals(qxlb)) {//升学研究生
								map.put("DWMC", map.get("XX"));
								map.put("DWDQDM", map.get("XXSZD"));
					    		map.put("DWDQMC", map.get("XXSZDMC"));
							}else if ("12".equals(qxlb)) {//升学专升本
								map.put("DWMC", map.get("XX"));
								map.put("DWDQDM", map.get("XXSZD"));
					    		map.put("DWDQMC", map.get("XXSZDMC"));
							}
					    }
					    //list.add(map);
					}
				}
			}
			ee.exportExcel("就业去向汇总", headers,jydbfList, response.getOutputStream(), keys);
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return null;
	}
	//毕业生就业基本地区流向 
	public String dqlx(){
		this.listnf = DateHelper.listnf(Calendar.getInstance().get(Calendar.YEAR), ApplicationParameter.XSNFSL);
		this.listQxlb = this.byqxService.getByqxlbList();
		try {
			this.xldmList = CodeUtil.getInctance().getCodePulbicList("OM_XL", "WHCDDM", "WHCDMC");
		} catch (CodeException e) {
			e.printStackTrace();
		}
		if(model!=null){
			this.count = byqxReportService.dqlxCount(model);
			if(count !=null && count.intValue() != 0 ){
				this.reportList = byqxReportService.dqlx(model);
				if(reportList!=null){
					for(int i=0; i<this.reportList.size(); i++){
						 Map map = (Map)this.reportList.get(0);
						 int sl = Integer.valueOf(String.valueOf(map.get("SL")));
						 double bfb = 100.00*sl/count;
						 DecimalFormat df=new DecimalFormat("###.00"); 
						 String strbfb = df.format(bfb);
						 if(strbfb.startsWith(".")){
							 strbfb = "0"+strbfb;
						 }
						 map.put("BFB", strbfb); 
					}
				}
				
				this.topList = new ArrayList();
				this.topList.add("地区\\学历");
				if(model.getStudent()!=null && model.getStudent().getXl()!=null && !Utility.isEmpty(model.getStudent().getXl().getWhcddm())){
					this.topList.add(this.byqxReportService.getXl(model.getDmxl().getWhcddm()).getWhcdmc());
				}else{
					return "dqlx";
				}
				this.topList.add("比例(%)");
			}
		}
		
		return "dqlx";
	}
	
	public String tj(){
		this.listnf = DateHelper.listnf(Calendar.getInstance().get(Calendar.YEAR), ApplicationParameter.XSNFSL);
		if(!Utility.isEmpty(tjlb) && !Utility.isEmpty(bynf)){
			try {
				topList = byqxReportService.jyqxTjTopList(tjlb,bynf);
				reportList = byqxReportService.jyqxTjList(tjlb,bynf);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "tj";
	}
	public String ecportTj(){
		HttpServletResponse response = ServletActionContext.getResponse();
		try {
			String tjlbmc = String.valueOf(getListTjlb().get(tjlb));
			String fileName = new String(("去向_"+tjlbmc+"统计.xls").getBytes(),"ISO8859-1");
			response.setContentType("application/vnd.ms-excel");
			response.addHeader("Content-Disposition", "attachment; filename=\""+ fileName+ "\"");
			ExportExcel ee = new ExportExcel();
			reportList = byqxReportService.jyqxTjList(tjlb,bynf);
			if("DWXZ".equals(tjlb)|| "DWSZD".equals(tjlb)){
				Object[] keys = new String[]{tjlb,"ZRS","BFB"};
				String[] headers = new String[]{""+tjlbmc,"总人数","所占全校毕业生百分比"};
				ee.exportExcel("去向"+tjlbmc+"统计", headers,reportList, response.getOutputStream(), keys);
			}else if("ZYMC".equals(tjlb)|| "XYMC".equals(tjlb) || "XSLBMC".equals(tjlb)|| "LB".equals(tjlb)){
				Object[] keys = new String[]{tjlb,"ZRS","XL",
						"qxlb01","qxlb02","qxlb04","qxlb06","qxlb11","qxlb12",
						"qxlb13","qxlb14","qxlb16","qxlb17",
						"QYRS","QYL","JYRS","JYL"};
				String[] headers = new String[]{""+tjlbmc,"总人数","学历",
						"签订协议书","升学（研究生）","出国","待就业","延长学制","升学（专升本）",
						"隐性就业（与用人单位签订劳动合同就业）","灵活就业（实习、自主创业）",
						"回省就业","国家地方项目",
						"签约人数","签约率(%)","就业人数","就业率(%)",""};
				ee.exportExcel("去向"+tjlbmc+"统计", headers,reportList, response.getOutputStream(), keys);
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	public void loadDmForList(){
		this.listnf = DateHelper.listnf(Calendar.getInstance().get(Calendar.YEAR), ApplicationParameter.XSNFSL);
		this.listQxlb = this.byqxService.getByqxlbList();
		try {
			yxdmList = CodeUtil.getInctance().getCodePulbicList("OM_DWZZJG", "DWDM", "DWMC", ApplicationParameter.WHERE_OM_DWZZJG);
			if(model != null && model.getDmyx() !=null && !Utility.isEmpty(model.getDmyx().getDwdm())){
				zydmList = CodeUtil.getInctance().getCodePulbicList("OM_ZYDM", "ZYDM", "ZYMC", " yx='"+model.getDmyx().getDwdm()+"'");
			}else{
				zydmList = new ArrayList<PublicCode>();
				zydmList.add(new PublicCode("","-请先选择专业-"));
			}
			if(model != null && model.getDmzy() !=null && !Utility.isEmpty(model.getDmzy().getZydm())){
				bjdmList = CodeUtil.getInctance().getCodePulbicList("OM_BJ", "BJDM", "BJMC"," zy='"+model.getDmzy().getZydm()+"'");
			}else{
				bjdmList = new ArrayList<PublicCode>();
				bjdmList.add(new PublicCode("","-请先选择班级-"));
			}
			xzqhdmList = CodeUtil.getInctance().getCodePulbicList("OM_XZQH", "XZQHDM", "XZQHMC"," xzqhdm like '%0000'");
			xldmList = CodeUtil.getInctance().getCodePulbicList("OM_XL", "WHCDDM", "WHCDMC");
		} catch (CodeException e) {
			e.printStackTrace();
		}
		
	}
	public Map getListTjlb() {
		if(Utility.isEmpty(listTjlb) ){
			listTjlb = new LinkedHashMap();
			listTjlb.put("XYMC","院系");
			listTjlb.put("ZYMC","专业");
			listTjlb.put("XSLBMC","学生类别");
			listTjlb.put("DWXZ","单位性质");
			listTjlb.put("DWSZD","单位所在地");
			listTjlb.put("LB","类别");
		}
		return listTjlb;
	}
	public void setListTjlb(Map listTjlb) {
		this.listTjlb = listTjlb;
	}

	public List getReportList() {
		return reportList;
	}

	public void setReportList(List reportList) {
		this.reportList = reportList;
	}

	public IByqxtxsmService getByqxtxsmService() {
		return byqxtxsmService;
	}

	public void setByqxtxsmService(IByqxtxsmService byqxtxsmService) {
		this.byqxtxsmService = byqxtxsmService;
	}

	public IByqxService getByqxService() {
		return byqxService;
	}

	public IByqxReportService getByqxReportService() {
		return byqxReportService;
	}

	public void setByqxReportService(IByqxReportService byqxReportService) {
		this.byqxReportService = byqxReportService;
	}

	public void setByqxService(IByqxService byqxService) {
		this.byqxService = byqxService;
	}

	public Byqx getModel() {
		return model;
	}

	public void setModel(Byqx model) {
		this.model = model;
	}

	public String getXh() {
		return xh;
	}

	public void setXh(String xh) {
		this.xh = xh;
	}

	public List getTopList() {
		return topList;
	}

	public void setTopList(List topList) {
		this.topList = topList;
	}

	public String getByqxlbdm() {
		return byqxlbdm;
	}

	public void setByqxlbdm(String byqxlbdm) {
		this.byqxlbdm = byqxlbdm;
	}

	public ByglByqxlb getByqxlb() {
		return byqxlb;
	}

	public void setByqxlb(ByglByqxlb byqxlb) {
		this.byqxlb = byqxlb;
	}

	public Byqxtxsm getByqxtxsm() {
		return byqxtxsm;
	}

	public void setByqxtxsm(Byqxtxsm byqxtxsm) {
		this.byqxtxsm = byqxtxsm;
	}

	public List<PublicCode> getListnf() {
		return listnf;
	}

	public void setListnf(List<PublicCode> listnf) {
		this.listnf = listnf;
	}

	public List<ByglByqxlb> getListQxlb() {
		return listQxlb;
	}

	public void setListQxlb(List<ByglByqxlb> listQxlb) {
		this.listQxlb = listQxlb;
	}

	public List<PublicCode> getYxdmList() {
		return yxdmList;
	}

	public void setYxdmList(List<PublicCode> yxdmList) {
		this.yxdmList = yxdmList;
	}

	public List<PublicCode> getZydmList() {
		return zydmList;
	}

	public void setZydmList(List<PublicCode> zydmList) {
		this.zydmList = zydmList;
	}

	public List<PublicCode> getBjdmList() {
		return bjdmList;
	}

	public void setBjdmList(List<PublicCode> bjdmList) {
		this.bjdmList = bjdmList;
	}

	public List<PublicCode> getXldmList() {
		return xldmList;
	}

	public void setXldmList(List<PublicCode> xldmList) {
		this.xldmList = xldmList;
	}

	public List<PublicCode> getXzqhdmList() {
		return xzqhdmList;
	}

	public void setXzqhdmList(List<PublicCode> xzqhdmList) {
		this.xzqhdmList = xzqhdmList;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public String getTjlb() {
		return tjlb;
	}

	public void setTjlb(String tjlb) {
		this.tjlb = tjlb;
	}

	public String getBynf() {
		return bynf;
	}

	public void setBynf(String bynf) {
		this.bynf = bynf;
	}
}
