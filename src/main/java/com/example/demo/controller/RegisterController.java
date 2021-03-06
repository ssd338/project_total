package com.example.demo.controller;



import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.MemberDao;
import com.example.demo.dao.RegisterDao;
import com.example.demo.dao.ReservationDao;
import com.example.demo.vo.ClinicVo;
import com.example.demo.vo.MemberVo;
import com.example.demo.vo.RegisterVo;
import com.example.demo.vo.ReservationVo;

@Controller
public class RegisterController {

   @Autowired
   private RegisterDao registerDao;
   @Autowired
   private MemberDao memberDao;
   @Autowired
   private ReservationDao reservationDao;
// ================== Admin ========================
   
   // 예약관리자 페이지
   @RequestMapping("/reservationAdmin")
   public void reservationAdmin() {
      
   }
   
   //진료기록 등록 -clinic에 등록하는 페이지
   @RequestMapping("/adminClinic")
  public ModelAndView adminClinic() {
      ModelAndView mav = new ModelAndView();
      int cnt = registerDao.countAllRegister();   // 총 진료접수
       mav.addObject("cnt", cnt);   
       return mav;   

   }

   //진료 접수 - 예약목록 보여주는 페이지
   @GetMapping("/adminRegister")
   public ModelAndView adminRegister() {
      ModelAndView mav = new ModelAndView();
      int cnt = registerDao.countAllReservation();   // 총 진료횟수
       mav.addObject("cnt", cnt);   
       return mav;
   }   
   
   // 진료접수 - 예약 목록을 가져오는 ajax
   // 진료접수 되지 않은 (register에 등록되지 않은) 예약을 가져온다
   // 예약번호,  환자 이름, 환자 연락처, 진료과, 의료진, 예약일, 예약시간
   //
   @RequestMapping("/listReservation.ajax")
   @ResponseBody
   public ArrayList listReservation(@RequestParam HashMap map) {
      List<ReservationVo> ReservationList = registerDao.listReservation();  //모든 예약 목록 
      //(totalData,dataPerPage,currentPage)               //매개변수로 총데이터의 수, 한페이지에 나타낼데이터 수, 현재 선택된 페이지
      ArrayList list = new ArrayList();
      
       int currentPage =Integer.parseInt((String)map.get("currentPage"));    // 현재 페이지               7
       int dataPerPage = Integer.parseInt((String)map.get("dataPerPage"));   // 한페이지에 보여질 데이터의 수      5
       int totalData = Integer.parseInt((String)map.get("totalData"));       // 총 데이터의 수            31
       int end =currentPage * dataPerPage;               //현재 페이지의 끝레코드      현재페이지 * 한페이지에서 보여줄 레코드의 수      35
       int start = end - (dataPerPage);                  //현재 페이지의 시작시코드      35-5 30
       if(start<0) {
          start=0;
       }
       if(end >totalData) {                  //35>31   => 31   //5   //10
          end = totalData;
       }

       //리스트 돌면서 맵에 에약정보를 담음
       for(int i=start; i<end; i++) {   
          HashMap map2 = new HashMap();
           ReservationVo r = reservationDao.findByNo_Date_time(ReservationList.get(i).getReser_no());               //예약번호
           MemberVo m = memberDao.getMember(ReservationList.get(i).getMember_no());
           map2.put("reser_no",r.getReser_no());                           //예약번호
           map2.put("member_name",m.getName());                                 //환자이름
           map2.put("member_tel",m.getTel());                                    //환자연락처
           map2.put("dept_name", reservationDao.findByDept_name(r.getReser_no())); //예약번호로 진료과 찾아오기
           map2.put("doc_name", reservationDao.findByDoc_name(r.getReser_no()));   //예약번호로 의사이름 찾아오기
           map2.put("reserDate", r.getReser_date());                           //예약일
           map2.put("reserTime", r.getReser_time());                           //예약시간
           list.add(map2);
         }
      
      return list;
   }
   
   
   
   
   //진료 접수 -뷰페이지에서 등록버튼 눌렀을때 register에 등록해주는 기능
   @PostMapping("/insertRegister.ajax")
   @ResponseBody
   public String post_insertSubmit(@RequestParam HashMap map) {
      String msg = "";
      int reser_no =Integer.parseInt((String)map.get("reserno"));
      RegisterVo r = new RegisterVo();
      r.setRegi_no(registerDao.getNextRegiNo());
      r.setReser_no(reser_no);
      // 등록버튼 눌렀을때 동작 
      // 예약번호 가져오고 dao.getNextRegiNo()하고, sysdate로 날짜 만들어서
      // 맵을 담아서 insert로 보낸다 
      int a = registerDao.insertRegister(r);
      if(a == 1) {
         msg = "진료접수 하였습니다.";
      }else {
         msg="진료접수에 오류가 있습니다. 다시 접수 바랍니다.";
         
      }
      return msg;
   } 
   
   //진료접수 목록을 가져온다 - 진료기록(clinic)에 등록되지 않은
   @RequestMapping("/listRegister.ajax")
   @ResponseBody
   public ArrayList listRegister(@RequestParam HashMap map) {
      List<RegisterVo> RegisterList = registerDao.listRegister();  //모든 진료접수 목록 
      //(totalData,dataPerPage,currentPage)               //매개변수로 총데이터의 수, 한페이지에 나타낼데이터 수, 현재 선택된 페이지
      ArrayList list = new ArrayList();
      
       int currentPage =Integer.parseInt((String)map.get("currentPage"));    // 현재 페이지               7
       int dataPerPage = Integer.parseInt((String)map.get("dataPerPage"));   // 한페이지에 보여질 데이터의 수      5
       int totalData = Integer.parseInt((String)map.get("totalData"));       // 총 데이터의 수            31
       int end =currentPage * dataPerPage;               //현재 페이지의 끝레코드      현재페이지 * 한페이지에서 보여줄 레코드의 수      35
       int start = end - (dataPerPage);                  //현재 페이지의 시작시코드      35-5 30
       if(start<0) {
          start=0;
       }
       if(end >totalData) {                  //35>31   => 31   //5   //10
          end = totalData;
       }

     //리스트 돌면서 맵에 접수정보를 담음 - 접수번호 환자명 진료날짜 진료과 담당의 
        for(int i=start; i<end; i++) {   
            HashMap map2 = new HashMap();
            RegisterVo rg = RegisterList.get(i);
            int reser_no = rg.getReser_no();                                          //예약번호
            ReservationVo rs = reservationDao.findByNo_Date_time(reser_no);
           
            MemberVo m = memberDao.getMember(rs.getMember_no());
            System.out.println("하하:"+rs.getMember_no());
            map2.put("regi_no",rg.getRegi_no());                                        //접수번호
            map2.put("member",m);                                                       //환자정보
           
            map2.put("dept_name", reservationDao.findByDept_name(rg.getReser_no()));    //예약번호로 진료과 찾아오기
            map2.put("dept_no", rs.getDept_no());                              			//진료과번호
            map2.put("doc_name", reservationDao.findByDoc_name(rg.getReser_no()));      //예약번호로 의사이름 찾아오기
            map2.put("doc_no", rs.getDoc_no());                                 		//의사번호
            map2.put("date", rg.getRegi_date());                                 		//접수날짜
            list.add(map2);
            
          }
      
      return list;
   }
   
   //진료등록 버튼 눌렀을때 clinic으로 등록해주는 ajax
   @PostMapping("/adminInsertClinic.ajax")
   @ResponseBody
   public String insertClinic(@RequestParam HashMap map) {
      //no, mname,deptname,docname,date,content,medi,docno,deptno
      String msg = "";
      
      int regi_no =Integer.parseInt((String)map.get("no"));
      String mname = (String)map.get("mname");
      String deptname = (String)map.get("deptname");
      String docname = (String)map.get("docname");
      
      String strDate = (String)map.get("date");               //String을 sqlDate타입으로 바꿈
      Date cli_date = Date.valueOf(strDate);
      String cli_content = (String)map.get("content");
      int medi_no =Integer.parseInt((String)map.get("medi"));
      int doc_no =Integer.parseInt((String)map.get("docno"));
      int dept_no =Integer.parseInt((String)map.get("deptno"));
      int member_no =Integer.parseInt((String)map.get("memno"));
      
      ClinicVo cn = new ClinicVo(registerDao.getNextCliNo(), cli_date, cli_content, medi_no, regi_no, dept_no, doc_no, member_no);
      int a = registerDao.insertClinic(cn);
      if(a == 1) {
         msg="등록에 성공하였습니다.";
      }else {
         msg="등록절차에 오류가 있었습니다. 확인 후 다시 시도해 주세요";
      }
      
      return msg;
   } 
   
   
   
//============================ Admin ==================================
}
