package model;

/**
 * 求购信息实体
 * @author hlyin
 *
 */
public class House_Buy_Request {
	private int H_id;  //求购信息id
	private int U_id; //用户id
	private String HDate;  //求购发布日期
	private float Pirce; //期望价格（230）
	private float Size; //期望面积
	
	private int Region_id; //地段id
	private int HType_id; //户型id
	private int HouseFloor;  //期望楼层
	private int Decoration; //期望装修情况（普装、精装...）
	private int Orientation; //期望朝向（1~4表示东南西北）
	private String Remarkl; //备注说明

	private int HAvailability;//有效性（已被购买、未购买等）
	private int HAuthenticity; //真实性（验证状态）
	
	/**
	 * 获取求购信息房屋id
	 * @return
	 */
	public int getH_id() {
		return H_id;
	}
	/**
	 * 设置求购信息房屋id
	 * @param h_id
	 */
	public void setH_id(int h_id) {
		H_id = h_id;
	}
	
	/**
	 * 获取用户id
	 * @return
	 */
	public int getU_id() {
		return U_id;
	}
	/**
	 * 设置用户id
	 * @param u_id
	 */
	public void setU_id(int u_id) {
		U_id = u_id;
	}
	
	/**
	 * 返回求购发布日期
	 * @return
	 */
	public String getHDate() {
		return HDate;
	}
	/**
	 * 设置求购发布日期
	 * @param hDate
	 */
	public void setHDate(String hDate) {
		HDate = hDate;
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
	
	
	public String getRemarkl() {
		return Remarkl;
	}
	public void setRemarkl(String remarkl) {
		Remarkl = remarkl;
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
