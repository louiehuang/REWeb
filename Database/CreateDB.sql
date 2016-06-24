if exists(select * from sysdatabases where name='Realestate')
drop database Realestate

create database Realestate
On
(
/*--数据文件的具体描述--*/
    name=Realestate_data,  -- 主数据文件的逻辑名称
    filename='E:\javaweb\Database\Realestate_data.mdf', -- 主数据文件的物理名称
    size=10, --主数据文件的初始大小
    maxsize=100, -- 主数据文件增长的最大值
    filegrowth=15%--主数据文件的增长率
)
log on
(
/*--日志文件的具体描述,各参数含义同上--*/
    name=Realestate_log,
    filename='E:\javaweb\Database\Realestate_log.ldf',
    size=2,
    filegrowth=10%
);