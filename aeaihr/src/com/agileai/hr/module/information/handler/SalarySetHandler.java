package com.agileai.hr.module.information.handler;

import com.agileai.domain.DataParam;
import com.agileai.domain.DataRow;
import com.agileai.hotweb.controller.core.SimpleHandler;
import com.agileai.hotweb.renders.AjaxRenderer;
import com.agileai.hotweb.renders.LocalRenderer;
import com.agileai.hotweb.renders.ViewRenderer;
import com.agileai.hr.module.information.service.HrEmployeeManage;

/**
 * generated by miscdp
 */
public class SalarySetHandler extends SimpleHandler{
	public SalarySetHandler(){
		super();
	}
	
	public ViewRenderer prepareDisplay(DataParam param) {
		DataRow salaryLimitRow = getService().getSalaryLimitRecord();
		this.setAttribute("salaryLimit",salaryLimitRow.get("TYPE_NAME"));
		DataRow fulltimeAwardRow = getService().getFulltimeAwardRecord();
		this.setAttribute("fulltimeAward",fulltimeAwardRow.get("TYPE_NAME"));
		this.setAttributes(param);
		this.processPageAttributes(param);
		return new LocalRenderer(getPage());
	}
	
	public ViewRenderer doSaveAction(DataParam param){
		String responseText = SUCCESS;
		try {
			getService().updateSalaryLimitRecord(param);
			getService().updateFulltimeAwardRecord(param);
		} catch (Exception e) {
			responseText = FAIL;
			log.error(e.getLocalizedMessage(), e);
		}
		return new AjaxRenderer(responseText);
	}
	
	protected void processPageAttributes(DataParam param){
		
	}
	
	protected HrEmployeeManage getService() {
		return (HrEmployeeManage) this.lookupService(HrEmployeeManage.class);
	}
}