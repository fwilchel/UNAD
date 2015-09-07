package com.ssl.unad;

import com.liferay.portal.kernel.servlet.SessionErrors;
//import com.liferay.portal.kernel.servlet.SessionMessages;
import com.liferay.util.bridges.mvc.MVCPortlet;
import com.ssl.unad.dto.InformacionNotasEstudiante;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;









import javax.mail.internet.MimeUtility;
import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;
import javax.xml.rpc.ServiceException;

import localhost.servicioweb_mintic.Ws_unad_minticLocator;
import localhost.servicioweb_mintic.Ws_unad_minticPortType;


/**
 * Portlet implementation class UnadPortlet
 * XML to XSD online http://www.freeformatter.com/xsd-generator.html
 * G:\Basura>"c:\Archivos de programa\java\jdk1.7.0_75\bin\xjc.exe" -d src -p com.ssl.unad.dto Notas.xsd
 *  
 */
public class UnadPortlet extends MVCPortlet {
	
	//private InformacionNotasEstudiante notas;

	@Override
    public void doView(RenderRequest renderRequest, RenderResponse renderResponse) throws IOException, PortletException {
		
		//renderRequest.setAttribute("notas", notas);
		super.doView(renderRequest, renderResponse);
	}
	
	
	public void consultar(ActionRequest request, ActionResponse response) throws Exception{
		String usuario=request.getParameter("usuario");
		String password=request.getParameter("password");

		Ws_unad_minticLocator locator=new Ws_unad_minticLocator();
		Ws_unad_minticPortType port;
		try {
			port = locator.getws_unad_minticPort();
			String xmlEncoded=port.getXML(new String(encode(usuario.getBytes())), new String(encode(password.getBytes())));
			String xml= new String(decode(xmlEncoded.getBytes()));
			// <error>Credenciales de acceso Usuario y/o contrasena erradas</error>
			// <error>La consulta no ha retornado resultados.</error>

			
			if (xml.indexOf("<error>")!=-1){
				if (xml.indexOf("<error>Credenciales de acceso")!=-1){
					SessionErrors.add(request, "2");
				}else if (xml.indexOf("<error>La consulta no ha retornado")!=-1){
					SessionErrors.add(request, "3");
					//SessionMessages.add(request, "3");
				}else{
					xml=xml.substring(xml.indexOf("<error>")+7);
					if (xml.endsWith("</error>"))
						xml=xml.substring(0, xml.length()-8);
					SessionErrors.add(request, "4");
				}
				
			}else{
				JAXBContext jaxbContext = JAXBContext.newInstance(InformacionNotasEstudiante.class);
			 
				Unmarshaller jaxbUnmarshaller = jaxbContext.createUnmarshaller();
				InputStream is = new ByteArrayInputStream(xml.getBytes());
				InformacionNotasEstudiante notas = (InformacionNotasEstudiante) jaxbUnmarshaller.unmarshal(is);
				request.setAttribute("notas", notas);
			}
			
		} catch (ServiceException e) {
			SessionErrors.add(request, "1");
		} catch(Exception e){
			SessionErrors.add(request, "1");
		} 
		
	}
	
	  public static byte[] encode(byte[] b) throws Exception {
		    ByteArrayOutputStream baos = new ByteArrayOutputStream();
		    OutputStream b64os = MimeUtility.encode(baos, "base64");
		    b64os.write(b);
		    b64os.close();
		    return baos.toByteArray();
		  }

	  public static byte[] decode(byte[] b) throws Exception {
		    ByteArrayInputStream bais = new ByteArrayInputStream(b);
		    InputStream b64is = MimeUtility.decode(bais, "base64");
		    byte[] tmp = new byte[b.length];
		    int n = b64is.read(tmp);
		    byte[] res = new byte[n];
		    System.arraycopy(tmp, 0, res, 0, n);
		    return res;
		  }

}
