package com.amatic.session.handle;

import org.springframework.beans.factory.xml.XmlBeanDefinitionReader;
import org.springframework.web.context.support.XmlWebApplicationContext;

import com.google.appengine.api.utils.SystemProperty;

public class CustomXmlWebApplicationContext extends XmlWebApplicationContext {
    @Override
    protected void initBeanDefinitionReader(
	    XmlBeanDefinitionReader beanDefinitionReader) {
	super.initBeanDefinitionReader(beanDefinitionReader);
	if (SystemProperty.environment.value() == SystemProperty.Environment.Value.Production) {
	    beanDefinitionReader
		    .setValidationMode(XmlBeanDefinitionReader.VALIDATION_NONE);
	    // beanDefinitionReader.setNamespaceAware(true);
	    // beanDefinitionReader.setValidating(false);
	}
    }
}
