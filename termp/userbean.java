package termp;
import java.io.Serializable;

public class userbean implements Serializable{

	//private static final long serialVersionUID = -6257442007414798009L;
	private String id;
	 private String pw;
	 
	 public String getId(){
			return id;
	}
	public void setId(String id){
		this.id=id;
	}
	public String getPw(){
		return pw;
	}
	public void setPw(String pw){
		this.pw=pw;
	}

}



