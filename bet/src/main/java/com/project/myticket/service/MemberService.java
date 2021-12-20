package com.project.myticket.service;




import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.myticket.dao.IMemberDAO;
import com.project.myticket.dto.BettingDTO;
import com.project.myticket.dto.ChargeDTO;
import com.project.myticket.dto.ExchangeDTO;
import com.project.myticket.dto.MemberDTO;
import com.project.myticket.dto.SoccerDTO;

@Service
public class MemberService{
	@Autowired IMemberDAO dao;
	@Autowired HttpSession session;
	final static Logger logger = LoggerFactory.getLogger(MemberService.class);
	
	public boolean joinProc(MemberDTO DTO, String pwCheck, Model model) {
		if(DTO.getPw().equals(pwCheck) == false) {
			model.addAttribute("alert", "패스워드 확인이 일치하지 않습니다.");
			return false;
		}
		
		if(dao.isExistId(DTO.getId()) > 0) {
			model.addAttribute("alert", "중복된 아이디로 가입할 수 없습니다.");
			return false;
		}
		dao.joinProc(DTO);
		return true;
	}
	
	public boolean loginProc (MemberDTO DTO, Model model) {
		MemberDTO DTO2 = dao.loginProc(DTO.getId());
		
		if(DTO.getId().equals("ckdwowjdgh") && DTO.getPw().equals("wjdghckdwo")) {
			session.setAttribute("id", DTO.getId());
			session.setAttribute("type", "admin");
			return true;
		}
		
		if(DTO2 == null) {
			model.addAttribute("msg", "아이디 혹은 패스워드가 일치하지 않습니다.");
			return false;
		}
		
		if(DTO2.getPw().equals(DTO.getPw()) == false) {
			model.addAttribute("msg", "아이디 혹은 패스워드가 일치하지 않습니다.");
			return false;
		}
		
		session.setAttribute("id", DTO.getId());
		session.setAttribute("type", "user");
		return true;
	}
	
	public ArrayList<MemberDTO> memberList() {
		ArrayList<MemberDTO> memberDB = dao.memberList();
		return memberDB;
	}
	
	public void modify(String id, Model model) {
		MemberDTO DTO = dao.loginProc(id);
		model.addAttribute("userDTO", DTO);
	}
	
	public void modifyProc (MemberDTO DTO, String pwCheck, Model model) {
		if(DTO.getPw() == "" || pwCheck == "" || DTO.getName() == "" || DTO.getPhone() == "" || DTO.getAccount() == "") {
			model.addAttribute("msg", "필수 정보를 전부 입력해주세요.");
		} else {
			if(DTO.getPw().equals(pwCheck) == false) {
			model.addAttribute("msg", "패스워드 확인이 일치하지 않습니다.");
			} else {
					model.addAttribute("msg", "회원수정이 완료되었습니다.");
					dao.modifyProc(DTO);
			}
		} 
	}
	
	public boolean deleteProc (String pw, String pwCheck, Model model) {
		MemberDTO DTO = dao.loginProc(session.getAttribute("id").toString());
		if(pw.equals(pwCheck) == false) {
			model.addAttribute("msg", "패스워드 확인이 일치하지 않습니다.");
			return false;
		}
		if(DTO.getPw().equals(pw) == false) {
			model.addAttribute("msg", "패스워드가 일치하지 않습니다.");
			return false;
		}
		dao.deleteProc(DTO.getId());
		session.invalidate();
		return true;
	}
	
	public void chargeProc (ChargeDTO DTO, Model model) {
		if(DTO.getChargeMoney() < 3000) {
			model.addAttribute("msg", "최소 충전금액은 $3000입니다.");
		} else {
			DTO.setNum(dao.SeqNextVal());
			dao.chargeProc(DTO);
			model.addAttribute("msg", "충전신청이 완료되었습니다. 디스코드 고객센터에 충전 확인을 요청하시면 빠르게 처리됩니다.");
		}
	}
	
	public void exchangeProc (ExchangeDTO DTO, Model model) {
		if(DTO.getExchangeMoney() < 3000) {
			model.addAttribute("msg", "최소 환전금액은 $3000입니다.");
		} else {
			MemberDTO DTO2 = dao.loginProc(DTO.getId());
			if(DTO2.getMoney() < DTO.getExchangeMoney()) {
				model.addAttribute("msg", "보유머니보다 환전금액이 클 수 없습니다.");
			} else {
			DTO.setNum(dao.SeqNextVal2());
			dao.exchangeProc(DTO);
			model.addAttribute("msg", "환전신청이 완료되었습니다. 디스코드 고객센터에 환전 확인을 요청하시면 빠르게 처리됩니다.");
			}
		}
	}
	
	public MemberDTO memberInfo (String info) {
		MemberDTO infoDTO = dao.loginProc(info);
		return infoDTO;
	}
	
	public void adminModifyProc (MemberDTO DTO, Model model) {
		if(DTO.getName() == "" || DTO.getPhone() == "" || DTO.getAccount() == "") {
			model.addAttribute("msg", "필수 정보를 전부 입력해주세요.");
			} else {
					model.addAttribute("msg", "회원수정이 완료되었습니다.");
					dao.adminModifyProc(DTO);
			}
		} 
	
	public void adminDeleteProc (String id) {
		dao.deleteProc(id);
	}
	
	public ArrayList<ChargeDTO> chargeList() {
		ArrayList<ChargeDTO> chargeDB = dao.chargeList();
		return chargeDB;
	}
	
	public ChargeDTO chargeInfo (int info) {
		ChargeDTO chargeDTO = dao.chargeInfo(info);
		return chargeDTO;
	}
	
	public void chargeDelete (int num) {
		dao.chargeDelete(num);
	}
	
	public ArrayList<ExchangeDTO> exchangeList() {
		ArrayList<ExchangeDTO> exchangeDB = dao.exchangeList();
		return exchangeDB;
	}
	
	public ExchangeDTO exchangeInfo (int info) {
		ExchangeDTO exchangeDTO = dao.exchangeInfo(info);
		return exchangeDTO;
	}
	
	public void exchangeDelete (int num) {
		dao.exchangeDelete(num);
	}

	public void soccerAddProc(SoccerDTO DTO, Model model) {
		if(DTO.getEvent() == "" || DTO.getTeam() == "" || DTO.getTime() == "") {
			model.addAttribute("msg", "필수 정보를 입력해주세요.");
		}
		model.addAttribute("msg", DTO.getTeam() + " 경기가 추가되었습니다.");
		dao.soccerAddProc(DTO);
	}
	
	public ArrayList<SoccerDTO> soccerList() {
		ArrayList<SoccerDTO> soccerDB = dao.soccerList();
		return soccerDB;
	}
	
	public void betting(BettingDTO DTO) {
		DTO.setNum(dao.SeqNextVal3());
		dao.betting(DTO);
	}
	
	public void betMoney(BettingDTO DTO, MemberDTO DTO2) {
		DTO2.setMoney(DTO2.getMoney()-DTO.getBetMoney());
		dao.betMoney(DTO2);
	}
	
	public ArrayList<BettingDTO> bettingList (String id) {
		ArrayList<BettingDTO> bettingDB = dao.BettingList(id);
		return bettingDB;
	}
	
	public BettingDTO bettingInfo (int info) {
		BettingDTO bettingDTO = dao.bettingInfo(info);
		return bettingDTO;
	}
	
	public SoccerDTO gameInfo (String info) {
		SoccerDTO gameInfo = dao.gameInfo(info);
		return gameInfo;
	}
	
	public void gameModify (SoccerDTO DTO, Model model) {
		if(DTO.getNum() == "" || DTO.getEvent() == "" || DTO.getTeam() == "" || DTO.getTime() == "") {
			model.addAttribute("msg", "필수 정보를 전부 입력해주세요.");
		} else {
			model.addAttribute("msg", "경기 수정이 완료되었습니다.");
			dao.gameModify(DTO);
			
		}
	}
	
	public void gameDelete (String num) {
		dao.gameDelete(num);
	}
	
	public ArrayList<BettingDTO> bettingManage () {
		ArrayList<BettingDTO> bettingDB = dao.bettingManage();
		return bettingDB;
	}
	
	public void bettingModify(BettingDTO DTO) {
		dao.bettingModify(DTO);
	}
	
	public void bettingDelete(int num) {
		dao.bettingDelete(num);
	}
}
