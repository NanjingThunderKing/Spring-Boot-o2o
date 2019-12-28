package com.imooc.o2o.dto;

import java.util.List;

import com.imooc.o2o.entity.Award;
import com.imooc.o2o.enums.AwardStateEnum;


public class AwardExecution {
	// 结果状态
	private int state;
	
	// 状态标识
	private String stateInfo;
	
	// 奖品数量
	private int count;
	
	// 操作的product(增删改商品用)
	private Award award;
	
	// 获取的product列表(查询商品列表的时候用)
	private List<Award> awardList;

	public AwardExecution() {
		
	}
	
	// 失败的构造器
	public AwardExecution(AwardStateEnum stateEnum) {
		this.state = stateEnum.getState();
		this.stateInfo = stateEnum.getStateInfo();
	}
	
	// 成功的构造器1
	public AwardExecution(AwardStateEnum stateEnum, Award award) {
		this.state = stateEnum.getState();
		this.stateInfo = stateEnum.getStateInfo();
		this.award = award;
	}
	
	// 成功的构造器2
	public AwardExecution(AwardStateEnum stateEnum, List<Award> awardList) {
		this.state = stateEnum.getState();
		this.stateInfo = stateEnum.getStateInfo();
		this.awardList = awardList;
	}		
	
	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getStateInfo() {
		return stateInfo;
	}

	public void setStateInfo(String stateInfo) {
		this.stateInfo = stateInfo;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Award getAward() {
		return award;
	}

	public void setAward(Award award) {
		this.award = award;
	}

	public List<Award> getAwardList() {
		return awardList;
	}

	public void setAwardList(List<Award> awardList) {
		this.awardList = awardList;
	}

	
}