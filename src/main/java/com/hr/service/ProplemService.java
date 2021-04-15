package com.hr.service;

import java.util.List;

import com.hr.pojo.Proplem;
import com.hr.pojo.ProplemFeedback;
import com.hr.util.EasyUi;

public interface ProplemService {
	//查询所有
	public EasyUi allProplem(Integer pageNum,Integer pageSize);
	// 新提问
	public List<Proplem> newProplem();
	// 新提问分页查询 pageSize 是有多少数据
	public EasyUi newsProplem(Integer pageNum, Integer pageSize);
	//查询审核状态
	public List<Proplem> stateProblem();
	//修改审核状态（审核通过，不通过）
	public Integer updateproblem(Integer proplemId);
	// 根据id查询
	public Proplem selectNsById(Integer proplemId);

	// 未处理
	public List<Proplem> noChuLi();
	//未处理分页
	public EasyUi noProplem(Integer pageNum, Integer pageSize);
	//未处理 的插入反馈
	public Integer noInsert(String feedbackInfo);
	// 新反馈
	public List<ProplemFeedback> newProplemFeedback();
	//新反馈分页
	public EasyUi newsProplemFeedback(Integer pageNum, Integer pageSize);
	//根据id查询新反馈
	public ProplemFeedback selectPFById(Integer feedbackId);
	//查询所有反馈结果
	public EasyUi allProplemFeedback(Integer pageNum, Integer pageSize);
}
