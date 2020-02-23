package com.controller.front;

import com.bean.*;
import com.github.pagehelper.PageInfo;
import com.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.text.NumberFormat;
import java.util.*;

@Controller
@RequestMapping("/homeController")
public class F_HomeController {

    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private VIPService vipService;
    @Autowired
    private CourseService courseService;
    @Autowired
    private VIPCardService vipCardService;
    @Autowired
    private LockerService lockerService;


    /**
     * 轮播逻辑视图
     * @return
     */
    @GetMapping("/slider")
    public String index1(){
        return "client/debris/slider";
    }

    /**
     * 主页面逻辑视图
     * @return
     */
    @GetMapping("/homePage")
    public String homePage(){
        return "client/frontDesk_Page";
    }

    /**
     * 跳到ID登录界面
     * @return
     */
    @GetMapping("/login")
    public String login(){
        return "client/debris/frontDesk_ID_login";
    }

    /**
     * 地图逻辑视图
     * @return
     */
    @GetMapping("/map")
    public String map(){
        return "client/debris/map";
    }

    /**
     * 介绍逻辑视图
     * @return
     */
    @GetMapping("/introduce")
    public String index2(){
        return "client/debris/introduce";
    }

    /**
     *办理会员逻辑视图
     * @return
     */
    @GetMapping("/handVIP")
    public String handVIP(){
        return "client/debris/handing_vip";
    }

    /**
     * 我的资料逻辑视图
     * @return
     */
    @GetMapping("/my_message")
    public String myMessage(){
        return "client/debris/my_message";
    }

    /**
     * 显示我的信息
     * @param mav
     * @param userID
     * @return
     */
    @GetMapping("/message")
    public ModelAndView message(ModelAndView mav,String userID){
        VIP vip = vipService.getVIPByUserID(userID);

        //当前日期与资料日期判断，今日是否为生日
        Calendar instance = Calendar.getInstance();
        String now=instance.get(Calendar.MONTH)+1+"-"+instance.get(Calendar.DATE);
        if (now.equals(vip.getBirthDay().substring(5,10))){
            mav.addObject("birthDay",true);
        }
        mav.addObject("birthDay",false);

        if (vip.getLockerId()!=null){
            Locker locker = lockerService.getLocker(vip.getLockerId());
            mav.addObject("locker",locker);
        }else{
            mav.addObject("locker",null);
        }

        mav.addObject("vip",vip);
        mav.setViewName("client/debris/my_message");
        return mav;
    }

    /**
     * 查询所有课程
     * @param pageNum
     * @param pageSize
     * @param mav
     * @return
     */
    @GetMapping("/classes.do")
    public ModelAndView classes(@RequestParam(value = "pageNum",required = false,defaultValue = "1") int pageNum,
                                @RequestParam(value = "pageSize",required = false,defaultValue = "5") int pageSize,
                                ModelAndView mav){
        List<Course> courseList = courseService.getCourseList(pageNum, pageSize);
        PageInfo<Course> coursePageInfo = new PageInfo<>(courseList);
        mav.addObject("courseList",coursePageInfo);
        mav.setViewName("client/debris/course");
        return mav;
    }

    /**
     * 报名课程
     * @param request
     * @param courseId
     * @return
     */
    @GetMapping("/apply.do")
    @ResponseBody
    public Map<String ,String> apply(HttpServletRequest request, int courseId){
        HashMap<String,String> map = new HashMap<>();
        String userID = (String) request.getSession().getAttribute("userID");//从session获取账号，就是登录成功后放进去的
        VIP vip = vipService.getVIPByUserID(userID);
        if (userID==null){
            System.out.println("请先登录");
            map.put("message","请先登录");
        }else{
            //先判断该账号是否已报名：依据vipId查看第三张表
            int i = vipService.applied(vip.getId(), courseId);//为null则=0
            if (i<=0){//null，没报过此课程，进行报名操作
                //向 '账号—课程表' 添加两边的id就可以
                int applieding = vipService.applieding(vip.getId(), courseId);
                if (applieding>0)//成功执行
                    map.put("message","报名成功");
                else
                    map.put("message","执行添加语句时出错");
            }else{
                map.put("message","您已报过此课程");
            }
        }
        return map;
    }


    /**
     * 我的会员逻辑视图
     * @return
     */
    @GetMapping("/my_vip")
    public String myVIP(){
        return "client/debris/my_vip";
    }

    @GetMapping("/my_vip.do")
    public ModelAndView myVIPDo(HttpServletRequest request,ModelAndView mav){
        String userID = (String) request.getSession().getAttribute("userID");
        VIP vip = vipService.getVIPByUserID(userID);//得到会员对象
        VIP_Card card = vipCardService.getCard(vip.getVipCardId());//该对象的会员卡
        //计算会员到期日期
        String dateTime= String.valueOf(vip.getHandingTime());
        Integer handYear = Integer.valueOf(dateTime.substring(0, 4));//办理年份
        String timeOut=handYear+card.getType()+"-"+dateTime.substring(5, 10);//到期日期

        mav.addObject("vip",vip);
        mav.addObject("card",card);
        mav.addObject("timeOut",timeOut);
        mav.setViewName("client/debris/my_vip");
        return mav;
    }

    /**
     * 我的课程逻辑视图，并显示所有课程
     * @return
     */
    @GetMapping("/my_classes")
    public ModelAndView myClasses(HttpServletRequest request,ModelAndView mav){
        System.out.println("进入我的课程控制器");
        ArrayList<Course> courses = new ArrayList<>();
        String userID = (String) request.getSession().getAttribute("userID");
        VIP vip = vipService.getVIPByUserID(userID);
        System.out.println(vip.getId());
        List<VIP_Course> vcs = vipService.getVIP_Course(vip.getId());//获取到该用户的所有课程id（用对象存起来）
        for (int i = 0; i < vcs.size(); i++) {
            //查询出课程对象并相继放进上面的集合中
            courses.add(courseService.getCourse(vcs.get(i).getCourseId()));
        }
        for (Course course:courses) {
            System.out.println(course.getName());//可以输出数据
        }
        mav.addObject("courses",courses);//把集合传过页面去
        mav.setViewName("client/debris/my_Course");
        return mav;
    }

    /**
     * 取消课程
     * @param request
     * @param courseId
     * @return
     */
    @GetMapping("/cancelCourse")
    @ResponseBody
    public Map<String,Object> cancelCourse(HttpServletRequest request,int courseId){
        HashMap<String, Object> map = new HashMap<>();
        String userID = (String) request.getSession().getAttribute("userID");
        System.out.println("userID = " + userID);
        VIP vip = vipService.getVIPByUserID(userID);
        int i = vipService.cancelCourse(vip.getId(), courseId);
        if (i>0){//如果执行成功
            map.put("message",true);
        }else{
            map.put("message",false);
        }
        return map;
    }


    /**
     * 我的私教逻辑视图，并显示所有私教
     * @return
     */
    @GetMapping("/my_trainer.do")
    public ModelAndView myTrainer(HttpServletRequest request,ModelAndView mav){
        System.out.println("进入我的私教控制器");
        ArrayList<Employee> trainers = new ArrayList<>();
        String userID = (String) request.getSession().getAttribute("userID");
        VIP vip = vipService.getVIPByUserID(userID);
        List<VIP_Trainer> vcs = vipService.getVIP_Trainer(vip.getId());//获取到该用户的所有私教id（用对象存起来）
        for (int i = 0; i < vcs.size(); i++) {
            //查询出私教对象并相继放进上面的集合中
            trainers.add(employeeService.getEmployeeById(vcs.get(i).getTrainerId()));
        }
        for (Employee trainer:trainers) {
            System.out.println(trainer.getName());//可以输出数据
        }
        mav.addObject("trainers",trainers);//把集合传过页面去
        mav.setViewName("client/debris/my_trainer");
        return mav;
    }

    /**
     * 获取全部私教
     * @param mav
     * @return
     */
    @GetMapping("/getTrainerList")
    @ResponseBody
    public ModelAndView getTrainerList(@RequestParam(value = "pageNum",required = false,defaultValue = "1") int pageNum,
                                       @RequestParam(value = "pageSize",required = false,defaultValue = "8") int pageSize,
                                       ModelAndView mav){
        List<Employee> trainerList = employeeService.getTrainerList(pageNum, pageSize);//3是私教的职位类型编号
        System.out.println(trainerList.get(0).toString());
        PageInfo<Employee> employeePageInfo = new PageInfo<>(trainerList);
        mav.addObject("trainerList",employeePageInfo);
        mav.setViewName("client/debris/trainer");
        return mav;
    }

    /**
     * 私教详情
     */
    @GetMapping("/trainerMessage")
    public ModelAndView trainerMessage(ModelAndView mav,int trainerId){
        Employee trainer = employeeService.getTrainerById(trainerId);
        mav.addObject("trainer",trainer);
        mav.setViewName("client/debris/trainer_Message");
        return mav;
    }

    /**
     * 课程详细信息
     * @param mav
     * @param courseId
     * @return
     */
    @GetMapping("/classMessage")
    public ModelAndView classMessage(ModelAndView mav,int courseId){
        Course course = courseService.getCourse(courseId);
        mav.addObject("course",course);
        mav.setViewName("client/debris/course_Message");
        return mav;
    }

    /**
     * 体脂率
     * @param gender
     * @param weight
     * @param waistLine
     * @return
     */
    @GetMapping("/body_fat")
    @ResponseBody
    public Map<String,Object> bodyFat(String gender,String weight ,String waistLine ){
        double weight1= Double.parseDouble(weight);
        double waistLine1= Double.parseDouble(waistLine);
        HashMap<String, Object> map = new HashMap<>();
        double fat_percent=0;
        NumberFormat num = NumberFormat.getPercentInstance();//转成百分比
        if (gender.equals("女")){
            fat_percent = (waistLine1*0.74 - (weight1*0.082+34.89))/weight1;
            if (fat_percent<0){
                map.put("fatPercent","请输入正常数值");
            }else{
                map.put("fatPercent",num.format(fat_percent));
            }
        }else if (gender.equals("男")){
            fat_percent = (waistLine1*0.74 - (weight1*0.082+44.74))/weight1;
            if (fat_percent<0){
                map.put("fatPercent","请输入正常数值");
            }else{
                map.put("fatPercent",num.format(fat_percent));
            }
        }
        return map;
    }

}
