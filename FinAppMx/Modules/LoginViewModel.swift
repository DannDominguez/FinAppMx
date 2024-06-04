//
//  RegistrerViewModel.swift
//  FinAppMx
//
//  Created by Daniela Ciciliano on 03/06/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var message: String = ""
    @Published var password = ""
    @Published var errorMessage = ""
    @Published var forgotPasswordEmail = ""
    @Published var forgotPasswordErrorMessage = ""
    @Published var isForgotPasswordSuccess = false
    @Published var name = ""
    @Published var isAuthenticated: Bool = false

    
    
    func register() {
        
    }
    
    
    
    
    
    
    
    
    
    
}
