package com.agileai.hr.module.salary.handler;

import com.agileai.domain.DataParam;
import com.agileai.domain.DataRow;
import com.agileai.hotweb.controller.core.SimpleHandler;
import com.agileai.hotweb.renders.AjaxRenderer;
import com.agileai.hotweb.renders.LocalRenderer;
import com.agileai.hotweb.renders.ViewRenderer;
import com.agileai.hr.cxmodule.HrSalaryManage;

/**
 * generated by miscdp
 */
public class HrValidDaysHandler extends SimpleHandler{
	public HrValidDaysHandler(){
		super();
	}
	public ViewRenderer prepareDisplay(DataParam param) {
		this.setAttributes(param);
		HrSalaryManage hrSalaryManage = this.lookupService(HrSalaryManage.class);
		String year = param.get("year");
		String month = param.get("month");
		DataRow row = hrSalaryManage.retrieveValidDays(year, month);
		if (row != null && row.size() > 0){
			this.setOperaType(OperaType.UPDATE);
		}else{
			this.setOperaType(OperaType.CREATE);
		}
		this.setAttributes(row);
		this.processPageAttributes(param);
		return new LocalRenderer(getPage());
	}
	
	protected void processPageAttributes(DataParam param){
		this.setAttribute("VALID_YEAR",this.getAttribute("VALID_YEAR",param.get("year")));
		this.setAttribute("VALID_MONTH",this.getAttribute("VALID_MONTH",param.get("month")));

	}
	public ViewRenderer doSaveAction(DataParam param){
		String responseText = FAIL;
		try {
			HrSalaryManage hrSalaryManage = this.lookupService(HrSalaryManage.class);
			String operateType = param.get(OperaType.KEY);
			if (OperaType.CREATE.equals(operateType)){
				hrSalaryManage.createValidDayRecord(param);
			}
			else if(OperaType.UPDATE.equals(operateType)){
				hrSalaryManage.updateValidDayRecord(param);
			}
			responseText = SUCCESS;
		} catch (Exception e) {
			log.error(e.getLocalizedMessage(), e);
		}
		return new AjaxRenderer(responseText);
	}
}
