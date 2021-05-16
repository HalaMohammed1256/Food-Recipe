//
//  LoginPresenter.swift
//  FoodRecipeTask
//
//  Created by Hala on 12/05/2021.
//

import Firebase


protocol LoginView: class{
    func startAnimating()
    func stopAnimating()
    func showDescriptionAlert(description: String)
}


protocol LoginViewPresenter{
    
    init(view: LoginView)
    func emailPasswordLogin(email: String?, password: String?, isFinishCompletion: @escaping ((Bool) -> Void))
    func resetPassword(email: String?, isFinishCompletion: @escaping ((Bool) -> Void))
    
}

class LoginPresenter: LoginViewPresenter{
    
    
    weak var view: LoginView?
    
    required init(view: LoginView) {
        self.view = view
    }
    
    
    func emailPasswordLogin(email: String?, password: String?, isFinishCompletion: @escaping ((Bool) -> Void)) {
        view?.startAnimating()
        isFinishCompletion(false)
 
        if let email = email, let password = password, email.isValidateEmail(), password.isValidatePassword(){
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                if let error = error{
                    self.view?.showDescriptionAlert(description: error.localizedDescription)
                }else{
                    self.view?.stopAnimating()
                    isFinishCompletion(true)
                }
                
            }
        }
    }
    

    func resetPassword(email: String?, isFinishCompletion: @escaping ((Bool) -> Void)){
        view?.startAnimating()
        isFinishCompletion(false)
        
        guard let email = email else{
            self.view?.showDescriptionAlert(description: "please, enter a valid email")
            return
        }
        
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if let error = error{
                self.view?.showDescriptionAlert(description: error.localizedDescription)
            }else{
                self.view?.stopAnimating()
                self.view?.showDescriptionAlert(description: "\nPlease check your inbox and follow all instructions to reset your password")
                isFinishCompletion(true)
            }
        }
    }
    
}
