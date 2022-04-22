package moram.vo;

public class CalendarVO {
	private String mem_id;
	private String placetime_stime;
	private String placetime_etime;
	private String place_no;
	private String placetime_date;
	private String placepay_state;
	private String placetime_state;
	private String start;
	private String end;
	private String title;
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getPlacetime_stime() {
		return placetime_stime;
	}
	public void setPlacetime_stime(String placetime_stime) {
		this.placetime_stime = placetime_stime;
	}
	public String getPlacetime_etime() {
		return placetime_etime;
	}
	public void setPlacetime_etime(String placetime_etime) {
		this.placetime_etime = placetime_etime;
	}
	public String getPlace_no() {
		return place_no;
	}
	public void setPlace_no(String place_no) {
		this.place_no = place_no;
	}
	public String getPlacetime_date() {
		return placetime_date;
	}
	public void setPlacetime_date(String placetime_date) {
		this.placetime_date = placetime_date;
	}
	public String getPlacepay_state() {
		return placepay_state;
	}
	public void setPlacepay_state(String placepay_state) {
		this.placepay_state = placepay_state;
	}
	public String getPlacetime_state() {
		return placetime_state;
	}
	public void setPlacetime_state(String placetime_state) {
		this.placetime_state = placetime_state;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Override
	public String toString() {
		return "CalendarVO [mem_id=" + mem_id + ", placetime_stime=" + placetime_stime + ", placetime_etime="
				+ placetime_etime + ", place_no=" + place_no + ", placetime_date=" + placetime_date
				+ ", placepay_state=" + placepay_state + ", placetime_state=" + placetime_state + ", start=" + start
				+ ", end=" + end + ", title=" + title + "]";
	}
	
	
}
