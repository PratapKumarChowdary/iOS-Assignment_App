//
//  ViewController.swift
//  LastName_EMICalculator
//
//  Created by Kuchi,Yudu Eswar Vinay Pratap Kumar on 4/13/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var loanTypeOutlet: UITextField!
    
    
    @IBOutlet weak var loanAmountOutlet: UITextField!
    
    
    @IBOutlet weak var interestRateOutlet: UITextField!
    
    
    @IBOutlet weak var termInYearsOutlet: UITextField!
    
    
    @IBOutlet weak var termInMonthsOutlet: UITextField!
    
    
    
    @IBOutlet weak var processingFeesOutlet: UITextField!
    
    
    @IBOutlet weak var calculateBtnOutlet: UIButton!
    
    @IBOutlet weak var resetBtnOutlet: UIButton!
    
    
    @IBOutlet weak var imageViewOutlet: UIImageView!
    
    var imagesArray = ["car","personal","home","bike"]
    
    var loanType = ""
    
    var monthlyEMIPayable = 0.00
    
    var totalInterestPayable = 0.00
    
    var processingFeesAmount = 0.00
    
    var totalPayment = 0.00
    
    var ResultImageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Disabling Calculate Button Initially
        calculateBtnOutlet.isEnabled = false
        // Default welcome image
        imageViewOutlet.image = UIImage(named: "welcome")
    }
    
    @IBAction func loanType(_ sender: UITextField) {
        
        // Calling function for enabling or disabling the calculate button
        checkFields()
    }
    
    
    @IBAction func loanAmount(_ sender: UITextField) {
        
        // Calling function for enabling or disabling the calculate button
        checkFields()
    }
    
    @IBAction func interestRate(_ sender: UITextField) {
        
        // Calling function for enabling or disabling the calculate button
        checkFields()
    }
    
    
    @IBAction func termInYears(_ sender: UITextField) {
        
        // Calling function for enabling or disabling the calculate button
        checkFields()
    }
    
    
    @IBAction func termInMonths(_ sender: UITextField) {
        
        // Calling function for enabling or disabling the calculate button
        checkFields()
    }
    
    @IBAction func processingFees(_ sender: UITextField) {
        
        // Calling function for enabling or disabling the calculate button
        checkFields()
    }
    
    
    @IBAction func calculateBtn(_ sender: UIButton) {
        calculateEMI()
    }
    
    @IBAction func resetBtn(_ sender: UIButton) {
        
        // For Reset Function, Just clear all the text fields by initalizing them with empty strings
        loanTypeOutlet.text = ""
        loanAmountOutlet.text = ""
        interestRateOutlet.text = ""
        termInYearsOutlet.text = ""
        termInMonthsOutlet.text = ""
        processingFeesOutlet.text = ""
        calculateBtnOutlet.isEnabled = false
        
    }
    
    // Function for checking whether all the input fields were entered by user, If not disbale the calculate button
    func checkFields(){
        if loanTypeOutlet.text == "" || loanAmountOutlet.text == "" || interestRateOutlet.text == "" || termInYearsOutlet.text == "" || termInMonthsOutlet.text == "" || processingFeesOutlet.text == ""{
            calculateBtnOutlet.isEnabled = false
        }else{
            calculateBtnOutlet.isEnabled = true
        }
    }
    
    
    func calculateEMI(){
        
        
        // Reading all input fields
        loanType = loanTypeOutlet.text!.lowercased()
        
        var loanAmount = Double(loanAmountOutlet.text!)!
        
        var interestRate = Double(interestRateOutlet.text!)!
        
        var termInYears = Double(termInYearsOutlet.text!)!
        
        var termInMonths = Double(termInMonthsOutlet.text!)!
        
        var processingFees = Double(processingFeesOutlet.text!)!
        
        var monthlyInterestRate = interestRate/1200
        
        print(monthlyInterestRate)
        let totalTerm = termInYears * 12 + termInMonths
        
        monthlyEMIPayable = loanAmount * (monthlyInterestRate * pow((1 + monthlyInterestRate), totalTerm)) / (pow((1+monthlyInterestRate), totalTerm) - 1)
        monthlyEMIPayable = round(monthlyEMIPayable * 100)/100
        totalInterestPayable = (monthlyEMIPayable * totalTerm) - loanAmount
        
        totalInterestPayable = round(totalInterestPayable*100)/100
        
        processingFeesAmount = (processingFees / 100) * loanAmount
        
        processingFeesAmount = round(processingFeesAmount*100)/100
        
        totalPayment = totalInterestPayable + loanAmount + processingFeesAmount
        
        totalPayment = round(totalPayment*100)/100
        
        // if let was used to unwrap the optional index value returned by firstIndex(of: ) method
        if let index = imagesArray.firstIndex(of: loanType){
            ResultImageName = imagesArray[index]
            
        }


    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var transition = segue.identifier
        if(transition == "resultSegue"){
            // Set the destination.
            
            var destination = segue.destination as! ResultViewController
            
            destination.typeOfLoan = loanType
            destination.monthlyEMI = String(monthlyEMIPayable)
            destination.totalInterestAmount = String(totalInterestPayable)
            destination.processingFees = String(processingFeesAmount)
            destination.totalAmount = String(totalPayment)
            destination.imageName = ResultImageName
            
            //Clearing thhe input fields in the HomeScreen
            loanTypeOutlet.text = ""
            loanAmountOutlet.text = ""
            interestRateOutlet.text = ""
            termInYearsOutlet.text = ""
            termInMonthsOutlet.text = ""
            processingFeesOutlet.text = ""
            calculateBtnOutlet.isEnabled = false
            
            // Global Varibales were cleared with existing values
             loanType = ""
            
             monthlyEMIPayable = 0.00
            
             totalInterestPayable = 0.00
            
             processingFeesAmount = 0.00
            
             totalPayment = 0.00
            
             ResultImageName = ""
            
            
            
        }
    }
}

