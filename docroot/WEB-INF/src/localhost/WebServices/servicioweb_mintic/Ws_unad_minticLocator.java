/**
 * Ws_unad_minticLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package localhost.WebServices.servicioweb_mintic;

public class Ws_unad_minticLocator extends org.apache.axis.client.Service implements localhost.WebServices.servicioweb_mintic.Ws_unad_mintic {

    public Ws_unad_minticLocator() {
    }


    public Ws_unad_minticLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public Ws_unad_minticLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for ws_unad_minticPort
    private java.lang.String ws_unad_minticPort_address = "http://190.66.14.210/Webservices/servicioweb_mintic/server_afiliado.php";

    public java.lang.String getws_unad_minticPortAddress() {
        return ws_unad_minticPort_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String ws_unad_minticPortWSDDServiceName = "ws_unad_minticPort";

    public java.lang.String getws_unad_minticPortWSDDServiceName() {
        return ws_unad_minticPortWSDDServiceName;
    }

    public void setws_unad_minticPortWSDDServiceName(java.lang.String name) {
        ws_unad_minticPortWSDDServiceName = name;
    }

    public localhost.WebServices.servicioweb_mintic.Ws_unad_minticPortType getws_unad_minticPort() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(ws_unad_minticPort_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getws_unad_minticPort(endpoint);
    }

    public localhost.WebServices.servicioweb_mintic.Ws_unad_minticPortType getws_unad_minticPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            localhost.WebServices.servicioweb_mintic.Ws_unad_minticBindingStub _stub = new localhost.WebServices.servicioweb_mintic.Ws_unad_minticBindingStub(portAddress, this);
            _stub.setPortName(getws_unad_minticPortWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setws_unad_minticPortEndpointAddress(java.lang.String address) {
        ws_unad_minticPort_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (localhost.WebServices.servicioweb_mintic.Ws_unad_minticPortType.class.isAssignableFrom(serviceEndpointInterface)) {
                localhost.WebServices.servicioweb_mintic.Ws_unad_minticBindingStub _stub = new localhost.WebServices.servicioweb_mintic.Ws_unad_minticBindingStub(new java.net.URL(ws_unad_minticPort_address), this);
                _stub.setPortName(getws_unad_minticPortWSDDServiceName());
                return _stub;
            }
        }
        catch (java.lang.Throwable t) {
            throw new javax.xml.rpc.ServiceException(t);
        }
        throw new javax.xml.rpc.ServiceException("There is no stub implementation for the interface:  " + (serviceEndpointInterface == null ? "null" : serviceEndpointInterface.getName()));
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(javax.xml.namespace.QName portName, Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        if (portName == null) {
            return getPort(serviceEndpointInterface);
        }
        java.lang.String inputPortName = portName.getLocalPart();
        if ("ws_unad_minticPort".equals(inputPortName)) {
            return getws_unad_minticPort();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://localhost/WebServices/servicioweb_mintic", "ws_unad_mintic");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://localhost/WebServices/servicioweb_mintic", "ws_unad_minticPort"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("ws_unad_minticPort".equals(portName)) {
            setws_unad_minticPortEndpointAddress(address);
        }
        else 
{ // Unknown Port Name
            throw new javax.xml.rpc.ServiceException(" Cannot set Endpoint Address for Unknown Port" + portName);
        }
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(javax.xml.namespace.QName portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        setEndpointAddress(portName.getLocalPart(), address);
    }

}
