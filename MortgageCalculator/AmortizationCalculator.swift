//
//  AmortizationCalculator.swift
//  MortgageCalculator
//
//  Created by Isaac Pitblado on 2/24/22.
//

import Foundation

struct Payment {
    let pmt : Double
    let ipmt : Double
    let ppmt : Double
}

struct AmortizationCalculator {
    
    let periods : Int
    let pv : Double
    let paymentsPerPeriod : Int
    let rateYr : Double
    
    func calculateTotalNPayments() -> Int {
        let totalPayments = periods * paymentsPerPeriod
        print("totalPayments: \(totalPayments)")
        
        return totalPayments
    }
    
    func getMonthlyPayment() -> Double {
        var pmt = ExcelFormulas.myPmt(rate: calculateRatePerPayment(), nper: calculateTotalNPayments(), pv: pv)
        
        return pmt
    }
    
    func calculateRatePerPayment() -> Double {
        return rateYr / Double(paymentsPerPeriod)
    }
    
    func getMonthlyPaymentBreakdown() -> [Payment] {
        var x : [Payment] = []
        let totalPayments = calculateTotalNPayments()
        let fv = 0.0
        
        for i in 1...totalPayments {
            
//            x.append(Double(i))
            let ipmt = ExcelFormulas.myipmt(rate: rateYr / Double(paymentsPerPeriod), per: i, nPer: totalPayments, pv: pv, fv: fv)
            let ppmt = ExcelFormulas.myppmt(rate: rateYr / Double(paymentsPerPeriod), per: Double(i), nPer: totalPayments, pv: pv, fv: fv)
            let pmt = ExcelFormulas.myPmt(rate: rateYr / Double(paymentsPerPeriod), nper: paymentsPerPeriod * periods, pv: pv)
                                          
            let payment = Payment(pmt: pmt, ipmt: ipmt, ppmt: ppmt)
            
            x.append(payment)
            print(String(format: "%4d=%.2f", i, ipmt))
        }
        return x
    }
    
}
