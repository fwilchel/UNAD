<%@page import="java.util.*, com.ssl.unad.dto.*"%>
<%
	/**
	 * Copyright (c) 2000-2013 Liferay, Inc. All rights reserved.
	 *
	 * The contents of this file are subject to the terms of the Liferay Enterprise
	 * Subscription License ("License"). You may not use this file except in
	 * compliance with the License. You can obtain a copy of the License by
	 * contacting Liferay, Inc. See the License for the specific language governing
	 * permissions and limitations under the License, including but not limited to
	 * distribution rights of the Software.
	 *
	 *
	 *
	 */
%>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui"%>
<%@ taglib prefix="liferay-ui" uri="http://liferay.com/tld/ui" %>
<portlet:defineObjects />

<portlet:actionURL name="consultar" var="consultaURL" />

<div align="center">
	
<aui:form action="<%= consultaURL.toString() %>" method="post" >


<liferay-ui:error key="1" message="Hay problemas con el servicio ofrecido por la institución, por favor comuníquese con la institución." />
<liferay-ui:error key="2" message="Credenciales de acceso Usuario y/o contraseña erradas." />
<liferay-ui:error key="3" message="La consulta no ha retornado resultados." />
<liferay-ui:error key="4" message="Error inesperado, por favor comuníquelo al administrador." />

<p></p>
<aui:fieldset>

<aui:input name="usuario" type="text" label="Usuario: *" inlineLabel="false" required="true" showRequiredLabel="false" ></aui:input>
<aui:input name="password" type="password" required="true" label="Contraseña: *" inlineLabel="false" showRequiredLabel="false" ></aui:input>
Usar el usuario y contraseña del Campus Virtual<p></p>
<aui:button value="Consultar" name="buscar" id="buscar" type="submit"></aui:button>
</aui:fieldset>

</aui:form>
<p></p>

<%
	Object obj = renderRequest.getAttribute("notas");
	if (obj != null) {
		InformacionNotasEstudiante o = (InformacionNotasEstudiante)obj; 
	
%>
<table border="1" width="80%">
	<tr class="centradoNegrita">
		<td colspan="2">Datos del Estudiante</td>
	</tr>
	<tr>
		<td class="derechaNegrita" width="50%">No. Estudiante:</td>
		<td class="izquierdaTitulo"><%=o.getEstudiante().getNumEstudiante()%>
		</td>
	</tr>
	<tr>
		<td class="derechaNegrita">Nombre Estudiante:</td>
		<td class="izquierdaTitulo"><%=o.getEstudiante().getPrimerNombre()%>
			<%=o.getEstudiante().getPrimerApellido()%> <%=o.getEstudiante().getSegundoApellido()%>
		</td>
	</tr>
	<tr>
		<td class="derechaNegrita">Programa:</td>
		<td class="izquierdaTitulo"><%=o.getEstudiante().getProgramaAcademico()%>
		</td>
	</tr>
	<tr>
		<td class="derechaNegrita">Centro:</td>
		<td class="izquierdaTitulo"><%=o.getEstudiante().getCentro()%></td>
	</tr>

</table>
<p></p>


<table border="1" width="80%">

	<%
		for (InformacionNotasEstudiante.Periodos.Periodo p : o
					.getPeriodos().getPeriodo()) {
	%>
	<tr>
		<td class="periodo" colspan="10">Período: <%=p.getNomPeriodo()%>
		</td>
	</tr>
	<tr class="titulos">
		<td>Reg.Académico</td>
		<td>Cod.Curso</td>
		<td>Curso Académico</td>
		<td>Créditos</td>
		<td>T.Curso</td>
		<td>Nota <%= (p.getCodPeriodo()<179 ? "60" : "75") %>%</td>
		<td>Nota <%= (p.getCodPeriodo()<179 ? "40" : "25") %>%</td>
		<td>Calif.Final 100%</td>
		<td>Fecha Grabación</td>
		<td>Observación</td>
	</tr>
	<%
		for (InformacionNotasEstudiante.Periodos.Periodo.Cursos.Curso c : p
						.getCursos().getCurso()) {
	%>

	<tr class="centrado">
		<td><%=c.getRegistroAcademico()%></td>
		<td><%=c.getCodCurso()%></td>
		<td class="izquierda"><%=c.getNomCurso()%></td>
		<td><%=c.getCreditos()%></td>
		<td><%=c.getTipoCurso()%></td>
		<td><%=p.getCodPeriodo()<179 ? c.getNota60():c.getNota75()%></td>
		<td><%=p.getCodPeriodo()<179 ? c.getNota40():c.getNota25()%></td>
		<td><%=c.getNota100()%></td>
		<td><%= (c.getFechaGrabacion()!=null && c.getFechaGrabacion().length()>=10?c.getFechaGrabacion().substring(0, 10):"") %></td>
		<td><%=c.getObservacionNotaCurso()%></td>
	</tr>

	<%
		}
	%>
	<tr class="periodo">
		<td colspan="7">Promedio <%=p.getNomPeriodo()%>
		</td>
		<td><%=p.getPromedioPeriodo()%></td>
		<td colspan="2"></td>
	</tr>
	<tr class="periodo">
		<td colspan="7">Total Créditos Aprobados en Período: <%=p.getNomPeriodo()%>
		</td>
		<td><%=p.getTotalCreditosAprobadosPeriodo()%></td>
		<td colspan="2"></td>
	</tr>
	<tr class="periodo">
		<td colspan="8">Beneficiario de Convenio: <%=p.getBeneficiarioConvenioPeriodo()%>
		</td>
		<td colspan="2"></td>
	</tr>
	<tr class="titulos">
		<td colspan="8">&nbsp;</td>
		<td colspan="2"></td>
	</tr>
	<%
		}
	%>
	<tr class="titulos">
		<td colspan="7">Promedio Histórico</td>
		<td><%=o.getPromedioHistorico()%></td>
		<td colspan="2"></td>
	</tr>
	<tr class="titulos">
		<td colspan="7">Total de Créditos Aprobados</td>
		<td><%=o.getTotalCreditoAprobados()%></td>
		<td colspan="2"></td>
	</tr>
	<tr class="advertencia">
		<td colspan="10">Este Reporte es solo informativo y NO es válido
			como certificado oficial de calificaciones</td>
	</tr>
</table>

<%
	} 
%>

</br>

<table width="960px" border="1" bordercolor="black" style="border: 1px solid black !important; border-collapse: inherit !important">
	<tr style="background-color: rgb(0,158,224); color:white; text-align:center; font-weight: bold" >
		<td>
			Estimado Estudiante Unadista
		</td>
	</tr>
	<tr>
		<td>


</br>
Te invitamos a consultar tu registro académico por medio del sitio <a href="http://www.sivirtual.gov.co">www.sivirtual.gov.co</a>, para acceder a este servicio debes ingresar los datos de acceso al Campus Virtual (Usuario y Contraseña).</br>
</br>
Este nuevo servicio surge de la Alianza Estratégica entre la Universidad Nacional Abierta y a Distancia (UNAD) y el Ministerio de las Tecnologías de la Información y Comunicaciones (MINTIC) para brindarte distintas alternativas de acceso a la información; debes tener en cuenta que al ingresar tus datos, estás autorizando a la UNAD y al MINTIC a visualizar tu registro académico. (Disposiciones legales enmarcadas en la Ley 1581 de 2012 y del Decreto 1377 de 2013)</br>
</br>
Puedes solucionar todas tus inquietudes a través del sitio web <a href="http://sau.unad.edu.co/">http://sau.unad.edu.co</a>.</br>
</br>
			
		</td>
	</tr>
</table>


</div>
