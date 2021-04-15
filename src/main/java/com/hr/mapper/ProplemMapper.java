package com.hr.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hr.pojo.Proplem;
import com.hr.pojo.ProplemFeedback;

@Repository("proplemMapper")
public interface ProplemMapper {
	//查询所有
	public List<Proplem> allProplem();
	//新提问
	public List<Proplem> newProplem();
	//查询状态
	public List<Proplem> stateProblem();
	//修改审核状态（审核通过，不通过）
	public Integer updateproblem(Integer proplemId);
	//根据id查询新提问
	public Proplem selectNsById(Integer proplemId);
	//未处理
	public List<Proplem> noChuLi();
	//未处理 的插入反馈
	public Integer noInsert(String feedbackInfo);
	//新反馈
	public List<ProplemFeedback> newProplemFeedback();
	//根据id查新反馈
	public ProplemFeedback selectPFById(Integer feedbackId);
	//查询所有反馈结果
	public List<ProplemFeedback> allProplemFeedback();
}
