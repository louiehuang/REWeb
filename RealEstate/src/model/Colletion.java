package model;

/**
 * 收藏实体
 * @author hlyin
 *
 */
public class Colletion {
	private int U_id;	//用户id
	private int H_id;//房屋id，不外键
	private int C_Type; //收藏类型（新房表、二手房表、出租表、求租表、求购表）
	
	/**
	 * 返回收藏用户id
	 * @return
	 */
	public int getU_id() {
		return U_id;
	}
	/**
	 * 设置收藏用户id
	 * @param u_id
	 */
	public void setU_id(int u_id) {
		U_id = u_id;
	}
	
	/**
	 * 返回收藏房屋id
	 * @return
	 */
	public int getH_id() {
		return H_id;
	}
	/**
	 * 设置收藏房屋id
	 * @param h_id
	 */
	public void setH_id(int h_id) {
		H_id = h_id;
	}
	
	/**
	 * 返回收藏的房屋类型（表明收藏的是新房、二手房、出租、求租、求购）
	 * @return
	 */
	public int getC_Type() {
		return C_Type;
	}
	/**
	 * 设置收藏的房屋类型（表明收藏的是新房、二手房、出租、求租、求购）
	 * @param c_Type
	 */
	public void setC_Type(int c_Type) {
		C_Type = c_Type;
	}
	
	
	
}
