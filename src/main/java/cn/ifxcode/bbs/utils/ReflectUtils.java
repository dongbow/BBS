package cn.ifxcode.bbs.utils;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public class ReflectUtils {

	public static <T> Field[] getField(T t) {
		Class<T> clazz = (Class<T>) t.getClass();
		Field fields[] = clazz.getDeclaredFields();
		return fields;
	}
	
	public static String getFieldType(Field field) {
		return field.getGenericType().toString();
	}
	
	public static String getFieldName(Field field) {
		return field.getName();
	}
	
	public static <T> Method getFieldMethod(T t, String methodName) {
		Method method = null;
		try {
			Class<T> clazz = (Class<T>) t.getClass();
			method = clazz.getMethod(methodName);
		} catch (NoSuchMethodException | SecurityException e) {
			e.printStackTrace();
		}
		return method;
	}
	
	public static <T> T returnEntity(Class<?> t, String... str) {
		T clazz = null;
		try {
			clazz = (T) t.getClass().newInstance();
		} catch (InstantiationException | IllegalAccessException e1) {
			e1.printStackTrace();
		}
		Field field[] = getField(clazz);
		int i = 0;
		for (Field f : field) {
			String name = getFieldName(f);
			name = name.substring(0, 1).toUpperCase() + name.substring(1);
			String type = getFieldType(f);
			
			try {
				if("int".equals(type)) {
					Integer value = (Integer) getFieldMethod(clazz, "get" + name).invoke(clazz);
					if (value == null) {
                        Method m = clazz.getClass().getMethod("set" + name, Integer.class);
                        m.invoke(clazz, Integer.parseInt(str[i]));
                    }
				}
				if("String".equals(type)) {
					String value = (String) getFieldMethod(clazz, "get" + name).invoke(clazz);
					if (value == null) {
                        Method m = clazz.getClass().getMethod("set" + name, String.class);
                        m.invoke(clazz, str[i]);
                    }
				}
				if("long".equals(type)) {
					long value = (Long) getFieldMethod(t.getClass(), "get" + name).invoke(clazz);
					if (value > 0) {
                        Method m = clazz.getClass().getMethod("set" + name, Long.class);
                        m.invoke(clazz, Long.parseLong((str[i])));
                    }
				}
			} catch (IllegalAccessException | IllegalArgumentException
					| InvocationTargetException | NoSuchMethodException | SecurityException e) {
				e.printStackTrace();
			}
			i++;
		}
		return (T) clazz;
	}
}
