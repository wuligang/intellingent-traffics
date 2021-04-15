package com.hr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hr.pojo.Proplem;
import com.hr.pojo.ProplemFeedback;
import com.hr.service.ProplemService;
import com.hr.util.EasyUi;
import com.hr.util.NewsList;

@Controller("proplemController")
@RequestMapping("proplem")
public class ProplemController {

	@Autowired
	private ProplemService proplemService;

	// 查询所有分页
	@RequestMapping(value = "allprobleam")
	@ResponseBody
	public EasyUi allprobleam(
			@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
			@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize) {
		EasyUi easyUi = proplemService.allProplem(pageNum, pageSize);
		return easyUi;
	}

	// 新提问条数
	@RequestMapping(value = "newp")
	@ResponseBody
	public int newProplem() {
		List<Proplem> list = proplemService.newProplem();
		int i = list.size();
		return i;
	}
	// 分页查看新提问
	@RequestMapping(value = "listN")
	@ResponseBody
	public EasyUi maAndView(
			@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
			@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize) {
		EasyUi easyUi = proplemService.newsProplem(pageNum, pageSize);
		return easyUi;
	}
	//查看审核状态
	@RequestMapping(value="stateProblem")
	@ResponseBody
	public List<Proplem> stateProblem(){
		List<Proplem> stateProblem = proplemService.stateProblem();
		return stateProblem;
	}
	//修改审核状态（审核通过，不通过）
	@RequestMapping(value="updateproblem")
	@ResponseBody
	public Integer updateproblem(@RequestParam(value="proplemId")Integer proplemId){
		Integer updateproblem = proplemService.updateproblem(proplemId);
		return updateproblem;
	}
	// 根据id查询
	@RequestMapping(value = "tongyong")
	@ResponseBody
	public Proplem selectNsById(
			@RequestParam(value = "proplemId") Integer proplemId) {
		Proplem proplem = proplemService.selectNsById(proplemId);
		return proplem;
	}

	// 未处理问题条数
	@RequestMapping(value = "nocl")
	@ResponseBody
	public int noChuLi() {
		List<Proplem> list = proplemService.noChuLi();
		int i = list.size();
		return i;
	}

	// 未处理分页
	@RequestMapping(value = "noprobleamchuli")
	@ResponseBody
	public EasyUi noproblemView(
			@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
			@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize) {
		EasyUi easyUi = proplemService.noProplem(pageNum, pageSize);
		return easyUi;
	}
	//回复通用
	@RequestMapping(value = "huifu")
	@ResponseBody
	public Integer noInsert(
			@RequestParam(value = "feedbackInfo") String feedbackInfo) {
		Integer noInsert = proplemService.noInsert(feedbackInfo);
		return noInsert;
	}

	// 新反馈条数
	@RequestMapping(value = "newpf")
	@ResponseBody
	public int newProplemFeedback() {
		List<ProplemFeedback> list = proplemService.newProplemFeedback();
		int i = list.size();
		return i;
	}
	// 根据id查询新反馈
		@RequestMapping(value = "selectPFByid")
		@ResponseBody
		public ProplemFeedback selectPFById(
				@RequestParam(value = "feedbackId") Integer feedbackId) {
			ProplemFeedback selectPFById = proplemService.selectPFById(feedbackId);
			System.out.println(selectPFById);
			return selectPFById;
		}
	// 反馈分页
	@RequestMapping(value = "newsFeedback")
	@ResponseBody
	public EasyUi newsProplemFeedback(
			@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
			@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize) {
		EasyUi easyUi = proplemService.newsProplemFeedback(pageNum, pageSize);
		return easyUi;
	}
	//查询所有反馈
	@RequestMapping(value="allProplemFeedback")
	@ResponseBody
	public EasyUi allProplemFeedback(
			@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
			@RequestParam(value = "pageSize", defaultValue = "10")Integer pageSize){
		EasyUi allProplemFeedback = proplemService.allProplemFeedback(pageNum, pageSize);
		return allProplemFeedback;
	}
}
