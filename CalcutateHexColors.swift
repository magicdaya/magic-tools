//
//  CalculateHexColors.swift
//  
//  created by magicday.a . barbara stegh 2019
//  copyright © magicday.a . all rights reserved.
//


struct CalculateHexColors {

    // returns the hex code of a color as a string    
    static func calculateHexColors(brushSize: CGFloat, red: CGFloat, green: CGFloat, blue: CGFloat) -> String {

        SaveValues.saveValues(brushSize: brushSize, red: red, green: green, blue: blue)

        let red = Int(red * 255)
        let green = Int(green * 255)
        let blue = Int(blue * 255)
        
        let binaryColors = CalculateHexColors.calculateBinaryCode(red: red, green: green, blue: blue)
        var hexColor = ""
        
        var actualHexNumber = ""
        
        for j in 0...2 {
            for i in 0...1 {
                let actualBinaryCode = binaryColors[i][j]
                
                switch actualBinaryCode {
                    case "0000":
                        actualHexNumber = "0"
                    case "0001":
                        actualHexNumber = "1"
                    case "0010":
                        actualHexNumber = "2"
                    case "0011":
                        actualHexNumber = "3"
                    case "0100":
                        actualHexNumber = "4"
                    case "0101":
                        actualHexNumber = "5"
                    case "0110":
                        actualHexNumber = "6"
                    case "0111":
                        actualHexNumber = "7"
                    case "1000":
                        actualHexNumber = "8"
                    case "1001":
                        actualHexNumber = "9"
                    case "1010":
                        actualHexNumber = "A"
                    case "1011":
                        actualHexNumber = "B"
                    case "1100":
                        actualHexNumber = "C"
                    case "1101":
                        actualHexNumber = "D"
                    case "1110":
                        actualHexNumber = "E"
                    case "1111":
                        actualHexNumber = "F"
                    default:
                        actualHexNumber = ""
                }
                
                hexColor.append(actualHexNumber)
            }
        }
        
        return hexColor
    }
    
    static func calculateBinaryCode(red: Int, green: Int, blue: Int) -> [[String]] {

        var colors = [red, green, blue]

        var binaryColors1 = ["", "", ""]
        var binaryColors2 = ["", "", ""]
        
        for i in 0..<binaryColors1.count {
            while colors[i] > 0 {
                let oldValue = colors[i]
                colors[i] = Int(colors[i] / 2)
                
                if binaryColors2[i].count < 4 {
                    if colors[i] * 2 != oldValue {
                        binaryColors2[i].insert("1", at: binaryColors2[i].startIndex)
                        
                    } else {
                        binaryColors2[i].insert("0", at: binaryColors2[i].startIndex)
                    }
                    
                } else {
                    if colors[i] * 2 != oldValue {
                        binaryColors1[i].insert("1", at: binaryColors1[i].startIndex)
                        
                    } else {
                        binaryColors1[i].insert("0", at: binaryColors1[i].startIndex)
                    }
                }
            }
                    
            if binaryColors1[i].count < 4 {
                while binaryColors1[i].count < 4 {
                    binaryColors1[i].insert("0", at: binaryColors1[i].startIndex)
                }
            }
        
            if binaryColors2[i].count < 4 {
                while binaryColors2[i].count < 4 {
                    binaryColors2[i].insert("0", at: binaryColors2[i].startIndex)
                }
            }
        }
        
        let binaryColors = [binaryColors1, binaryColors2]
        
        return binaryColors
    }
}