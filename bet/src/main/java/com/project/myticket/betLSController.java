package com.project.myticket;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.myticket.dto.BettingDTO;
import com.project.myticket.dto.ChargeDTO;
import com.project.myticket.dto.ExchangeDTO;
import com.project.myticket.dto.MemberDTO;
import com.project.myticket.dto.SoccerDTO;
import com.project.myticket.service.MemberService;

@Controller
public class betLSController {
	@Autowired MemberService service;
	private static final Logger logger = LoggerFactory.getLogger(betLSController.class);
	
	@RequestMapping(value = "/")
	public String index(Model model) {
		model.addAttribute("formpath", "home");
		return "index";
	}
	
	@RequestMapping(value = "/index")
	public String index(Model model, @RequestParam String formpath, HttpSession session) {
		model.addAttribute("formpath", formpath);
		logger.warn("formpath : " + formpath);
		return "index";
	}
	
	@RequestMapping(value = "/home")
	public void home() {}
	
	@RequestMapping(value = "/login")
	public String login() {
		return "member/login";
	}
	
	@RequestMapping(value = "/gameCheck")
	public String gameCheck() {
		return "member/gameCheck";
	}
	
	@RequestMapping(value = "/loginProc")
	public String loginProc(MemberDTO DTO, Model model) {
		boolean check = service.loginProc(DTO, model);
		if(check == false)
			return "forward:index?formpath=login";
		return "redirect:index?formpath=home";
	}

	@RequestMapping(value = "/join")
	public String join() {
		return "member/join";
	}
	
	@RequestMapping(value = "/joinProc")
	public String joinProc(MemberDTO DTO, String pwCheck, Model model) {
		DTO.setMoney(0);
		boolean check = service.joinProc(DTO, pwCheck, model);
		if(check == false)
			return "member/joinProc";
		return "forward:index?formpath=home";
	}

	@RequestMapping(value = "/gameList")
	public String gameLists(Model model, HttpSession session) {
		model.addAttribute("userDB", service.memberInfo(session.getAttribute("id").toString()));
		model.addAttribute("soccerDB", service.soccerList());
		return "category/gameList";
	}
	

	@RequestMapping (value = "/logout") 
	public String logout(HttpSession session) { 
		session.invalidate(); 
		return "redirect:index?formpath=home";
	}
	
	@RequestMapping (value = "/Manage") 
	public String Manage(Model model) { 
		model.addAttribute("memberDB", service.memberList());
		return "member/Manage";
	}
	
	@RequestMapping (value="mypages")
	public String mypages() {
		return "member/mypage";
	}
	
	@RequestMapping (value="mypage")
	public String mypage(String page, Model model) {
		model.addAttribute("page", page);
		return "forward:index?formpath=mypages";
	}
	
	@RequestMapping (value="modify") 
	public String modify(HttpSession session, Model model) {
		service.modify(session.getAttribute("id").toString(), model);
		return "forward:mypage?page=modify";
	}
	
	@RequestMapping (value="modifyProc")
	public String modifyProc(MemberDTO DTO, String pwCheck, Model model) {
		service.modifyProc(DTO, pwCheck, model);
		return "forward:modify";
	}
	
	@RequestMapping (value="delete") 
	public String delete() {
		return "forward:mypage?page=delete";
	}
	
	@RequestMapping (value="deleteProc")
	public String deleteProc(String pw, String pwCheck, Model model) {
		boolean check = service.deleteProc(pw, pwCheck, model);
		if(check == false) {
			return "forward:delete";
		}
		return "forward:index?formpath=home";
	}
	
	@RequestMapping (value="charge")
	public String charge(HttpSession session, Model model) {
		service.modify(session.getAttribute("id").toString(), model);
		return "forward:mypage?page=charge";
	}
	
	@RequestMapping (value="chargeProc")
	public String chargeProc(ChargeDTO DTO, String chargeMoney1, Model model, HttpSession session) {
		if(chargeMoney1 == "") {
			model.addAttribute("msg", "최소 충전금액은 $3000입니다.");
			return "forward:charge";
		}
		
		DTO.setId(session.getAttribute("id").toString());
		DTO.setChargeMoney(Integer.parseInt(chargeMoney1));
		DTO.setCondi("X");
		service.chargeProc(DTO, model);
		return "forward:charge";
	}
	
	@RequestMapping (value="adminpages")
	public String adminpages() {
		return "member/adminpage";
	}
	
	@RequestMapping (value="adminpage")
	public String adminpage(String page, Model model) {
		model.addAttribute("page", page);
		return "forward:index?formpath=adminpages";
	}
	
	@RequestMapping (value="memberManage")
	public String memberManage(Model model) {
		model.addAttribute("memberDB", service.memberList());
		return "forward:adminpage?page=memberManage";
	}
	
	@RequestMapping (value="memberInfo")
	public String memberInfo(String info, Model model) {
		model.addAttribute("infoDB", service.memberInfo(info));
		return "forward:adminpage?page=memberInfo";
	}
	
	@RequestMapping (value="adminModify")
	public String adminModify(String id, Model model) {
		service.modify(id, model);
		return "forward:adminpage?page=adminModify";
	}
	
	@RequestMapping (value="adminModifyProc")
	public String adminModifyProc(MemberDTO DTO, String money1, Model model) {
		if(money1 == "") {
			model.addAttribute("msg", "보유머니는 필수 정보입니다.");
			return "forward:adminModify";
		}
		
		DTO.setMoney(Integer.parseInt(money1));
		service.adminModifyProc(DTO, model);
		return "forward:adminModify";
	}
	
	@RequestMapping (value="adminDeleteProc")
	public String adminDeleteProc(String id) {
		service.adminDeleteProc(id);
		return "forward:memberManage";
	}
	
	@RequestMapping (value="chargeManage")
	public String chargeManage(Model model) {
		model.addAttribute("chargeDB", service.chargeList());
		return "forward:adminpage?page=chargeManage";
	}
	
	@RequestMapping (value="chargeInfo")
	public String chargeInfo(int info, Model model) {
		model.addAttribute("chargeDB", service.chargeInfo(info));
		return "forward:adminpage?page=chargeInfo";
	}
	
	@RequestMapping (value="chargeDelete")
	public String chargeDelete(int info) {
		service.chargeDelete(info);
		return "forward:chargeManage";
	}
	
	@RequestMapping (value="exchange")
	public String exchange(HttpSession session, Model model) {
		service.modify(session.getAttribute("id").toString(), model);
		return "forward:mypage?page=exchange";
	}
	
	@RequestMapping (value="exchangeProc")
	public String exchangeProc(ExchangeDTO DTO, String exchangeMoney1, Model model, HttpSession session) {
		if(exchangeMoney1 == "") {
			model.addAttribute("msg", "최소 환전금액은 $3000입니다.");
			return "forward:exchange";
		}
		
		DTO.setId(session.getAttribute("id").toString());
		DTO.setExchangeMoney(Integer.parseInt(exchangeMoney1));
		DTO.setCondi("X");
		service.exchangeProc(DTO, model);
		return "forward:exchange";
	}
	
	@RequestMapping (value="exchangeManage")
	public String exchangeManage(Model model) {
		model.addAttribute("exchangeDB", service.exchangeList());
		return "forward:adminpage?page=exchangeManage";
	}
	
	@RequestMapping (value="exchangeInfo")
	public String exchangeInfo(int info, Model model) {
		model.addAttribute("exchangeDB", service.exchangeInfo(info));
		return "forward:adminpage?page=exchangeInfo";
	}
	
	@RequestMapping (value="exchangeDelete")
	public String exchangeDelete(int info) {
		service.exchangeDelete(info);
		return "forward:exchangeManage";
	}
	
	@RequestMapping (value="gameManage")
	public String gameManage(Model model) {
		model.addAttribute("soccerDB", service.soccerList());
		return "forward:adminpage?page=gameManage";
	}
	
	@RequestMapping (value="gameAdd")
	public String gameAdd() {
		return "forward:adminpage?page=gameAdd";
	}
	
	@RequestMapping (value="gameAddProc")
	public String gameAddProc(SoccerDTO DTO, String win1, String draw1, String lose1, Model model) {
		if(win1 == "" || draw1 == "" || lose1 == "") {
			model.addAttribute("msg", "배당 혹은 번호를 제대로 입력해주세요.");
		return "forward:gameAdd";
		}
		DTO.setWin(Double.parseDouble(win1));
		DTO.setDraw(Double.parseDouble(draw1));
		DTO.setLose(Double.parseDouble(lose1));
		service.soccerAddProc(DTO, model);
		return "forward:gameAdd";
	}
	
	@RequestMapping (value="gameChecks")
	public String gameChecks(String one, String two, String three, String four, String five, String six, String seven, String eight, String nine,
			String ten, String tenone, String tentwo, String tenthree, String tenfour, String tenfive, String tensix, String tenseven, String teneight,
			String tennine, String twoten, String betMoney, Model model, HttpSession session) {
		MemberDTO DTO = service.memberInfo(session.getAttribute("id").toString());
		// 치환
		if(betMoney == "") {
			model.addAttribute("msg", "배팅 금액을 입력해주세요.");
			return "forward:index?formpath=gameList";
		}
		
		if(one == null) {
			one = "100";
		}
		if(two == null) {
			two = "100";
		}
		if(three == null) {
			three = "100";
		}
		if(four == null) {
			four = "100";
		}
		if(five == null) {
			five = "100";
		}
		if(six == null) {
			six = "100";
		}
		if(seven == null) {
			seven = "100";
		}
		if(eight == null) {
			eight = "100";
		}
		if(nine == null) {
			nine = "100";
		}
		if(ten == null) {
			ten = "100";
		}
		if(tenone == null) {
			tenone = "100";
		}
		if(tentwo == null) {
			tentwo = "100";
		}
		if(tenthree == null) {
			tenthree = "100";
		}
		if(tenfour == null) {
			tenfour = "100";
		}
		if(tenfive == null) {
			tenfive = "100";
		}
		if(tensix == null) {
			tensix = "100";
		}
		if(tenseven == null) {
			tenseven = "100";
		}
		if(teneight == null) {
			teneight = "100";
		}
		if(tennine == null) {
			tennine = "100";
		}
		if(twoten == null) {
			twoten = "100";
		}
		
		
		// 더블형으로 변경하기
		String one1 = one.replaceAll("[^0-9]", "");
		double one2 = Double.parseDouble(one1);
		double one3 = (one2/100);
		
		String two1 = two.replaceAll("[^0-9]", "");
		double two2 = Double.parseDouble(two1);
		double two3 = (two2/100);
		
		String three1 = three.replaceAll("[^0-9]", "");
		double three2 = Double.parseDouble(three1);
		double three3 = (three2/100);
		
		String four1 = four.replaceAll("[^0-9]", "");
		double four2 = Double.parseDouble(four1);
		double four3 = (four2/100);
		
		String five1 = five.replaceAll("[^0-9]", "");
		double five2 = Double.parseDouble(five1);
		double five3 = (five2/100);
		
		String six1 = six.replaceAll("[^0-9]", "");
		double six2 = Double.parseDouble(six1);
		double six3 = (six2/100);
		
		String seven1 = seven.replaceAll("[^0-9]", "");
		double seven2 = Double.parseDouble(seven1);
		double seven3 = (seven2/100);
		
		String eight1 = eight.replaceAll("[^0-9]", "");
		double eight2 = Double.parseDouble(eight1);
		double eight3 = (eight2/100);
		
		String nine1 = nine.replaceAll("[^0-9]", "");
		double nine2 = Double.parseDouble(nine1);
		double nine3 = (nine2/100);
		
		String ten1 = ten.replaceAll("[^0-9]", "");
		double ten2 = Double.parseDouble(ten1);
		double ten3 = (ten2/100);
		
		String tenone1 = tenone.replaceAll("[^0-9]", "");
		double tenone2 = Double.parseDouble(tenone1);
		double tenone3 = (tenone2/100);
		
		String tentwo1 = tentwo.replaceAll("[^0-9]", "");
		double tentwo2 = Double.parseDouble(tentwo1);
		double tentwo3 = (tentwo2/100);
		
		String tenthree1 = tenthree.replaceAll("[^0-9]", "");
		double tenthree2 = Double.parseDouble(tenthree1);
		double tenthree3 = (tenthree2/100);
		
		String tenfour1 = tenfour.replaceAll("[^0-9]", "");
		double tenfour2 = Double.parseDouble(tenfour1);
		double tenfour3 = (tenfour2/100);
		
		String tenfive1 = tenfive.replaceAll("[^0-9]", "");
		double tenfive2 = Double.parseDouble(tenfive1);
		double tenfive3 = (tenfive2/100);
		
		String tensix1 = tensix.replaceAll("[^0-9]", "");
		double tensix2 = Double.parseDouble(tensix1);
		double tensix3 = (tensix2/100);
		
		String tenseven1 = tenseven.replaceAll("[^0-9]", "");
		double tenseven2 = Double.parseDouble(tenseven1);
		double tenseven3 = (tenseven2/100);
		
		String teneight1 = teneight.replaceAll("[^0-9]", "");
		double teneight2 = Double.parseDouble(teneight1);
		double teneight3 = (teneight2/100);
		
		String tennine1 = tennine.replaceAll("[^0-9]", "");
		double tennine2 = Double.parseDouble(tennine1);
		double tennine3 = (tennine2/100);
		
		String twoten1 = twoten.replaceAll("[^0-9]", "");
		double twoten2 = Double.parseDouble(twoten1);
		double twoten3 = (twoten2/100);
		
		int betMoney1 = Integer.parseInt(betMoney);
		
		if(betMoney1 < 3000) {
			model.addAttribute("msg", "최소 배팅금액은 $3000입니다.");
			return "forward:index?formpath=gameList";
		}
		
		if(DTO.getMoney() < betMoney1) {
			model.addAttribute("msg", "최대 배팅금액을 초과했습니다.");
			return "forward:index?formpath=gameList";
		}
		double game_result = one3*two3*three3*four3*five3*six3*seven3*eight3*nine3*ten3*tenone3*tentwo3*tenthree3*tenfour3*tenfive3*tensix3*tenseven3*
				teneight3*tennine3*twoten3;
		Double db_result = betMoney1*one3*two3*three3*four3*five3*six3*seven3*eight3*nine3*ten3*tenone3*tentwo3*tenthree3*tenfour3*tenfive3*tensix3*tenseven3*
				teneight3*tennine3*twoten3;
		int result = db_result.intValue();
		
		model.addAttribute("one", one);
		model.addAttribute("two", two);
		model.addAttribute("three", three);
		model.addAttribute("four", four);
		model.addAttribute("five", five);
		model.addAttribute("six", six);
		model.addAttribute("seven", seven);
		model.addAttribute("eight", eight);
		model.addAttribute("nine", nine);
		model.addAttribute("ten", ten);
		model.addAttribute("seven", seven);
		model.addAttribute("tenone", tenone);
		model.addAttribute("tentwo", tentwo);
		model.addAttribute("tenthree", tenthree);
		model.addAttribute("tenfour", tenfour);
		model.addAttribute("tenfive", tenfive);
		model.addAttribute("tensix", tensix);
		model.addAttribute("tenseven", tenseven);
		model.addAttribute("teneight", teneight);
		model.addAttribute("tennine", tennine);
		model.addAttribute("twoten", twoten);
		model.addAttribute("betMoney", betMoney1);
		model.addAttribute("game_result", game_result);
		model.addAttribute("result", result);
		
		return "forward:index?formpath=gameCheck";
	}
	
	@RequestMapping (value="gameComplete")
		public String gameComplete(BettingDTO DTO, HttpSession session) {
		
		if(DTO.getOne() == null) {
			DTO.setOne("X");
		}
		
		if(DTO.getTwo() == null) {
			DTO.setTwo("X");
		}
		
		if(DTO.getThree() == null) {
			DTO.setThree("X");
		}
		
		if(DTO.getFour() == null) {
			DTO.setFour("X");
		}
		
		if(DTO.getFive() == null) {
			DTO.setFive("X");
		}
		
		if(DTO.getSix() == null) {
			DTO.setSix("X");
		}
		
		if(DTO.getSeven() == null) {
			DTO.setSeven("X");
		}
		
		if(DTO.getEight() == null) {
			DTO.setEight("X");
		}
		
		if(DTO.getNine() == null) {
			DTO.setNine("X");
		}
		
		if(DTO.getTen() == null) {
			DTO.setTen("X");
		}
		
		if(DTO.getTenone() == null) {
			DTO.setTenone("X");
		}
		
		if(DTO.getTentwo() == null) {
			DTO.setTentwo("X");
		}
		
		if(DTO.getTenthree() == null) {
			DTO.setTenthree("X");
		}
		
		if(DTO.getTenfour() == null) {
			DTO.setTenfour("X");
		}
		
		if(DTO.getTenfive() == null) {
			DTO.setTenfive("X");
		}
		
		if(DTO.getTensix() == null) {
			DTO.setTensix("X");
		}
		
		if(DTO.getTenseven() == null) {
			DTO.setTenseven("X");
		}
		
		if(DTO.getTeneight() == null) {
			DTO.setTeneight("X");
		}
		
		if(DTO.getTennine() == null) {
			DTO.setTennine("X");
		}
		
		if(DTO.getTwoten() == null) {
			DTO.setTwoten("X");
		}
		
		DTO.setId(session.getAttribute("id").toString());
		DTO.setResults("대기");
		MemberDTO DTO2 = service.memberInfo(session.getAttribute("id").toString());
		service.betMoney(DTO, DTO2);
		service.betting(DTO);
		
			return "forward:index?formpath=home";
		}
	@RequestMapping (value="bettingList")
	public String bettingList(HttpSession session, Model model) {
		String id = session.getAttribute("id").toString(); 
		model.addAttribute("bettingDB", service.bettingList(id));
		return "forward:mypage?page=bettingList";
	}
	
	@RequestMapping (value="bettingInfo")
	public String bettingInfo(int info, Model model) {
		model.addAttribute("bettingInfo", service.bettingInfo(info));
		return "forward:mypage?page=bettingInfo";
	}
	
	@RequestMapping (value="gameInfo")
	public String gameInfo(String info, Model model) {
		model.addAttribute("gameInfo", service.gameInfo(info));
		return "forward:adminpage?page=gameInfo";
	}
	
	@RequestMapping (value="gameModify")
	public String gameModify(String info, Model model) {
		model.addAttribute("gameInfo", service.gameInfo(info));
		return "forward:adminpage?page=gameModify";
	}
	
	@RequestMapping (value="gameModifyProc")
	public String gameModifyProc(SoccerDTO DTO, String win1, String draw1, String lose1, Model model) {
		if(win1 == "" || draw1 == "" || lose1 == "") {
			model.addAttribute("msg", "배당을 제대로 입력하세요.");
		return "forward:gameModify";
		}
		
		DTO.setWin(Double.parseDouble(win1));
		DTO.setDraw(Double.parseDouble(draw1));
		DTO.setLose(Double.parseDouble(lose1));

		service.gameModify(DTO, model);
		return "forward:gameModify";
	}
	
	@RequestMapping (value="gameDelete")
	public String gameDelete(String info) {
		service.gameDelete(info);
		return "forward:gameManage";
	}
	
	@RequestMapping (value="bettingManage")
	public String bettingManage(Model model) {
		model.addAttribute("bettingDB", service.bettingManage());
		return "forward:adminpage?page=bettingManage";
	}
	
	@RequestMapping (value="bettingManageInfo")
	public String bettingManageInfo(int info, Model model) {
		model.addAttribute("bettingInfo", service.bettingInfo(info));
		return "forward:adminpage?page=bettingManageInfo";
	}
	
	@RequestMapping (value="bettingModify")
	public String bettingModfiy(BettingDTO DTO) {
		service.bettingModify(DTO);
		return "forward:bettingManage";
	}
	
	@RequestMapping (value="bettingDelete")
	public String bettingDelete(int info) {
		service.bettingDelete(info);
		return "forward:bettingManage";
	}
	
	
	
}
