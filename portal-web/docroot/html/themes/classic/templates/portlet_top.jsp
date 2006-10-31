<%
/**
 * Copyright (c) 2000-2006 Liferay, LLC. All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
%>

<%@ include file="init.jsp" %>

<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
	<td class="portlet-shadow-tl"><div></div></td>
	<td class="portlet-shadow-tc" width="100%"></td>
	<td class="portlet-shadow-tr"><div></div></td>
</tr>
<tr>
	<td class="portlet-shadow-ml">
	</td>
	<td width="100%">

<div class="portlet-container">
	<div class="portlet-header-bar" id="portlet-header-bar_<%= portletDisplay.getId() %>"
		<c:if test="<%= !portletDisplay.isShowBackIcon() %>">
			onmouseover="PortletHeaderBar.show(this.id)"
			onmouseout="PortletHeaderBar.hide(this.id)"
		</c:if>
		>

		<%
		String portletTitle = Validator.isNotNull(portletDisplay.getTitle()) ? portletDisplay.getTitle() : "    ";
		%>

		<div class="portlet-wrap-title">
			<span class="portlet-title" id="portlet-title-bar_<%= portletDisplay.getId() %>"><%= portletTitle %></span>
		</div>


		<div class="portlet-small-icon-bar" style="<%= portletDisplay.isShowBackIcon() ? "display: block" : "display: none" %>;">
			<c:choose>
				<c:when test="<%= portletDisplay.isShowBackIcon() %>">
					<liferay-portlet:icon-back />
				</c:when>
				<c:otherwise>
					<liferay-portlet:icon-configuration />

					<liferay-portlet:icon-edit />

					<liferay-portlet:icon-edit-guest />

					<liferay-portlet:icon-help />

					<liferay-portlet:icon-print />

					<liferay-portlet:icon-minimize />

					<liferay-portlet:icon-maximize />

					<liferay-portlet:icon-close />
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<c:if test="<%= themeDisplay.isSignedIn() %>">
		<script type="text/javascript">
		QuickEdit.create("portlet-title-bar_<%= portletDisplay.getId() %>", {
			dragId: "p_p_id_<%= portletDisplay.getId() %>_",
			onEdit:
				function(input, textWidth) {
					input.style.width = (textWidth) + "px";
					input.style.marginLeft = "5px";
				},
			onComplete:
				function(newTextObj, oldText) {
					var newText = newTextObj.innerHTML;
					if (oldText != newText) {
						var url = "<%= themeDisplay.getPathMain() %>/portlet_configuration/update_title?portletId=<%= portletDisplay.getId() %>&title=" + encodeURIComponent(newText);

						Ajax.request(url);
					}
				}
			});
		</script>
	</c:if>

	<div class="portlet-box">
		<div class="portlet-minimum-height">
			<div id="p_p_body_<%= portletDisplay.getId() %>" <%= (portletDisplay.isStateMin()) ? "style=\"display: none;\"" : "" %>>
    		    <div class="slide-maximize-reference">