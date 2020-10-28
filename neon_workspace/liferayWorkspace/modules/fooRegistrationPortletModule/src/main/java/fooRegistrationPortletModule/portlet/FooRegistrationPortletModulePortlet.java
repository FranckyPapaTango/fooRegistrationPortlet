package fooRegistrationPortletModule.portlet;

import com.liferay.counter.kernel.service.CounterLocalServiceUtil;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;

import java.io.IOException;
import java.text.DateFormat;
import java.text.FieldPosition;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.Portlet;
import javax.portlet.PortletException;
import javax.portlet.ProcessAction;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.osgi.service.component.annotations.Component;


import com.liferay.portal.kernel.util.ParamUtil;

import fooSb.model.Foo;
import fooSb.service.FooLocalServiceUtil;
/**
 * @author Rafaros
 */
@Component(
	immediate = true,
	property = {
		"com.liferay.portlet.display-category=category.sample",
		"com.liferay.portlet.instanceable=true",
		"javax.portlet.display-name=fooRegistrationPortletModule Portlet",
		"javax.portlet.init-param.template-path=/",
		"javax.portlet.init-param.view-template=/view.jsp",
		"javax.portlet.resource-bundle=content.Language",
		"javax.portlet.security-role-ref=power-user,user"
	},
	service = Portlet.class
)
public class FooRegistrationPortletModulePortlet extends MVCPortlet {
	private static final Log log=LogFactoryUtil.getLog(FooRegistrationPortletModulePortlet.class);
	DateFormat df = new SimpleDateFormat ("dd/MM/yyyy"); 
	
	@Override
	 public void render(RenderRequest renderRequest, RenderResponse renderResponse)
	   throws IOException, PortletException {
	  // TODO Auto-generated method stub
	  super.render(renderRequest, renderResponse);
	 }
	 
//	 @ProcessAction(name="addFoo")
//	 public void addFoo(ActionRequest actionRequest, ActionResponse actionResponse)
//	   throws IOException, PortletException {

//		 
//	  Boolean isSingle=ParamUtil.getBoolean(actionRequest, "isSingle");
//	  String town=ParamUtil.getString(actionRequest, "town");
//	  int age=ParamUtil.getInteger(actionRequest, "age");
//	  Date birthDay=ParamUtil.getDate(actionRequest, "birthDay", df);
//	  String firstandLastName=ParamUtil.getString(actionRequest, "firstandLastName");
//	 
//	  FooLocalServiceUtil.saveFoo(isSingle, town, age, birthDay, firstandLastName);
//	  
//	 }
	 
	 
	 
	 
	 
	 public void addFoo(ActionRequest actionRequest, 
			 ActionResponse actionResponse) 
			  throws SystemException, PortalException 
			  {
			    long fooId=CounterLocalServiceUtil.increment();
			    Foo foo=null;
			    foo=FooLocalServiceUtil.createFoo(fooId);
			    
			    foo.setIsSingle(ParamUtil.getBoolean(actionRequest, "isSingle"));
			    foo.setTown(ParamUtil.getString(actionRequest, "town"));
			    foo.setAge(ParamUtil.getInteger(actionRequest, "age"));
			    foo.setBirthDay(ParamUtil.getDate(actionRequest, "birthDay", df));
			    foo.setFirstandLastName(ParamUtil.getString(actionRequest, "firstandLastName"));
			    
			    FooLocalServiceUtil.addFoo(foo);
			  }
	 
			  public void deleteFoo(ActionRequest actionRequest, 
			 ActionResponse actionResponse)
			  throws SystemException, PortalException
			  {
			    FooLocalServiceUtil.deleteFoo(ParamUtil.getLong(actionRequest, 
			 "delFooId"));
			  }
			   
			  public void updateFoo(ActionRequest actionRequest, 
			 ActionResponse actionResponse)
			  throws SystemException, PortalException
			  {
			    Foo foo=FooLocalServiceUtil.fetchFoo(ParamUtil.getInteger(actionRequest, "fooId"));
			   
			    foo.setIsSingle(ParamUtil.getBoolean(actionRequest, "isSingle"));
			    foo.setTown(ParamUtil.getString(actionRequest, "town"));
			    foo.setAge(ParamUtil.getInteger(actionRequest, "age"));
			    foo.setBirthDay(ParamUtil.getDate(actionRequest, "birthDay", df));
			    foo.setFirstandLastName(ParamUtil.getString(actionRequest, "firstandLastName"));
			   
			    FooLocalServiceUtil.updateFoo(foo);
			  }
			 
}