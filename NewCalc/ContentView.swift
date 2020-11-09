//
//  ContentView.swift
//  NewCalc
//
//  Created by Sergio Ramos on 08.11.2020.
//

import SwiftUI

struct ContentView: View {
    
    @State private var firstNumber = 0
    @State private var secondNumber = 0
    @State private var operand = ""
    @State private var calculatorText = "0"
    @State private var isTypingNumber = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24.0) {
            Text("Calculator")
                .font(Font.custom("museo", size: 28))
                .frame(width: 140, height: 34, alignment: .leading)
            Text("\(calculatorText)")
                .font(Font.custom("digital", size: 40))
                .frame(minWidth: 0, idealWidth: 336, maxWidth: UIScreen.main.bounds.width, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 100, maxHeight: 100, alignment: .trailing)
                .background(LinearGradient(gradient: Gradient(colors: [Color(red: 0.792, green: 0.831, blue: 0.773, opacity: 1), Color(red: 0.698, green: 0.749, blue: 0.647, opacity: 1)]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(10.0)
            
            VStack(spacing : 16) {
                HStack(spacing : 16) {
                    Button(action: {
                        self.clear()
                    }) {
                        (Text("AC"))
                    }.buttonStyle(GradientBackgroundStyle())
                    
                    Button(action: {
                        self.operandTapped("+/-")
                    }) {
                        (Text("+/-"))
                    }.buttonStyle(GradientBackgroundStyle())
                    Button(action: {
                        self.operandTapped("%")
                    }) {
                        (Text("%"))
                    }.buttonStyle(GradientBackgroundStyle())
                    Button(action: {
                        self.operandTapped("/")
                    }) {
                        (Text("/"))
                    }.buttonStyle(RightButtonStyle())
                }

                HStack(spacing : 16) {
                    Button(action: {
                        self.digitTapped("7")
                    }) {
                        (Text("7"))
                    }.buttonStyle(GradientBackgroundStyle())
                    Button(action: {
                        self.digitTapped("8")
                    }) {
                        (Text("8"))
                    }.buttonStyle(GradientBackgroundStyle())
                    Button(action: {
                        self.digitTapped("9")
                    }) {
                        (Text("9"))
                    }.buttonStyle(GradientBackgroundStyle())
                        Button(action: {
                            self.operandTapped("X")
                        }) {
                            (Text("X"))
                        }.buttonStyle(RightButtonStyle())
                    }

                HStack(spacing : 16) {
                    Button(action: {
                        self.digitTapped("4")
                    }) {
                        (Text("4"))
                    }.buttonStyle(GradientBackgroundStyle())
                    Button(action: {
                        self.digitTapped("5")
                    }) {
                        (Text("5"))
                    }.buttonStyle(GradientBackgroundStyle())
                    Button(action: {
                        self.digitTapped("6")
                    }) {
                        (Text("6"))
                    }.buttonStyle(GradientBackgroundStyle())
                        Button(action: {
                            self.operandTapped("-")
                        }) {
                            (Text("-"))
                        }.buttonStyle(RightButtonStyle())
                    }
            
                HStack(spacing : 16) {
                    Button(action: {
                        self.digitTapped("1")
                    }) {
                        (Text("1"))
                    }.buttonStyle(GradientBackgroundStyle())
                    Button(action: {
                        self.digitTapped("2")
                    }) {
                        (Text("2"))
                    }.buttonStyle(GradientBackgroundStyle())
                    Button(action: {
                        self.digitTapped("3")
                    }) {
                        (Text("3"))
                    }.buttonStyle(GradientBackgroundStyle())
                    Button(action: {
                        self.operandTapped("+")
                    }) {
                        (Text("+"))
                    }.buttonStyle(RightButtonStyle())
                }

                HStack(spacing : 16) {
                    Button(action: {
                        self.digitTapped("0")
                    }) {
                        (Text("0")
                            .foregroundColor(Color(red: 0.227, green: 0.306, blue: 0.537))
                            .font(.custom("Montserrat", size: 29.0)))
                    }
                    .padding()
                    .frame(width: 176, height: 80, alignment: .center)
                    .background(Color(red: 241/255, green: 243/255, blue: 246/255, opacity: 1.0))
                    .cornerRadius(20.0)
                    .shadow(color: Color(red: 55/255, green: 84/255, blue: 170/255, opacity: 1), radius: 10, x: 5, y: 5)
                    .shadow(color: .white, radius: 10, x: -5, y: -5)
                    
                    Button(action: {
                        self.dota()
                    }) {
                        (Text(","))
                    }.buttonStyle(GradientBackgroundStyle())
                
                    Button(action: {
                        self.calculate()
                    }) {
                        (Text("="))
                    }.buttonStyle(RightButtonStyle())
                }
            }.frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width, minHeight: 0, maxHeight: UIScreen.main.bounds.height, alignment: .center)
            .padding(.all, 24)
        }
        .frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width, minHeight: 0, maxHeight: UIScreen.main.bounds.height, alignment: .topLeading)
        .padding()
        .background(Color(red: 241/255, green: 243/255, blue: 246/255, opacity: 1.0))
    }


    private func digitTapped(_ number: String) -> Void {
        if isTypingNumber {
            calculatorText += number
        } else {
            calculatorText = number
            isTypingNumber = true
        }
    }


    private func operandTapped(_ operand: String) {
        isTypingNumber = false
        firstNumber = Int(calculatorText)!
        self.operand = operand
    }


    private func calculate() {
        isTypingNumber = false
        var result  = 0
        secondNumber = Int(calculatorText)!

        if operand == "+" {
            result = firstNumber + secondNumber
        } else if operand == "-" {
            result = firstNumber - secondNumber
        } else if operand == "X" {
            result = firstNumber * secondNumber
        } else if operand == "/" {
            result = firstNumber / secondNumber
        }
        calculatorText = "\(result)"
    }
    
    private func clear() {
        firstNumber = 0
        secondNumber = 0
        isTypingNumber = false
        calculatorText = "0"
    }
    
    private func dota() {
    }
}

struct GradientBackgroundStyle: ButtonStyle {
 
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .frame(width: 80, height: 80, alignment: .center)
            .background(Color(red: 241/255, green: 243/255, blue: 246/255, opacity: 1.0))
            .cornerRadius(20.0)
            .shadow(color: Color(red: 55/255, green: 84/255, blue: 170/255, opacity: 1), radius: 10, x: 5, y: 5)
            .shadow(color: .white, radius: 10, x: -5, y: -5)
            .foregroundColor(Color(red: 0.227, green: 0.306, blue: 0.537))
            .font(.custom("Montserrat", size: 29.0))
    }
}

struct RightButtonStyle: ButtonStyle {
 
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .frame(width: 80, height: 80, alignment: .center)
            .background(Color(red: 0.227, green: 0.306, blue: 0.537))
            .cornerRadius(20.0)
            .shadow(color: Color(red: 55/255, green: 84/255, blue: 170/255, opacity: 1), radius: 10, x: 5, y: 5)
            .shadow(color: .white, radius: 10, x: -5, y: -5)
            .foregroundColor(.white)
            .font(.custom("Montserrat", size: 29.0))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 8 Plus")
    }
}
