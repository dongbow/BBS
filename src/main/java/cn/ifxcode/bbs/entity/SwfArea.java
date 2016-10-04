package cn.ifxcode.bbs.entity;

public class SwfArea {

	private int id;
	private String name;
	private int parentId;
	private int sort;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getParentId() {
		return parentId;
	}

	public void setParentId(int parentId) {
		this.parentId = parentId;
	}

	public int getSort() {
		return sort;
	}

	public void setSort(int sort) {
		this.sort = sort;
	}

	public String toString() {
		return "SwfArea [id=" + id + ", name=" + name + ", parentId="
				+ parentId + ", sort=" + sort + "]";
	}

}
