package kr.co.lookst.sns.domain;

import java.util.Date;
import java.util.Objects;

public class ProfileDto {

	private String member_id;
	private Integer profile_no;
	private String profile_img;
	private String profile_uuid;
	private String profile_type;
	private Date profile_date;
	private String profile_intro;
	
	public ProfileDto() { }

	public ProfileDto(String member_id, String profile_img, String profile_uuid,
			String profile_type, String profile_intro) {
		super();
		this.member_id = member_id;
		this.profile_img = profile_img;
		this.profile_uuid = profile_uuid;
		this.profile_type = profile_type;
		this.profile_intro = profile_intro;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public Integer getProfile_no() {
		return profile_no;
	}

	public void setProfile_no(Integer profile_no) {
		this.profile_no = profile_no;
	}

	public String getProfile_img() {
		return profile_img;
	}

	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}

	public String getProfile_uuid() {
		return profile_uuid;
	}

	public void setProfile_uuid(String profile_uuid) {
		this.profile_uuid = profile_uuid;
	}

	public String getProfile_type() {
		return profile_type;
	}

	public void setProfile_type(String profile_type) {
		this.profile_type = profile_type;
	}

	public Date getProfile_date() {
		return profile_date;
	}

	public void setProfile_date(Date profile_date) {
		this.profile_date = profile_date;
	}

	public String getProfile_intro() {
		return profile_intro;
	}

	public void setProfile_intro(String profile_intro) {
		this.profile_intro = profile_intro;
	}

	@Override
	public String toString() {
		return "ProfileDto [member_id=" + member_id + ", profile_no=" + profile_no + ", profile_img=" + profile_img
				+ ", profile_uuid=" + profile_uuid + ", profile_type=" + profile_type + ", profile_date=" + profile_date
				+ ", profile_intro=" + profile_intro + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(member_id, profile_date, profile_img, profile_intro, profile_no, profile_type,
				profile_uuid);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ProfileDto other = (ProfileDto) obj;
		return Objects.equals(member_id, other.member_id) && Objects.equals(profile_date, other.profile_date)
				&& Objects.equals(profile_img, other.profile_img) && Objects.equals(profile_intro, other.profile_intro)
				&& Objects.equals(profile_no, other.profile_no) && Objects.equals(profile_type, other.profile_type)
				&& Objects.equals(profile_uuid, other.profile_uuid);
	}
	
	
	
}
