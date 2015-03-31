<%@ include file="template/localHeader.jsp"%>

<openmrs:require privilege="View VCT Home Page" otherwise="/login.htm" redirect="/module/vcttrac/vctHome.htm" />

	<div style="text-align: center;">
		
		<openmrs:hasPrivilege privilege="Manage VCT/PIT Clients registration">
			<div class="menuGroup"><spring:message code="vcttrac.home.titleHome"/></div>
			
			<div class="menuLinkGroup">
				<table>
					<tr>
						<td><a href="vctPreRegistrationCheckup.htm?type=vct"><div id="vct" class="menuLink menuLinkSelected" title="<spring:message code="vcttrac.home.vct"/>"><spring:message code="vcttrac.home.vctclient"/></div></a></td>	
						<td><a href="vctPreRegistrationCheckup.htm?type=pit"><div id="pit" class="menuLink <c:if test="${hasVctPrivs!=1}">menuLinkSelected</c:if>" title="<spring:message code="vcttrac.home.pit"/>"><spring:message code="vcttrac.home.pitclient"/></div></a></td>
					</tr>
				</table>
			</div>
		</openmrs:hasPrivilege>
		
		<openmrs:hasPrivilege privilege="Manage Counseling of VCT/PIT Clients">
			<div class="menuGroup"><spring:message code="vcttrac.home.counseling"/></div>
			
			<div class="menuLinkGroup">
				<a href="preCounseling.form"><div class="menuLink"><spring:message code="vcttrac.home.clientCounseling"/></div></a>
			</div>
		</openmrs:hasPrivilege>
		
		<openmrs:hasPrivilege privilege="Add VCT Client test result,Edit VCT Client test result,Manage Counseling of VCT/PIT Clients">
			<div class="menuGroup"><spring:message code="vcttrac.home.result"/></div>
			
			<div class="menuLinkGroup">
				<table>
					<tr>
						<openmrs:hasPrivilege privilege="Add VCT Client test result,Edit VCT Client test result">
							<td><a href="vctClientTest.list?page=1"><div class="menuLink"><spring:message code="vcttrac.home.test"/></div></a></td>
							<td><a href="vctClientResults.form"><div class="menuLink"><spring:message code="vcttrac.home.recording"/></div></a></td>
						</openmrs:hasPrivilege>
					</tr>
					<tr>
						<openmrs:hasPrivilege privilege="Manage Counseling of VCT/PIT Clients"><td colspan="2"><a href="vctResultReception.form"><div class="menuLink"><spring:message code="vcttrac.home.reception"/></div></a></td></openmrs:hasPrivilege>
					</tr>
				</table>
			</div>
		</openmrs:hasPrivilege>
		
		<openmrs:hasPrivilege privilege="Manage VCT Clients program enrollment">
			<div class="menuGroup"><spring:message code="vcttrac.home.program.enrollment"/></div>
			
			<div class="menuLinkGroup">
				<a href="hivProgramEnrollment.list?page=1"><div class="menuLink"><spring:message code="vcttrac.home.program.enroll"/></div></a>
			</div>
		</openmrs:hasPrivilege>
		
	</div>
	
<script>

	$(document).ready(function(){
		$("#vct").hover(function(){
			$("#vct").addClass("menuLinkSelected");
			$("#pit").removeClass("menuLinkSelected");
			$("#newLinks").html("<a href='vctRegistration.form?type=vct&select=new'><div class='menuLinkA'><spring:message code='vcttrac.home.newclient'/></div></a>");
			$("#selectLinks").html("<a href='vctRegistration.form?type=vct&select=choose'><div class='menuLinkA'><spring:message code='vcttrac.home.existingclient'/></div></a>");
		});

		$("#pit").hover(function(){
			$("#pit").addClass("menuLinkSelected");
			$("#vct").removeClass("menuLinkSelected");
			$("#newLinks").html("<a href='vctRegistration.form?type=pit&select=new'><div class='menuLinkA'><spring:message code='vcttrac.home.newclient'/></div></a>");
			$("#selectLinks").html("<a href='vctRegistration.form?type=pit&select=choose'><div class='menuLinkA'><spring:message code='vcttrac.home.existingclient'/></div></a>");
		});
	});
</script>

<%@ include file="/WEB-INF/template/footer.jsp"%>