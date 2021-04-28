//
//  ViewController.swift
//  ClimaApp
//
//  Created by marco rodriguez on 01/04/21.
//

import UIKit

class ClimaViewController: UIViewController, UITextFieldDelegate, ClimaManagerDelegado {

    var climaManager = ClimaManager()
    @IBOutlet weak var buscarTextField: UITextField!
    @IBOutlet weak var condicionClimaImageView: UIImageView!
    @IBOutlet weak var temperaturaLabel: UILabel!
    @IBOutlet weak var ciudadLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Establecer esta clase como delegado del ClimaManager
        climaManager.delegado = self
        
        buscarTextField.delegate = self
    }


    @IBAction func buscarButton(_ sender: UIButton) {
        //Para ocultar el teclado virtual
        buscarTextField.endEditing(true)
        //print(buscarTextField.text!)
        //ciudadLabel.text = buscarTextField.text
    }
    
    //MARK:Métodos del delegado
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Para ocultar el teclado virtual
        buscarTextField.endEditing(true)
        //print(buscarTextField.text!)
        //ciudadLabel.text = buscarTextField.text
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if buscarTextField.text != ""{
            return true
        }else{
            buscarTextField.placeholder = "Escribe algo.."
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //limpiar el textField
        climaManager.buscarClima(ciudad: buscarTextField.text!)
        buscarTextField.text = ""
        
    }
    
    func actualizarClima(clima: ClimaModelo){
        DispatchQueue.main.async {
            self.temperaturaLabel.text = clima.tempString
            self.ciudadLabel.text = clima.nombreCiudad
            self.condicionClimaImageView.image = UIImage(systemName: clima.condicionClima)
        }
    }
}
