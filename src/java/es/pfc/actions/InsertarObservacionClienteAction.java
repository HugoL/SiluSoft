/*
 SiluSoft
    Copyright (C) 2012  Hugo Langa Roy

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package es.pfc.actions;

import es.pfc.forms.InsertarObservacionForm;
import es.pfc.model.Cliente;
import es.pfc.model.Observacion;
import es.pfc.negocio.ClientesBO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author ko
 */
public class InsertarObservacionClienteAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "correcto";
    private static final String FAILURE = "incorrecto";
    /**
     * This is the action called from the Struts framework.
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        InsertarObservacionForm ObservacionForm = (InsertarObservacionForm) form;
        Observacion observacion = new Observacion();
        Cliente cliente=new Cliente();
        HttpSession session = null;
        cliente=(Cliente)request.getAttribute("cliente");
    observacion.setIdCliente(ObservacionForm.getIdCliente());    
    observacion.setMotivo(ObservacionForm.getMotivo());
    observacion.setTratamientosAnteriores(ObservacionForm.getTratamientosAnteriores());
    observacion.setVariacionesPeso(ObservacionForm.getVariacionesPeso());
    observacion.setPesoMax(ObservacionForm.getPesoMax());
    observacion.setPesoMin(ObservacionForm.getPesoMin());
    observacion.setPesoIdeal(ObservacionForm.getPesoIdeal());
    observacion.setTallaActual(ObservacionForm.getTallaActual());
    observacion.setTallaDeseada(ObservacionForm.getTallaDeseada());
    observacion.setTensionMin(ObservacionForm.getTensionMin());
    observacion.setTensionMax(ObservacionForm.getTensionMax());
    observacion.setEnfermedades(ObservacionForm.getEnfermedades());
    observacion.setAlergias(ObservacionForm.getAlergias());
    observacion.setTerapias(ObservacionForm.getTerapias());
    observacion.setMenstruaciones(ObservacionForm.getMenstruaciones());
    observacion.setEmbarazos(ObservacionForm.getEmbarazos());
    observacion.setPartos(ObservacionForm.getPartos());
    observacion.setAbortos(ObservacionForm.getAbortos());
    observacion.setMetodoAnticonceptivo(ObservacionForm.getMetodoAnticonceptivo());
    observacion.setDiuresis(ObservacionForm.getDiuresis());
    observacion.setSuenyo(ObservacionForm.getSuenyo());
    observacion.setRitmoIntestinal(ObservacionForm.getRitmoIntestinal());
    observacion.setActividadFisica(ObservacionForm.getActividadFisica());
    observacion.setDigestiones(ObservacionForm.getDigestiones());
    observacion.setPesadezPiernas(ObservacionForm.getPesadezPiernas());
    observacion.setDolor(ObservacionForm.getDolor());
    observacion.setCalambres(ObservacionForm.getCalambres());
    observacion.setPiesFrios(ObservacionForm.getPiesFrios());
    observacion.setManosFrias(ObservacionForm.getManosFrias());
    System.out.println("InsertarObservacionClienteAction: "+observacion.getMotivo());
    if(ClientesBO.insertaObservacion(observacion)){
        System.out.println("InsertarObservacionClienteAction ha introducido la observacion");
        return mapping.findForward(SUCCESS);
    }
    System.out.println("No introducida la observacion dice el ACTION");
    return mapping.findForward(FAILURE);
    }
}
