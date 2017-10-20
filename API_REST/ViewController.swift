//
//  ViewController.swift
//  API_REST
//
//  Created by Raul Quispe on 10/20/17.
//  Copyright © 2017 QuimaDevelopers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let notificationName = Notification.Name("endDocumentStatus")
        NotificationCenter.default.addObserver(self, selector: #selector(self.endDocumentStatus), name: notificationName, object: nil)

        let beneficiarios = [Dictionary<String, Any>]()
        var bonoReconocimiento:Dictionary <String,Any> = Dictionary()
        bonoReconocimiento["tipo"] = "2"
        bonoReconocimiento["valorNominal"] = "0.0"

        var fondoObligatorio:Dictionary <String,Any> = Dictionary()
        fondoObligatorio["rentabilidad"] = "5.00"
        fondoObligatorio["tipo"] = "2"
        var fondoVoluntario:Dictionary <String,Any> = Dictionary()
        fondoVoluntario["rentabilidad"] = "5.00"
        fondoVoluntario["tipo"] = "2"

        var tasasInteresDict:Dictionary <String,Any> = Dictionary()
        tasasInteresDict["moneda"] = "S"
        tasasInteresDict["tipo"] = "AFP"
        tasasInteresDict["valor"] = "3.19"
        var tasasInteres = [Dictionary<String, Any>]()
        tasasInteres.append(tasasInteresDict)

        var params:Dictionary <String,Any> = Dictionary()
        params["modalidadPension"] = "RP"
        params["nombres"] = "ALLAN HLWHRTIV CHAVES"
        params["nroMensualidades"] = "12"
        params["nroRemuneraciones"] = "12"
        params["pctContribucionObl"] = "10"
        params["promedioRemuneraciones"] = "1584.01"
        params["remuneracionActual"] = "400.0"
        params["saldoAfecto"] = "0.0"
        params["saldoNoAfecto"] = "178.18"
        params["saldoVoluntario"] = "0.0"
        params["sexo"] = "M"
        params["contribucionMensual"] = "500"
        params["esquemaComision"] = "F"
        params["fechaNacimiento"] = "14/06/1982"
        params["modalidadPensionSubTipo"] = "MVC"
        params["numeroCuenta"] = "4787"
        params["regularidadAportes"] = "60"




        params["beneficiarios"] = beneficiarios
        params["bonoReconocimiento"] = bonoReconocimiento
        params["fondoObligatorio"] = fondoObligatorio
        params["fondoVoluntario"] = fondoVoluntario
        params["tasasInteres"] = tasasInteres

        var headers:Dictionary <String,String> = Dictionary()
        headers["Content-Type"] = "application/json"
        let jsonData = try? JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        print("\(String(describing: jsonData))")
        ApiConsume.sharedInstance.consumeDataWithNewSession(url: "EstimadorREST/estimadorPension/service/v1.3", path: Constants.API_URL, headers: headers, params: params , typeParams: TypeParam.jsonBody, httpMethod: HTTP_METHOD.POST, notificationName: "endDocumentStatus")


    }
    func endDocumentStatus(notification:Notification){
        NotificationCenter.default.removeObserver(self, name: notification.name, object: nil)
        DispatchQueue.main.async(execute: {

        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
{"beneficiarios":[],"bonoReconocimiento":{"tipo":"92","valorNominal":"0.0"},"esquemaComision":"F","fechaNacimiento":"14/06/1982","fondoObligatorio":{"rentabilidad":"5.00","tipo":"2"},"fondoVoluntario":{"rentabilidad":"5.00","tipo":"2"},"modalidadPension":"RP","nombres":"ALLAN  HLWHRTIV CHAVES","nroMensualidades":"12","nroRemuneraciones":"12","pctContribucionObl":"10.0","promedioRemuneraciones":"1584.01","regularidadAportes":"60","remuneracionActual":"400.0","saldoAfecto":"0.0","saldoNoAfecto":"178.18","saldoVoluntario":"0.0","sexo":"M","tasasInteres":[{"moneda":"S","tipo":"AFP","valor":"3.19"}]}
    */

}

