package com.service;

import com.bean.VIP_Card;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface VIPCardService {

    //根据id查询会员卡
    VIP_Card getCard(int id);

    //查询全部会员卡
    List<VIP_Card> getCardList(@Param("pageNum") int pageNum,
                               @Param("pageSize") int pageSize);

    //根据类型查询全部会员卡
    List<VIP_Card> getCardListByType(@Param("pageNum") int pageNum,
                                     @Param("pageSize") int pageSize,
                                     int type);

    //办理会员卡
    int addCard(VIP_Card card);

    //注销会员卡
    int logoutCard(int id);

    //修改类型
    int changeType(int id,int newType);
}
