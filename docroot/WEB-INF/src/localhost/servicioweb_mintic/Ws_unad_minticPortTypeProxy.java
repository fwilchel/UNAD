package localhost.servicioweb_mintic;

public class Ws_unad_minticPortTypeProxy implements localhost.servicioweb_mintic.Ws_unad_minticPortType {
  private String _endpoint = null;
  private localhost.servicioweb_mintic.Ws_unad_minticPortType ws_unad_minticPortType = null;
  
  public Ws_unad_minticPortTypeProxy() {
    _initWs_unad_minticPortTypeProxy();
  }
  
  public Ws_unad_minticPortTypeProxy(String endpoint) {
    _endpoint = endpoint;
    _initWs_unad_minticPortTypeProxy();
  }
  
  private void _initWs_unad_minticPortTypeProxy() {
    try {
      ws_unad_minticPortType = (new localhost.servicioweb_mintic.Ws_unad_minticLocator()).getws_unad_minticPort();
      if (ws_unad_minticPortType != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)ws_unad_minticPortType)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)ws_unad_minticPortType)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (ws_unad_minticPortType != null)
      ((javax.xml.rpc.Stub)ws_unad_minticPortType)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public localhost.servicioweb_mintic.Ws_unad_minticPortType getWs_unad_minticPortType() {
    if (ws_unad_minticPortType == null)
      _initWs_unad_minticPortTypeProxy();
    return ws_unad_minticPortType;
  }
  
  public java.lang.String getXML(java.lang.String id, java.lang.String cpar) throws java.rmi.RemoteException{
    if (ws_unad_minticPortType == null)
      _initWs_unad_minticPortTypeProxy();
    return ws_unad_minticPortType.getXML(id, cpar);
  }
  
  
}