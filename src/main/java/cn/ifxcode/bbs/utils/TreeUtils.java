package cn.ifxcode.bbs.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.Map.Entry;

import cn.ifxcode.bbs.entity.Resources;

public class TreeUtils {

	public static List<Resources> formatResources(List<Resources> list) {
		
		List<Resources> root = new ArrayList<Resources>();
		
		if(list != null && list.size() > 0) {
		
			// 节点列表（散列表，用于临时存储节点对象）
			HashMap<Integer, Resources> nodemap = new HashMap<Integer, Resources>();
			
			// 根据结果集构造节点列表（存入散列表）
			for (Iterator<Resources> it = list.iterator(); it.hasNext();) {
				Resources res = it.next();
				nodemap.put(res.getResId(), res);
			}
			// 构造无序的多叉树
			Set<Entry<Integer, Resources>> entrySet = nodemap.entrySet();
			for (Iterator<Entry<Integer, Resources>> it = entrySet.iterator(); it.hasNext();) {
				Resources res = it.next().getValue();
				if (res.getResParentId() == null || res.getResParentId().equals("")
						|| res.getResParentId() == 0) {
					root.add(res);
				} else {
					nodemap.get(res.getResParentId()).addChild(res);
				}
			}
		}
		
		return root.size() > 0 ? root : null;
	}
	
}