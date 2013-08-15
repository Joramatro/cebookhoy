package com.amatic.ch.dto;

import java.util.List;

import com.google.appengine.labs.repackaged.com.google.common.base.Function;
import com.google.appengine.labs.repackaged.com.google.common.collect.Lists;
import com.googlecode.objectify.Ref;

public class Deref {
    public static class Func<T> implements Function<Ref<T>, T> {
	public static Func<Object> INSTANCE = new Func<Object>();

	@Override
	public T apply(Ref<T> ref) {
	    return deref(ref);
	}
    }

    @SuppressWarnings({ "unchecked", "rawtypes" })
    public static <T> List<T> deref(List<Ref<T>> reflist) {
	return Lists.transform(reflist, (Func) Func.INSTANCE);
    }

    public static <T> T deref(Ref<T> ref) {
	return ref == null ? null : ref.get();
    }
}
