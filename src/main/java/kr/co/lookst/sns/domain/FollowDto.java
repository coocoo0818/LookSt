package kr.co.lookst.sns.domain;

import java.util.Objects;

public class FollowDto {
	
	private String member_id;
	private String member_nick;
	private String follower;
	private String following;
	
	public FollowDto() { }

	public FollowDto(String member_id, String member_nick, String follower, String following) {
		//super();
		this.member_id = member_id;
		this.member_nick = member_nick;
		this.follower = follower;
		this.following = following;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_nick() {
		return member_nick;
	}

	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
	}

	public String getFollower() {
		return follower;
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
	public int hashCode() {
		return Objects.hash(follower, following, member_id, member_nick);
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
		return Objects.equals(follower, other.follower) && Objects.equals(following, other.following)
				&& Objects.equals(member_id, other.member_id) && Objects.equals(member_nick, other.member_nick);
	}

	@Override
	public String toString() {
		return "FollowDto [member_id=" + member_id + ", member_nick=" + member_nick + ", follower=" + follower
				+ ", following=" + following + "]";
	}
	
	
	
	
}