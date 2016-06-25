package model;

/**
 * 求租信息实体
 * @author hlyin
 *
 */
public class House_Buy_Rent {

	private int H_id; //求租信息id
	private int U_id; //用户id
	private String H_Date; //求租发布日期
	
	private float Pirce; //期望月租（2800）
	private float Size; //期望面积

	private int Region_id; //地段id
	private int HType_id; //户型id
	private int HouseFloor; //期望楼层
	private int Decoration; //期望装修情况（普装、精装...）
	private int Orientation;//期望朝向（1~4表示东南西北）
	private String Remark; //备注说明

	private int HAvailability; //有效性（已被购买、未购买等）
	private int HAuthenticity; //真实性（验证状态）
	
	public int getH_id() {
		return H_id;
	}
	public void setH_id(int h_id) {
		H_id = h_id;
	}
	public int getU_id() {
		return U_id;
	}
	public void setU_id(int u_id) {
		U_id = u_id;
	}
	public String getH_Date() {
		return H_Date;
	}
	public void setH_Date(String h_Date) {
		H_Date = h_Date;
	}
	public float getPirce() {
		return Pirce;
	}
	public void setPirce(float pirce) {
		Pirce = pirce;
	}
	public float getSize() {
		return Size;
	}
	public void setSize(float size) {
		Size = size;
	}
	public int getRegion_id() {
		return Region_id;
	}
	public void setRegion_id(int region_id) {
		Region_id = region_id;
	}
	public int getHType_id() {
		return HType_id;
	}
	public void setHType_id(int hType_id) {
		HType_id = hType_id;
	}
	public int getHouseFloor() {
		return HouseFloor;
	}
	public void setHouseFloor(int houseFloor) {
		HouseFloor = houseFloor;
	}
	public int getDecoration() {
		return Decoration;
	}
	public void setDecoration(int decoration) {
		Decoration = decoration;
	}
	public int getOrientation() {
		return Orientation;
	}
	public void setOrientation(int orientation) {
		Orientation = orientation;
	}
	public String getRemark() {
		return Remark;
	}
	public void setRemark(String remark) {
		Remark = remark;
	}
	public int getHAvailability() {
		return HAvailability;
	}
	public void setHAvailability(int hAvailability) {
		HAvailability = hAvailability;
	}
	public int getHAuthenticity() {
		return HAuthenticity;
	}
	public void setHAuthenticity(int hAuthenticity) {
		HAuthenticity = hAuthenticity;
	}
	
	
}
