package egovframework.example.login.service;

public class LoginVO {

	private String mbrNo;
	private String loginId;
	private String pwd;
	private String pwdChgDt;
	private String tmpPwdIssuDt;
	private int loginFailCnt;
	private int cpNo;
	private String email;
	private String joinDt;
	private String rsgstrId;
	private String rsgstDt;
	private String authYn;
	
	
	public String getAuthYn() {return authYn;}
	public void setAuthYn(String authYn) {this.authYn = authYn;}
	
	public String getMbrNo() {return mbrNo;}
	public void setMbrNo(String mbrNo) {this.mbrNo = mbrNo;}
	
	public String getLoginId() {return loginId;}
	public void setLoginId(String loginId) {this.loginId = loginId;}
	
	public String getPwd() {return pwd;}
	public void setPwd(String pwd) {this.pwd = pwd;}
	
	public String getPwdChgDt() {return pwdChgDt;}
	public void setPwdChgDt(String pwdChgDt) {this.pwdChgDt = pwdChgDt;}
	
	public String getTmpPwdIssuDt() {return tmpPwdIssuDt;}
	public void setTmpPwdIssuDt(String tmpPwdIssuDt) {this.tmpPwdIssuDt = tmpPwdIssuDt;}
	
	public int getLoginFailCnt() {return loginFailCnt;}
	public void setLoginFailCnt(int loginFailCnt) {this.loginFailCnt = loginFailCnt;}
	
	public int getCpNo() {return cpNo;}
	public void setCpNo(int cpNo) {this.cpNo = cpNo;}
	
	public String getEmail() {return email;}
	public void setEmail(String email) {this.email = email;}
	
	public String getJoinDt() {return joinDt;}
	public void setJoinDt(String joinDt) {this.joinDt = joinDt;}
	
	public String getRsgstrId() {return rsgstrId;}
	public void setRsgstrId(String rsgstrId) {this.rsgstrId = rsgstrId;}
	
	public String getRsgstDt() {return rsgstDt;}
	public void setRsgstDt(String rsgstDt) {this.rsgstDt = rsgstDt;}
	
}
