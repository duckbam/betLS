package com.project.myticket.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.project.myticket.dto.BettingDTO;
import com.project.myticket.dto.ChargeDTO;
import com.project.myticket.dto.ExchangeDTO;
import com.project.myticket.dto.MemberDTO;
import com.project.myticket.dto.SoccerDTO;


@Repository
public interface IMemberDAO {
	public void joinProc(MemberDTO DTO);
	
	int isExistId(String id);
	
	MemberDTO loginProc(String id);
	
	ChargeDTO chargeInfo(int num);
	
	ExchangeDTO exchangeInfo(int num);
	
	ArrayList<MemberDTO> memberList();
	
	public void modifyProc(MemberDTO DTO);
	
	public void deleteProc(String id);
	
	public void chargeDelete(int num);
	
	public void exchangeDelete(int num);
	
	public void chargeProc(ChargeDTO DTO);
	
	public void exchangeProc(ExchangeDTO DTO);
	
	public void adminModifyProc(MemberDTO DTO);
	
	ArrayList<ChargeDTO> chargeList();
	
	ArrayList<ExchangeDTO> exchangeList();
	
	ArrayList<SoccerDTO> soccerList();
	
	int SeqNextVal();
	
	int SeqNextVal2();
	
	int SeqNextVal3();
	
	public void soccerAddProc(SoccerDTO DTO);
	
	public void betting(BettingDTO DTO);
	
	public void betMoney(MemberDTO DTO);
	
	ArrayList<BettingDTO> BettingList(String id);
	
	BettingDTO bettingInfo(int num);
	
	SoccerDTO gameInfo(String num);
	
	public void gameModify(SoccerDTO DTO);
	
	public void gameDelete(String num);
	
	ArrayList<BettingDTO> bettingManage();
	
	public void bettingModify(BettingDTO DTO);
	
	public void bettingDelete(int num);
}



