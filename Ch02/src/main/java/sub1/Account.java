package sub1;

import javax.servlet.jsp.JspWriter;

public class Account {

	private String bank;
	private String id;
	private String name;
	private int money;
	
	public Account(String bank, String id, String name, int money) {
		this.bank = bank;
		this.id = id;
		this.name = name;
		this.money = money;
	}
	
	public void deposit(int money) {
		this.money += money;
	}
	public void withdraw(int money) {
		this.money -= money;
	}
	
	public void show(JspWriter out) throws Exception {
		out.print("<p>");
		out.print("����� : "+bank+"<br/>");
		out.print("���¹�ȣ : "+id+"<br/>");
		out.print("������ : "+name+"<br/>");
		out.print("�����ܾ� : "+money+"<br/>");
		out.print("</p>");
	}
}
