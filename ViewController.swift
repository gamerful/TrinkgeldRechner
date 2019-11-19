//
//  ViewController.swift
//  TrinkgeldRechner
//
//  Created by Björn-Christian Benouarets on 18.11.19.
//  Copyright © 2019 GamerfulDE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var eingabeBetrag: UITextField!
    @IBOutlet weak var prozentLabel: UILabel!
    @IBOutlet weak var prozentSlider: UISlider!
    @IBOutlet weak var trinkgeldBetrag: UILabel!
    @IBOutlet weak var gesamtBetrag: UILabel!
    
    var essensKosten = 0.0
    var trinkgeldProzent = 0.0
    var kostenTrinkgeld = 0.0
    var gesamtKosten = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prozentSlider.value = 0.0
        prozentLabel.text = "0%"
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @IBAction func prozentSliderAction(_ sender: UISlider) {
        ausrechnenDerKosten()
    }
    
    
    func ausrechnenDerKosten() {
        if eingabeBetrag.text != "" {
            essensKosten = Double(eingabeBetrag.text!)!
            trinkgeldProzent = Double(prozentSlider.value)
            
            kostenTrinkgeld = (essensKosten * trinkgeldProzent) / 100
            
            gesamtKosten = essensKosten + kostenTrinkgeld
            print("Trinkgeld: \(gesamtKosten)")
            
            printUIElements()
        }
        
    }
    
    func printUIElements() {
        let stringProzent = String(format: "%.0f", trinkgeldProzent)
        let stringTrinkgeld = String(format: "%.2f", kostenTrinkgeld)
        let stringGesamtbetrag = String(format: "%.2f", gesamtKosten)
        
        prozentLabel.text = stringProzent + "%"
        trinkgeldBetrag.text = "Trinkgeld: " + stringTrinkgeld + "€"
        gesamtBetrag.text = "Gesamtbetrag: " + stringGesamtbetrag + "€"
        
    }
    
    @IBAction func buttonProzent(_ sender: UIButton) {
        if sender.titleLabel?.text == "3%" {
            prozentSlider.value = 3.0
            prozentLabel.text = "3%"
            
            ausrechnenDerKosten()
        } else if sender.titleLabel?.text == "5%" {
            prozentSlider.value = 5.0
            prozentLabel.text = "5%"
            
            ausrechnenDerKosten()
        } else if sender.titleLabel?.text == "10%" {
            prozentSlider.value = 10.0
            prozentLabel.text = "10%"
            
            ausrechnenDerKosten()
        }
    }
    
    
}
