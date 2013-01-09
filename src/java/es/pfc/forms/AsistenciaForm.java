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
package es.pfc.forms;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author ko
 */
public class AsistenciaForm extends org.apache.struts.action.ActionForm {
    
    private String maquina;
    private int idCliente;

    /**
     * @return
     */
    public String getMaquina() {
        return maquina;
    }

    /**
     * @param string
     */
    public void setMaquina(String maquina) {
        this.maquina=maquina;
    }

    /**
     * @return
     */
    public int getIdCliente() {
        return idCliente;
    }

    /**
     * @param i
     */
    public void setIdCliente(int idCliente) {
        this.idCliente=idCliente;
    }

    /**
     *
     */
    public AsistenciaForm() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * This is the action called from the Struts framework.
     * @param mapping The ActionMapping used to select this instance.
     * @param request The HTTP Request we are processing.
     * @return
     */
    @Override
    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
        ActionErrors errors = new ActionErrors();
        if (getIdCliente() == 0) {
            errors.add("idCliente", new ActionMessage("error.idCliente.required"));
            // TODO: add 'error.name.required' key to your resources
        }
        return errors;
    }
}
