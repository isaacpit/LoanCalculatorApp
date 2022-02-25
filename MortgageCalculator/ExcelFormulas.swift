//
//  ExcelFormulas.swift
//  MortgageCalculator
//
//  Created by Isaac Pitblado on 2/21/22.
//

import Foundation

class ExcelFormulas {
    class func pmt(rate : Double, nper : Double, pv : Double, fv : Double = 0, type : Double = 0) -> Double {
        return ((-pv * self.pvif(rate: rate, nper: nper) - fv) / ((1.0 + rate * type) * self.fvifa(rate: rate, nper: nper)))
    }
    
    class func pow1pm1(x : Double, y : Double) -> Double {
        return (x <= -1) ? pow((1 + x), y) - 1 : exp(y * log(1.0 + x)) - 1
    }
    
    class func pow1p(x : Double, y : Double) -> Double {
        return (abs(x) > 0.5) ? pow((1 + x), y) : exp(y * log(1.0 + x))
    }
    
    class func pvif(rate : Double, nper : Double) -> Double {
        return self.pow1p(x: rate, y: nper)
    }
    
    class func fvifa(rate : Double, nper : Double) -> Double {
        return (rate == 0) ? nper : self.pow1pm1(x: rate, y: nper) / rate
    }

    class func myPmt(rate: Double, nper: Int, pv: Double) -> Double {
        return rate / (1 - pow((1 + rate), -Double(nper))) * -pv
    }
    
    class func myFv(rate: Double, nper: Int, pv: Double, c: Double) -> Double {
        
        let partOne = c * (pow(1 + rate, Double(nper)) - 1)
        return -partOne / rate +  pv * pow(1 + rate, Double(nper))
    }
    
    class func myipmt(rate: Double, per: Int, nPer: Int, pv: Double, fv: Double) -> Double{
        return myFv(rate:rate, nper: per - 1, pv: pv, c: -pmt(rate: rate, nper: Double(nPer), pv: pv)) * rate
    }
    
    class func myppmt(rate: Double, per: Double, nPer: Int, pv: Double, fv: Double) -> Double {
        return myPmt(rate: rate, nper: nPer, pv: pv) + myipmt(rate: rate, per: Int(per), nPer: nPer, pv: pv, fv: fv)
    }
}
