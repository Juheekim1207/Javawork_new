package mysql.data;

import java.sql.Timestamp;

public class GuestDto {
	private String num;
	private String writer;
	private String avata;
	private String content;
	private String pass;
	private Timestamp writeday;
	
	//default생성자
	public GuestDto() { 
		
	}

	//insert 생성자
	public GuestDto(String writer, String avata, String content, String pass) {
		super();
		this.writer = writer;
		this.avata = avata;
		this.content = content;
		this.pass = pass;
	}

	//update,delete,view 생성자
	public GuestDto(String num, String writer, String avata, String content, String pass) {
		super();
		this.num = num;
		this.writer = writer;
		this.avata = avata;
		this.content = content;
		this.pass = pass;
	}

	//setter,getter 
	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getAvata() {
		return avata;
	}

	public void setAvata(String avata) {
		this.avata = avata;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public Timestamp getWriteday() {
		return writeday;
	}

	public void setWriteday(Timestamp writeday) {
		this.writeday = writeday;
	}


}
