<%@ include file="../init.jsp"%>

<portlet:renderURL var="viewURL">
	<portlet:param name="mvcPath" value="/guestbookf/view.jsp"></portlet:param>
</portlet:renderURL>

<portlet:actionURL name="addEntry" var="addEntryURL" />


<%
	long entryId = ParamUtil.getLong(renderRequest, "entryId");

	GuestbookEntry entry = null;
	if (entryId > 0) {

		entry = GuestbookEntryLocalServiceUtil.getGuestbookEntry(entryId);
	}

	long guestbookId = ParamUtil.getLong(renderRequest, "guestbookId");
%>

<liferay-ui:header backURL="<%=viewURL.toString()%>"
	title="<%=entry == null ? "Add Entry" : entry.getName()%>" />


<aui:form action="<%=addEntryURL%>" name="<portlet:namespace />fm">

	<aui:model-context bean="<%=entry%>" model="<%=GuestbookEntry.class%>" />

	<aui:fieldset>

		<aui:input name="name" required="true" />
		<aui:input name="email"  required="true"/>
		<aui:input name="message" required="true"/>
		<aui:input name="entryId" type="hidden" />
		<aui:input name="guestbookId" type="hidden"
			value='<%=entry == null ? guestbookId : entry.getGuestbookId()%>' />

	</aui:fieldset>

	<aui:button-row>
		
		<liferay-asset:asset-categories-error />
		<liferay-asset:asset-tags-error />


			<aui:fieldset>
				<liferay-asset:asset-categories-selector
					className="<%=GuestbookEntry.class.getName()%>"
					classPK="<%=entryId%>" />
				<liferay-asset:asset-tags-selector
					className="<%=GuestbookEntry.class.getName()%>"
					classPK="<%=entryId%>" />
			</aui:fieldset>

		
			<aui:fieldset collapsed="<%=true%>" collapsible="<%=true%>"
				label="related-assets">

				<liferay-asset:input-asset-links
					className="<%=GuestbookEntry.class.getName()%>"
					classPK="<%=entryId%>" />

			</aui:fieldset >
			
			<aui:button type="submit"  cssClass="" ></aui:button>
			<aui:button type="cancel" onClick="<%=viewURL.toString()%>"></aui:button>


	</aui:button-row>
</aui:form>


