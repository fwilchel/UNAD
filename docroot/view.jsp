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


<liferay-ui:error key="1" message="Hay problemas con el servicio ofrecido por la instituci�n, por favor comun�quese con la instituci�n." />
<liferay-ui:error key="2" message="Credenciales de acceso Usuario y/o contrase�a erradas." />
<liferay-ui:error key="3" message="La consulta no ha retornado resultados." />
<liferay-ui:error key="4" message="Error inesperado, por favor comun�quelo al administrador." />

<p></p>

<aui:fieldset>
<aui:input name="usuario" type="text" label="Usuario: *" inlineLabel="false" required="true" showRequiredLabel="false" ></aui:input>
<aui:input name="password" type="password" required="true" label="Contrase�a: *" inlineLabel="false" showRequiredLabel="false" ></aui:input>
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
		<td class="periodo" colspan="10">Per�odo: <%=p.getNomPeriodo()%>
		</td>
	</tr>
	<tr class="titulos">
		<td>Reg.Acad�mico</td>
		<td>Cod.Curso</td>
		<td>Curso Acad�mico</td>
		<td>Cr�ditos</td>
		<td>T.Curso</td>
		<td>Nota 60%</td>
		<td>Nota 40%</td>
		<td>Calif.Final 100%</td>
		<td>Fecha Grabaci�n</td>
		<td>Observaci�n</td>
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
		<td><%=c.getNota60()%></td>
		<td><%=c.getNota40()%></td>
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
		<td colspan="7">Total Cr�ditos Aprobados en Per�odo: <%=p.getNomPeriodo()%>
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
		<td colspan="7">Promedio Hist�rico</td>
		<td><%=o.getPromedioHistorico()%></td>
		<td colspan="2"></td>
	</tr>
	<tr class="titulos">
		<td colspan="7">Total de Cr�ditos Aprobados</td>
		<td><%=o.getTotalCreditoAprobados()%></td>
		<td colspan="2"></td>
	</tr>
	<tr class="advertencia">
		<td colspan="10">Este Reporte es solo informativo y NO es v�lido
			como certificado oficial de calificaciones</td>
	</tr>
</table>

<%
	} 
%>

</div>
