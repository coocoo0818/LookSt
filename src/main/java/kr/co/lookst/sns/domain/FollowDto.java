package kr.co.lookst.sns.domain;

import java.util.Objects;

public class FollowDto {
	
	private String member_id;
	private Integer follow_no;
	private String follower;
	private String following;
	
	
	public FollowDto() { }


	public FollowDto(String member_id, String follower, String following) {
		//super();
		this.member_id = member_id;
		this.follower = follower;
		this.following = following;
	}


	public String getMember_id() {
		return member_id;
	}


	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}


	public Integer getFollow_no() {
		return follow_no;
	}

	public void setFollower(String follower) {
		this.follower = follower;
	}


	public String getFollowing() {
		return following;
	}


	public void setFollowing(String following) {
		this.following = following;
	}


	@Override
	public String toString() {
		return "FollowDto [member_id=" + member_id + ", follow_no=" + follow_no + ", follower=" + follower
				+ ", following=" + following + "]";
	}


	@Override
	public int hashCode() {
		return Objects.hash(follow_no, follower, following, member_id);
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		FollowDto other = (FollowDto) obj;
		return Objects.equals(follow_no, other.follow_no) && Objects.equals(follower, other.follower)
				&& Objects.equals(following, other.following) && Objects.equals(member_id, other.member_id);
	}
	
	
	
	
	
}
