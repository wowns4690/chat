package com.jointree.example.Vo;

import java.util.*;


import org.springframework.web.socket.WebSocketSession;


import lombok.Getter;
import lombok.Setter;

@Getter 
@Setter
public class ChatRoom {
    private String rmd;
    private String nm;
    private String foodCategory;
    private String menu;
    private String menuprice;
    private String orderType;
    private String roomMaster;
    private String masterRank;
    private String roomMasterId;
    private String storeName;
    private String storeAdress;
    private String storeRoadAdress;
    private String storeX;
    private String storeY;
    private String storeUrl;
    private String useYn;
    private String chatDate;
    private Set<WebSocketSession> sessions = new HashSet<WebSocketSession>();

    
    
}