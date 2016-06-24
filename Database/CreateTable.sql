Use Realestate
Go

--普通用户表
CREATE TABLE Users (
	U_id int Not null primary key, --用户id
	U_pwd varchar(255) Not null, --密码
	U_name nvarchar(50) Not null, --用户名
	U_gender nchar(1) null, --性别
	U_header varchar(255), --用户头像URL
	U_credit int Not null, --信用等级
	U_Tele int null, --联系电话
	U_Email varchar(255) --邮箱地址
);

--企业用户表
CREATE TABLE Enterprise_Users (
	U_id int Not null primary key, --企业用户id
	U_pwd varchar(255) Not null, --密码
	U_name nvarchar(50) Not null, --企业名称
	U_info nvarchar(max), --企业信息 
	U_addr nvarchar(255), --企业地址
	U_validation int, --企业验证状态
	U_Tele int null, --企业联系电话
	U_Email varchar(255) --企业电子邮箱
);

--地段表
CREATE TABLE Region(
	 Region_id	int not null primary key, --地段id
	 Province nvarchar(20) not null, --省份
	 City nvarchar(20) not null, --城市
	 County nvarchar(20) not null --区
);
 
--户型表
 CREATE TABLE HouseType(
	 HType_id int not null primary key, --户型id
	 HType_name varchar(255) not null, --户型名称（2室1厅）
	 Remark varchar(max) null --备注
 );

--企业新房表
CREATE TABLE House_Sell_Enterprise(
	H_id	int not null primary key, --房屋id
	U_id	int not null, --用户id（企业）
	
	TotalNum	int, --总数
	SelledNum	int, --已售数目
	Addr	varchar(255), --楼盘地址
	Opening_date	varchar(20), --开盘时间 2016年6月24日
	Finish_date	varchar(20), --入住时间

	Pics	varchar(max), --房源图片(images/.../pic1;images/.../pic2;)

	--4个字段按;间隔，第一项表明户型为2室1厅70平米的房屋价格为45000元/平米，首付34万--
	Price	varchar(255) not null, --价格(45000;20000;35000) 45000/m2
	Downpayment varchar(255), --首付（34;54;39）
	MainType varchar(255), --主要户型（1;1;2）（2室1厅，70m2；2室1厅，86m2；3室1厅90m2）
	Size varchar(255), --面积（70;86;110）
	
	Region_id	int not null, --地段id
	HType_id	int not null, --户型id
	Building_name nvarchar(255), --楼盘名称（碧桂园森林城市）
	Developer_name nvarchar(255), --开发商（佛山市碧桂园投资服务咨询有限公司）
	Planning_num int, --规划户数（200000）
	Parking_num int, --停车位（200000）
	Mana_fee float, --管理费(4.5/平米)
	Property_name nvarchar(255),--物业公司（碧桂园物业）
	Greening_rate float, --绿化率(0.6→60%)
	Builtup_area float, --建筑面积（46000000）
	Lang_area float,--占地面积（13860000）


	HAuthenticity int not null, --验证状态
	Remark	varchar(max) null, --说明
	foreign key(U_id) references Enterprise_Users(U_id),
	foreign key(Region_id) references Region(Region_id), --地段外键
	foreign key(HType_id) references HouseType(HType_id) --户型外键
);

--二手房表(个人用户)
CREATE TABLE House_Sell_Secondhand(
	H_id	int not null primary key, --房屋id
	U_id	int not null, --发布用户id
	
	Price	float not null, --价格（300.5）
	Pics	varchar(max), --房源图片(images/.../pic1;images/.../pic2;)
	Region_id	int, --地段id
	HType_id	int not null, --户型id
	Size	Float not null, --面积
	HouseFloor	int, --楼层
	Decoration	int, --装修情况（普装、精装...）
	Orientation	int, --朝向（1~4表示东南西北）
	Community nvarchar(255),--小区（万福人家二期）
	Remark	varchar(max) null, --备注说明

	HAvailability int, --有效性（已被购买、未购买等）
	HAuthenticity int, --真实性（验证状态）

	foreign key(Region_id) references Region(Region_id), --地段外键
	foreign key(HType_id) references HouseType(HType_id) --户型外键
);


--房屋出租表(个人用户)
CREATE TABLE House_Sell_Rent(
	H_id	int not null primary key, --房屋id
	U_id	int not null, --用户id

	Price	float not null, --月租价格(2800）
	Region_id	int not null, --地段id
	HType_id	int not null, --户型id
	Size	float not null, --面积
	HouseFloor	int not null, --楼层
	Decoration	int, --装修情况（普装、精装...）
	Orientation	int, --朝向（1~4表示东南西北）
	Community nvarchar(255),--小区（万福人家二期）
	Remark	varchar(max) null, --备注说明

	HAvailability int not null, --有效性（已被购买、未购买等）
	HAuthenticity int not null, --真实性（验证状态）

	foreign key(Region_id) references Region(Region_id),  --地段外键
	foreign key(HType_id) references HouseType(HType_id)  --户型外键
);


--求购信息表
CREATE TABLE House_Buy_Request(
	H_id	int not null primary key, --求购信息id
	U_id	int not null, --用户id
	HDate	varchar(20) not null, --求购发布日期
	
	Pirce	float not null, --期望价格（230）
	Size	float not null, --期望面积

	Region_id	int not null, --地段id
	HType_id	int not null, --户型id
	HouseFloor	int, --期望楼层
	Decoration	int, --期望装修情况（普装、精装...）
	Orientation	int, --期望朝向（1~4表示东南西北）
	Remark	varchar(max) null, --备注说明

	HAvailability int not null, --有效性（已被购买、未购买等）
	HAuthenticity int not null, --真实性（验证状态）

	foreign key(Region_id) references Region(Region_id),  --地段外键
	foreign key(HType_id) references HouseType(HType_id)  --户型外键
);

--求租信息表
CREATE TABLE House_Buy_Rent(
	H_id	int not null primary key, --求租信息id
	U_id	int not null, --用户id
	H_Date	varchar(20) not null, --求租发布日期
	
	Pirce	float not null, --期望月租（2800）
	Size	float not null, --期望面积

	Region_id	int not null, --地段id
	HType_id	int not null, --户型id
	HouseFloor	int, --期望楼层
	Decoration	int, --期望装修情况（普装、精装...）
	Orientation	int, --期望朝向（1~4表示东南西北）
	Remark	varchar(max) null, --备注说明

	HAvailability int not null, --有效性（已被购买、未购买等）
	HAuthenticity int not null, --真实性（验证状态）

	foreign key(Region_id) references Region(Region_id),  --地段外键
	foreign key(HType_id) references HouseType(HType_id)  --户型外键
);

--收藏表
CREATE TABLE Colletion (
	U_id int Not null ,	--用户id
	H_id int Not null , --房屋id，不外键
	C_Type int Not null, --收藏类型（新房表、二手房表、出租表、求租表、求购表）
	primary key(U_id, H_id, C_Type), --主键（用户id,房屋id,收藏类型）
	foreign key(U_id) references Users(U_id) --用户id外键
);

--评论表
CREATE TABLE Comment(
	U_id int Not null ,
	H_id int Not null ,--房屋id，不外键
	C_Type int Not null, --评论类型（新房、二手房、出租、求租、求购...）
	Comm_comment nvarchar(1024) not null, --评论内容
	primary key(U_id,H_id,C_Type), --主键
	foreign key(U_id) references Users(U_id)
);

--管理员信息表
CREATE TABLE Administrator(
	Admin_id varchar(20) not null primary key, --管理员账号
	Admin_pwd varchar(32) not null, --密码
	Admin_name varchar(20) not null, --管理员姓名
	Admin_Tele int, --管理员电话
	Admin_Email varchar(255) --管理员邮箱
);

--广告表
CREATE TABLE Advertisement(
	Ad_id	int	not null primary key, --广告id
	U_id	int	null, --发布广告的用户id（个人或企业），不外键
	U_type	int null, --表明发布广告的用户是个人还是企业
	Ad_content	varchar(max) not null, --广告内容
	Ad_cost int	not null, --广告花费
	Ad_date	varchar(20) null, --时间（2016年6月24日）
);

--主键（卖方id，买方id，交易类型，房屋id）
--交易表
CREATE TABLE Transactions(
	Usell_id	int not null, --卖方用户id
	Ubuy_id	int not null, --买方用户id
	
	Trans_Type int Not null, --交易类型（新房、二手房、出租、求租、求购...）
	H_id int not null, --房屋id

	Trans_date varchar(10) not null
	primary key(Usell_id, Ubuy_id, Trans_Type, H_id),
	foreign key(Ubuy_id) references Users(U_id),
);
