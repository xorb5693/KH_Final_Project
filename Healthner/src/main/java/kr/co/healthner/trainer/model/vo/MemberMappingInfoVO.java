package kr.co.healthner.trainer.model.vo;

public class MemberMappingInfoVO {
	private int mappingSeq;
	private int memberNo;
	private int trainerNo;
	private int trainingCnt;
	private int trainingMaxcnt;
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberNick;
	private String zip;
	private String roadAddr;
	private String detAddr;
	private String card;
	private String enrollDate;
	private int memberLevel;
	private char gender;
	private int age;
	private String memberProfile;
	private String email;
	private String expireDate;
	private String phone;
	private int emailVerification;
	public int getMappingSeq() {
		return mappingSeq;
	}
	public void setMappingSeq(int mappingSeq) {
		this.mappingSeq = mappingSeq;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getTrainerNo() {
		return trainerNo;
	}
	public void setTrainerNo(int trainerNo) {
		this.trainerNo = trainerNo;
	}
	public int getTrainingCnt() {
		return trainingCnt;
	}
	public void setTrainingCnt(int trainingCnt) {
		this.trainingCnt = trainingCnt;
	}
	public int getTrainingMaxcnt() {
		return trainingMaxcnt;
	}
	public void setTrainingMaxcnt(int trainingMaxcnt) {
		this.trainingMaxcnt = trainingMaxcnt;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberNick() {
		return memberNick;
	}
	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getRoadAddr() {
		return roadAddr;
	}
	public void setRoadAddr(String roadAddr) {
		this.roadAddr = roadAddr;
	}
	public String getDetAddr() {
		return detAddr;
	}
	public void setDetAddr(String detAddr) {
		this.detAddr = detAddr;
	}
	public String getCard() {
		return card;
	}
	public void setCard(String card) {
		this.card = card;
	}
	public String getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}
	public int getMemberLevel() {
		return memberLevel;
	}
	public void setMemberLevel(int memberLevel) {
		this.memberLevel = memberLevel;
	}
	public char getGender() {
		return gender;
	}
	public void setGender(char gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getMemberProfile() {
		return memberProfile;
	}
	public void setMemberProfile(String memberProfile) {
		this.memberProfile = memberProfile;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getExpireDate() {
		return expireDate;
	}
	public void setExpireDate(String expireDate) {
		this.expireDate = expireDate;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getEmailVerification() {
		return emailVerification;
	}
	public void setEmailVerification(int emailVerification) {
		this.emailVerification = emailVerification;
	}
	public MemberMappingInfoVO(int mappingSeq, int memberNo, int trainerNo, int trainingCnt, int trainingMaxcnt,
			String memberId, String memberPw, String memberName, String memberNick, String zip, String roadAddr,
			String detAddr, String card, String enrollDate, int memberLevel, char gender, int age, String memberProfile,
			String email, String expireDate, String phone, int emailVerification) {
		super();
		this.mappingSeq = mappingSeq;
		this.memberNo = memberNo;
		this.trainerNo = trainerNo;
		this.trainingCnt = trainingCnt;
		this.trainingMaxcnt = trainingMaxcnt;
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.memberNick = memberNick;
		this.zip = zip;
		this.roadAddr = roadAddr;
		this.detAddr = detAddr;
		this.card = card;
		this.enrollDate = enrollDate;
		this.memberLevel = memberLevel;
		this.gender = gender;
		this.age = age;
		this.memberProfile = memberProfile;
		this.email = email;
		this.expireDate = expireDate;
		this.phone = phone;
		this.emailVerification = emailVerification;
	}
	public MemberMappingInfoVO() {
		super();
		// TODO Auto-generated constructor stub
	}
}