//
//  LoginView.swift
//  uberSwiftUITutorial
//
//  Created by ioannis on 14/5/23.
//

import SwiftUI

struct LoginView: View {
    
    @State var email:String  = ""
    @State var password:String = ""
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack {
                //Image and title
                VStack{
                    Image("uber")
                        .resizable()
                        .frame(width:200,height:200)
                    
                }
                //input fields
                VStack(spacing:32){
                    //input field 1
                    VStack(alignment: .leading,spacing: 12) {
                        //title
                        Text("Email Address")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .font(.footnote)
                        
                        //TextField
                        TextField("name@example.com", text: $email)
                            .foregroundColor(.white)
                        //divider
                        Rectangle()
                            .foregroundColor(Color(.init(white: 1, alpha: 0.3)))
                            .frame(width: UIScreen.main.bounds.width - 32,height: 0.7)
                        
                    }
                    // input field 2
                    VStack(alignment: .leading,spacing: 12) {
                        //title
                        Text("Password")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .font(.footnote)
                        
                        //TextField
                        SecureField("Enter your password", text: $password)
                            .foregroundColor(.white)
                        //divider
                        Rectangle()
                            .foregroundColor(Color(.init(white: 1, alpha: 0.3)))
                            .frame(width: UIScreen.main.bounds.width - 32,height: 0.7)
                        
                    }
                    Button {
                        
                    } label: {
                        Text("Forgot Password?")
                            .font(.system(size: 13,weight: .semibold))
                            .foregroundColor(.white)
                            .padding(.top)
                    }
                    .frame(maxWidth: .infinity,alignment: .trailing)
                }
                .padding(.horizontal)
                .padding(.top,12)
                
                //social sign in view
                VStack{
                    //dividers + text
                    HStack(spacing:24){
                        Rectangle()
                            .frame(width: 76,height: 1)
                            .foregroundColor(.white)
                            .opacity(0.5)
                        Text("Sign in with social")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                        Rectangle()
                            .frame(width: 76,height: 1)
                            .foregroundColor(.white)
                            .opacity(0.5)
                    }
                    
                    HStack(spacing: 24){
                        Button {
                            
                        } label: {
                            Image("facebookicon")
                                .resizable()
                                .frame(width: 44,height: 44)
                        }
                        
                        Button {
                            
                        } label: {
                            Image("googleicon")
                                .resizable()
                                .frame(width: 44,height: 44)
                        }

                    }
                }
                .padding(.vertical)
               
                 Spacer()
                //sign in button
                Button {
                    
                } label: {
                    HStack{
                        Text("SIGN IN")
                            .foregroundColor(.black)
                        
                        Image(systemName: "arrow.right")
                            .foregroundColor(.black)
                    }
                }
                .frame(width: UIScreen.main.bounds.width - 32,height: 50)
                .background(Color.white)
                .cornerRadius(10)
                

                //sign up button
                Spacer()
                Button {
                    
                } label: {
                    HStack {
                        Text("Don't haver an account?")
                            .font(.system(size: 14))
                        
                        Text("Sign Up")
                            .font((.system(size: 14,weight: .semibold)))
                    }
                    .foregroundColor(.white)
                    
                }

                
                
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
