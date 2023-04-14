//
//  ResultViewController.swift
//  LastName_EMICalculator
//
//  Created by Kuchi,Yudu Eswar Vinay Pratap Kumar on 4/13/23.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet weak var loanTypeOL: UILabel!
    
    
    
    @IBOutlet weak var monthlyEMIOL: UILabel!
    
    
    @IBOutlet weak var totalInterestOL: UILabel!
    
    
    
    
    @IBOutlet weak var processingFeesOL: UILabel!
    
    
    @IBOutlet weak var totalAmountOL: UILabel!
    
    
    
    @IBOutlet weak var resultImageOL: UIImageView!
    
    var typeOfLoan = ""
    
    var monthlyEMI = ""
    
    var totalInterestAmount = ""
    
    var processingFees = ""
    
    var totalAmount = ""
    
    var imageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        loanTypeOL.text! += "\t\t\t:\t \(typeOfLoan.capitalized)"
        monthlyEMIOL.text! += "\t\t:\t $\(monthlyEMI)"
        totalInterestOL.text! += "\t\t:\t $\(totalInterestAmount)"
        processingFeesOL.text! += "\t:\t $\(processingFees)"
        totalAmountOL.text! += "\t\t:\t $\(totalAmount)"
        
        resultImageOL.image = UIImage(named: imageName)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
