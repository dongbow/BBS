package cn.ifxcode.bbs.bean;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.ifxcode.bbs.entity.Resources;

public class TreeNode {

	private int id;
	private int pId;
	private String name;
	private boolean checked;
	
	
	public TreeNode() {
	}


	public TreeNode(int id, int pId, String name, boolean checked) {
		this.id = id;
		this.pId = pId;
		this.name = name;
		this.checked = checked;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getpId() {
		return pId;
	}


	public void setpId(int pId) {
		this.pId = pId;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public boolean isChecked() {
		return checked;
	}


	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	
	public static List<TreeNode> buildTreeNode(List<Resources> masterRes, List<Resources> sleRes) {
		Map<String, Object> map = new HashMap<String, Object>();
		for (Resources sres : sleRes) {
			map.put(sres.getResSign(), sres);
		}
		List<TreeNode> nodes = new ArrayList<TreeNode>();
		for (Resources res : masterRes) {
			boolean checked = false;
			if(map.containsKey(res.getResSign())) {
				checked = true;
			}
			TreeNode node = new TreeNode(res.getResId(), res.getResParentId(), res.getResName(), checked);
			nodes.add(node);
		}
		return nodes;
	}
	
}
