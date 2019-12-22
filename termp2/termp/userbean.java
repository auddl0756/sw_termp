package termp;
import java.io.Serializable;

public class userbean implements Serializable{

	//private static final long serialVersionUID = -6257442007414798009L;
	private String id;
	 private String pw;
	 private int game1_win;
	 private int game1_lose;
	 private int game2_win;
	 private int game2_draw;
	 private int game2_lose;
	 
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
	
	public int getGame1_win(){
		return game1_win; 
	}
	public void setGame1_win(int game1_win){
		this.game1_win=game1_win;
		
	}

	public int getGame1_lose(){
		return game1_lose;
	}
	public void setGame1_lose(int game1_lose){
		this.game1_lose=game1_lose;
	}

	public int getGame2_win(){
		return game2_win; 
	}
	public void setGame2_win(int game2_win){
		this.game2_win=game2_win;
		
	}

	public int getGame2_draw(){
		return game2_draw; 
	}
	public void setGame2_draw(int game2_draw){
		this.game2_draw=game2_draw;
		
	}

	public int getGame2_lose(){
		return game2_lose; 
	}
	public void setGame2_lose(int game2_lose){
		this.game2_lose=game2_lose;
		
	}


}



