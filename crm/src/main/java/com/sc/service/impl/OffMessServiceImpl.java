package com.sc.service.impl;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sc.entity.OffMess;
import com.sc.entity.OffMessdetail;
import com.sc.entity.SysUsers;
import com.sc.entity.SysUsersExample;
import com.sc.mapper.OffMessMapper;
import com.sc.mapper.OffMessdetailMapper;
import com.sc.mapper.SysUsersMapper;
//import com.sc.mapper.SysUsersMapper;
import com.sc.service.OffMessService;

@Service
public class OffMessServiceImpl implements OffMessService {
	@Autowired
       OffMessdetailMapper offMessdetailMapper;
	
	@Autowired
    OffMessMapper offMessMapper;
	
	@Autowired
	SysUsersMapper sysUsersMapper;
	
	//短消息-已接收
	@Override
	public List<OffMessdetail> select() {
		return this.offMessdetailMapper.select();
	}
	
	
	//分页查询
	@Override
	public PageInfo<OffMessdetail> selectpage(Integer pageNum, Integer pageSize) {
		//设置分页数据，开始分页
		PageHelper.startPage(pageNum, pageSize);
	    //查询当前页的集合数据	
		List<OffMessdetail> list = this.offMessdetailMapper.select();
		//封装成pageinfo对象
		PageInfo<OffMessdetail> page=new PageInfo<OffMessdetail>(list);
				
		return page;
	}

	//删除短信
	@Override
	public void deleteMess(OffMessdetail mess) {
		if(mess!=null){
			this.offMessdetailMapper.deleteByPrimaryKey(mess.getDetailid());
		}	
	}

    //查看短消息详情
	@Override
	public OffMessdetail showdetail(OffMessdetail mess) {
		return this.offMessdetailMapper.showdetail(mess.getDetailid());
	}

    //回复短信
	@Override
	public void huifu(OffMess mess) {
		if(mess!=null){
			  this.offMessMapper.huifu(mess);
			}	
	}

    //回复短消息-详情
	@Override
	public void huifuone(OffMessdetail detail) {
		if(detail!=null){
			  this.offMessdetailMapper.huifuone(detail);
			}	
	}

    //更改短消息状态
	@Override
	public void  updatestate(Long detailid) {
		if(detailid!=null){
			  this.offMessdetailMapper.updatestate(detailid);
		}
	}

    //查看发送人信息
	@Override
	public SysUsers selectByuid(BigDecimal uid) {
		
		return this.sysUsersMapper.selectByPrimaryKey(uid);
	}

	
    //查看接收人信息
	@Override
	public SysUsers selectu(String uname){
		SysUsers user = this.sysUsersMapper.selectu(uname);
		
				
		return user;
	}
		
	
	
}
