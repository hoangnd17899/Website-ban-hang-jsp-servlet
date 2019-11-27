package BEAN;

public class Cart {
	private int CartID;
	private int Count;
	private int CustomerID;
	public int getCartID() {
		return CartID;
	}
	public void setCartID(int cartID) {
		CartID = cartID;
	}
	public int getCount() {
		return Count;
	}
	public void setCount(int count) {
		Count = count;
	}
	public int getCustomerID() {
		return CustomerID;
	}
	public void setCustomerID(int customerID) {
		CustomerID = customerID;
	}
}
