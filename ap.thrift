

/*
    当 userType 为 -1的时候，user 填入的是 userID(用户ID，以字符串的形式填入)
    pwd 应该填入你的票，为之前返回的ticket, 此时， tick 字段忽略
    一旦票不正确，应该改为密码登陆
*/
struct LoginParam {
    1:  byte    userType            // 帐号类型 1：手机号 2：第三方关联,3：邮箱 4：用户ID,6：豆豆号，7:使用自定义拓展字段来进行登陆 -1：传用户ID但票验证 100:湖北公安第三方认证
    2:  string  user
    3:  string  pwd
    4:  string  macAddr             // 必填不能为空
    5:  byte    deviceType          // 设备类型 1：PC；2：手机；3：pad；4：网页

    16: optional byte   tick        // 踢人策略 1: 强制踢(登录) 2: 不踢人(重连)
    17: optional string deviceInfo
    18: optional byte   status      /*TODO(H.) 该字段将会替换 PluginParam, reportPluginStatus 将会被缺消 */

    20: optional byte status_flag   // -1：离线，1:在线；2:隐身,3:忙碌,4:离开,5:请勿打扰,6:想聊天, 默认在线
    21: optional string clientIP    //客户端IP
    22: optional string version     // 版本号
    23: optional i64 sdkid          // SDKID 默认为0，注意：开放平台应用请忽略该字段
    24: optional string markSign    // 注意：对于连豆豆的正常应用忽略该字段，如果是开放平台应用则填入标识
    25: optional string redirectUri //auth回调地址
    200: optional string ip        // 客户端不要使用该字段
}

struct LoginResult {
    1:i32 code
    2: optional string what         // 可能保存了image信息

    3: optional i32 sessionTimeout // session失效时间(秒),请在这段时间内关闭连接重新发送空请求

    4: optional i64    sessionID   // 每次登录临时分配一ID
    5: optional i64    userID
    6: optional i64    serverTime  // 服务器当前时间

    7: optional string privateKey
    8: optional string ticket     // 对于pc端跳转网页可以直接使用此票
    9: optional string area       // 返回区域码
    //10: optional string captcha   //验证码，当需要验证码登录时会填充该字段
    11: optional i64 remainLockTime;     //剩余锁定时长 ，毫秒
}

/* 我的应用信息 */
struct MyAppInfo{
	/* 应用分类 */
	1:AppClassifyBean appClassify;
	/* 应用集合 */
	2:list<AppInfoBean> appInfoList;
	/* 响应码 */
	3:i64 code;
	/* 响应码描述语 */
	4:string msg;
}

/* 应用商店 */
struct AppStore{
	/* 应用集合*/
	1:list<AppInfoBean> appInfoList;
	/* 每页显示的条数 */
	2:i64 pageSize;
	/* 当前页数 */
	3:i64 pageNum;
	/* 总条数 */
	4:i64 totalCount;
	/* 总页数 */
	5:i64 totalPage;
	/* 响应码 */
	6:i64 code;
	/* 响应码描述语 */
	7:string msg;
}

/* 应用实体 */
struct AppInfoBean{
     /* 应用主键 */
    1:i64 id;
    
     /* 应用名称 */
    2:string name;

     /* 应用图标(图片路径) */
    3:string icon;
    
     /* 应用分类(分类ID) */
    4:i32 classify;

     /* 软件应用类型(1:原生APK,2:H5) */
    5:i32 type;

     /* h5首页访问地址 */
    6:string homeUrl;

     /* 版本号 */
    7:string version;

     /* 包名 */
    8:string packageName;

     /* 下载地址 */
    9:string downloadUrl;

     /* 安卓调取本地应用名称 */
    10:string activityName;

     /* 发布范围(多个orgID以’，’拼接) */
    11:string orgIds;

     /* 状态(1:启用,2:停用，3：删除) */
    12:i32 status;

     /* app_key */
    13:string key;

     /* app_secret */
    14:string secret;

     /* 创建者userID */
    15:i64 createUserID;

     /* 创建时间 */
    16:string createTime;

     /* 更新时间-新建分类时初始值与创建时间一致 */
    17:string updateTime;

     /* 排序字段-未设置排序值时默认为1 */
    18:i32 sort;

     /* 预留字段1 */
    19:string column1;

     /* 预留字段2 */
    20:string column2;

     /* 预留字段3 */
    21:string column3;
}

/* 应用分类实体 */
struct AppClassifyBean{
    /* 分类主键 */
    1:i32 classifyID;
    
    /* 分类名称 */
    2:string classifyName;
    
    /* 创建者userID */
    3:i64 createUserID;
	
    /* 分类状态 1：正常 2：已删除 */
    4:i32 classifyStatus;
    
    /* 创建时间 */
    5:string createTime;
    
    /* 更新时间-新建分类时初始值与创建时间一致 */
    6:string updateTime;
    
    /* 排序字段-未设置排序值时默认为1 */
    7:i32 classifySort;
    
    /* 预留字段1 */
    8:string classifyColumn1;
    
    /* 预留字段2 */
    9:string classifyColumn2;
    
    /* 预留字段3 */
    10:string classifyColumn3;
}

/* 要闻热点实体 */
struct HotNewsBean{
	/* 要闻主键 */
	1:i32 id;
	/* 要闻标题 */
	2:string newsTitle;
	/* 封面图片路径 */
	3:string newsCover;
	/* 正文内容 */
	4:string newsContent;
	/* 创建者Id */
	5:i64 createUserID;
	/* 创建时间 */
	6:string createTime;
	/* 更新时间 */
	7:string updateTime;
	/* 排序字段 */
	8:i32 newsSort;
	/* 预留字段1 */
	9:string newsColumn1;
	/* 预留字段2 */
	10:string newsColumn2;
	/* 预留字段3 */
	11:string newsColumn3;
}

/* 共用返回信息 */
struct Result{
	1:i32 code;  //是否处理成功
	2:optional string message;  //失败原因
	3:optional i64 result;  //处理的结果
}

struct AppStoreRet {
    1: i32 code
    2: optional string what
    3: optional list<MyAppInfo> appInfos
    4: optional list<AppStore> appStores
    5: optional list<AppInfoBean> appBeans
    6: optional list<AppClassifyBean> classifyBeans
    7: optional list<HotNewsBean> hotNewsBeans
    8: optional Result ret
}

struct SessionTicket {
   1: optional i64    sessionID;    // 对于http协议是连接ID,对于tcp协议为空
   2: optional string ticket;       // 对于http协议是ticket, 对于tcp协议为空
}

/* 应用商店查询参数 */
struct AppStoreQueryParam{
	/* 应用名称 */
	1:string appName;
	
	/* 应用类型 */
	2:i64 userId;
	
	/* 应用类型 */
	3:i64 appClassifyId;
	
	/* 每页显示的条数 */
	4:i64 pageSize;
	/* 当前页数 */
	5:i64 pageNum;
}

/* 用户与应用关系 */
struct AppRelationBean {
	/* 关系id */
	1:i32 id;
	/* 用户id */
	2:i64 userID;
	/* 应用id */
	3:i64 appID;
	/* 应用类型id */
	4:i32 classifyID;
	/* 关系状态 1：正常 2：已删除 */
	5:i32 relationStatus;
	/* 创建时间 */
	6:string createTime;
	/* 更新时间 */
	7:string updateTime;
	/* 排序字段 */
	8:i32 sort;
	/* 预留字段1 */
	9:string relationColumn1;
	/* 预留字段2 */
	10:string relationColumn2;
	/* 预留字段3 */
	11:string relationColumn3;
}

/*
type 类型
    1.查询我的应用列表
    参数：无
    返回：code 0,成功
          appInfos
          
    2.查询应用商店列表---根据应用发布范围(用户所属组织的在发布范围内的)
    参数：appStoreQueryParam
    返回：code 0,成功
          appStores
    
    3.模糊查询
    参数：appStoreQueryParam
            模糊查询我的应用列表时appName，userId为必传参数
            模糊查询应用商店列表时appName为必传参数
            模糊查询应用列表无分页
    返回：code 0,成功
          appBeans
    4.应用分类列表
    参数：无
    返回：code 0,成功
          classifyBeans
    5.要闻热点列表
    参数：无
    返回：code 0,成功
          hotNewsBeans
    6.添加我的应用
    参数：appRelation
    返回：code 0,成功
          ret
    7.删除我的应用
    参数：appID
    返回：code 0,成功
          ret
*/
struct AppStoreParam {
    1: optional byte type
    2: optional AppStoreQueryParam appStoreQueryParam
    3: optional AppRelationBean appRelation
    4: optional i64 appID
}



/*  interface */
service APService {
    /// 登陆接口
    /// macAddr,version字段必填
    LoginResult login_im(1: LoginParam param)

    //1.查询我的应用列表
    //2.查询应用商店列表
    //3.模糊查询
    //4.应用分类列表
    //5.要闻热点列表
    //6.添加我的应用
    //7.删除我的应用
    AppStoreRet qAppStoreS(1:SessionTicket st, 2:AppStoreParam param)
}
