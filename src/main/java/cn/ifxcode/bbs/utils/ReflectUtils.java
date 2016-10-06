package cn.ifxcode.bbs.utils;

import java.beans.IntrospectionException;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public class ReflectUtils {

	public static <T> Field[] getField(Class<T> clazz) {
		Field fields[] = clazz.getDeclaredFields();
		return fields;
	}
	
	public static String getFieldType(Field field) {
		return field.getGenericType().toString();
	}
	
	public static String getFieldName(Field field) {
		return field.getName();
	}
	
	public static <T> Method getFieldMethod(Class<T> clazz, String methodName) {
		Method method = null;
		try {
			method = clazz.getMethod(methodName);
		} catch (NoSuchMethodException | SecurityException e) {
			e.printStackTrace();
		}
		return method;
	}
	
	public static <T> T returnEntity(Class<T> clazz, String... str) {
		T t = null;
		try {
			t = clazz.newInstance();
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
				if("int".equals(type) || "class java.lang.Integer".equals(type)) {
					Integer value = (Integer) getFieldMethod(clazz, "get" + name).invoke(t);
					if (value == null) {
						PropertyDescriptor descriptor = new PropertyDescriptor(name, clazz);
                        Method m = descriptor.getWriteMethod();
                        m.invoke(t, new Object[]{Integer.parseInt(str[i])});
                    }
				}
				if("class java.lang.String".equals(type)) {
					String value = (String) getFieldMethod(clazz, "get" + name).invoke(t);
					if (value == null) {
						PropertyDescriptor descriptor = new PropertyDescriptor(name, clazz);
                        Method m = descriptor.getWriteMethod();
                        m.invoke(t, new Object[]{str[i]});
                    }
				}
				if("long".equals(type)) {
					long value = (Long) getFieldMethod(clazz, "get" + name).invoke(t);
					if (value == 0) {
						PropertyDescriptor descriptor = new PropertyDescriptor(name, clazz);
                        Method m = descriptor.getWriteMethod();
                        m.invoke(t, new Object[]{Long.parseLong((str[i]))});
                    }
				}
			} catch (IllegalAccessException | IllegalArgumentException
					| InvocationTargetException | SecurityException e) {
				e.printStackTrace();
			} catch (IntrospectionException e) {
				e.printStackTrace();
			}
			i++;
		}
		return t;
	}
}
