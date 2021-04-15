package com.hr.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hr.mapper.ProplemMapper;
import com.hr.pojo.Proplem;
import com.hr.pojo.ProplemFeedback;
import com.hr.service.ProplemService;
import com.hr.util.EasyUi;

@Service("proplemService")
public class ProplemServiceImpl implements ProplemService {
	
	@Autowired
	private ProplemMapper proplemMapper;
	
	/* 查询所有的proplem分页
	 */
		@Override
		public EasyUi allProplem(Integer pageNum,Integer pageSize){
			EasyUi easyUi = new EasyUi();
			//1.开启分页查询
			PageHelper.startPage(pageNum, pageSize);
			List<Proplem> proplems = proplemMapper.allProplem();
			//2.获取分页信息
			PageInfo<Proplem> pageInfo = new PageInfo<Proplem>(proplems);
			
			easyUi.setPageNum(pageInfo.getPageNum());//当前页
			easyUi.setPages(pageInfo.getPages());//总页数
			easyUi.setTotal(pageInfo.getTotal());//总记录数
			easyUi.setRows(proplems);//结果集
			return easyUi;
		}
	//新提问
	@Override
	public List<Proplem> newProplem() {
		List<Proplem> list = proplemMapper.newProplem();
		return list;
	}
	//新提问分页查询  pageSize 是有多少数据
	@Override
	public EasyUi newsProplem(Integer pageNum, Integer pageSize){
		EasyUi easyUi = new EasyUi();
		//1.开启分页查询
		PageHelper.startPage(pageNum, pageSize);
		List<Proplem> proplems = proplemMapper.newProplem();
		//2.获取分页信息
		PageInfo<Proplem> pageInfo = new PageInfo<Proplem>(proplems);
		easyUi.setPageNum(pageInfo.getPageNum());//当前页
		easyUi.setPages(pageInfo.getPages());//总页数
		easyUi.setTotal(pageInfo.getTotal());//总记录数
		easyUi.setRows(pageInfo.getList());//结果集
		return easyUi;
	}
	/* 查看审核状态
	 */
	@Override
	public List<Proplem> stateProblem() {
		List<Proplem> stateProblem = proplemMapper.stateProblem();
		return stateProblem;
	}
	//修改审核状态（审核通过，不通过）
	public Integer updateproblem(Integer proplemId){
		Integer updateproblem = proplemMapper.updateproblem(proplemId);
		return updateproblem;
	}
	//根据id查询
	@Override
	public Proplem selectNsById(Integer proplemId) {
		Proplem proplem = proplemMapper.selectNsById(proplemId);
		return proplem;
	}
	//未处理
	@Override
	public List<Proplem> noChuLi() {
		List<Proplem> list = proplemMapper.noChuLi();
		for(Proplem proplem : list){
			System.out.println(proplem);
		}
		return list;
	}
	//未处理分页
	@Override
	public EasyUi noProplem(Integer pageNum, Integer pageSize) {
		EasyUi easyUi = new EasyUi();
		//1.开启分页查询
		PageHelper.startPage(pageNum, pageSize);
		List<Proplem> proplems = proplemMapper.noChuLi();
		//2.获取分页信息
		PageInfo<Proplem> pageInfo = new PageInfo<Proplem>(proplems);
		
		easyUi.setPageNum(pageInfo.getPageNum());//当前页
		easyUi.setPages(pageInfo.getPages());//总页数
		easyUi.setTotal(pageInfo.getTotal());//总记录数
		easyUi.setRows(proplems);//结果集
		return easyUi;
	}
	/* 未处理插入
	 */
	@Override
	public Integer noInsert(String feedbackInfo) {
		Integer noInsert = proplemMapper.noInsert(feedbackInfo);
		return noInsert;
	}
	//新反馈
	@Override
	public List<ProplemFeedback> newProplemFeedback() {
		List<ProplemFeedback> list = proplemMapper.newProplemFeedback();
		return list;
	}
	/* 新反馈分页
	 */
	@Override
	public EasyUi newsProplemFeedback(Integer pageNum, Integer pageSize) {
		EasyUi easyUi = new EasyUi();
		//1.开启分页查询
		PageHelper.startPage(pageNum, pageSize);
		List<ProplemFeedback> proplems = proplemMapper.newProplemFeedback();
		for(ProplemFeedback p : proplems){
			System.out.println(p);
		}
		//2.获取分页信息
		PageInfo<ProplemFeedback> pageInfo = new PageInfo<ProplemFeedback>(proplems);
		
		easyUi.setPageNum(pageInfo.getPageNum());//当前页
		easyUi.setPages(pageInfo.getPages());//总页数
		easyUi.setTotal(pageInfo.getTotal());//总记录数
		easyUi.setRows(proplems);//结果集
		return easyUi;
	}
	/*根据id查询新反馈
	 */
	@Override
	public ProplemFeedback selectPFById(Integer feedbackId) {
		ProplemFeedback selectPFById = proplemMapper.selectPFById(feedbackId);
		System.out.println(selectPFById);
		return selectPFById;
	}
	/* //查询所有反馈结果
	 */
	@Override
	public EasyUi allProplemFeedback(Integer pageNum, Integer pageSize) {
			EasyUi easyUi = new EasyUi();
			//1.开启分页查询
			PageHelper.startPage(pageNum, pageSize);
			List<ProplemFeedback> proplems = proplemMapper.allProplemFeedback();
			for(ProplemFeedback p : proplems){
				System.out.println(p);
			}
			//2.获取分页信息
			PageInfo<ProplemFeedback> pageInfo = new PageInfo<ProplemFeedback>(proplems);
			
			easyUi.setPageNum(pageInfo.getPageNum());//当前页
			easyUi.setPages(pageInfo.getPages());//总页数
			easyUi.setTotal(pageInfo.getTotal());//总记录数
			easyUi.setRows(proplems);//结果集
			return easyUi;
		}
	}
