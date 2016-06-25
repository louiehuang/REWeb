package model;

/**
 * 评论实体
 * @author hlyin
 *
 */
public class Comment {
	private int U_id; //用户id
	private int H_id;//房屋id，不外键
	private int C_Type; //评论类型（新房、二手房、出租、求租、求购...）
	private String Comm_comment; //评论内容
	
	/**
	 * 返回评论用户id
	 * @return
	 */
	public int getU_id() {
		return U_id;
	}
	/**
	 * 设置评论用户id
	 * @param u_id
	 */
	public void setU_id(int u_id) {
		U_id = u_id;
	}
	
	/**
	 * 返回房屋id
	 * @return
	 */
	public int getH_id() {
		return H_id;
	}
	/**
	 * 设置房屋id
	 * @param h_id
	 */
	public void setH_id(int h_id) {
		H_id = h_id;
	}
	
	/**
	 * 返回评论的房屋类型（新房、二手房、出租、求租、求购...）
	 * @return
	 */
	public int getC_Type() {
		return C_Type;
	}
	/**
	 * 设置评论的房屋类型（新房、二手房、出租、求租、求购...）
	 * @param c_Type
	 */
	public void setC_Type(int c_Type) {
		C_Type = c_Type;
	}
	
	/**
	 * 返回评论内容
	 * @return
	 */
	public String getComm_comment() {
		return Comm_comment;
	}
	
	/**
	 * 设置评论内容
	 * @param comm_comment
	 */
	public void setComm_comment(String comm_comment) {
		Comm_comment = comm_comment;
	}
	
}
