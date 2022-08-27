//
//  CustomNavBarView.swift
//  SwiftuiCustomNavView
//
//  Created by liqinghua on 2022/8/27.
//

import SwiftUI

//自定义navigationBar
struct CustomNavBarView: View {
    //跳转返回
    @Environment(\.presentationMode) var presentationMode
    //返回控制
    let  showBackButton: Bool
    //标题
    let title: String
    //副标题
    let subtitle: String?
    var body: some View {
        HStack {
            if showBackButton {
                backButton
            }
            Spacer()
            titleSection
            Spacer()
            if showBackButton {
                backButton
                    .opacity(0)
            }
        }
        .padding()
        .accentColor(.white)
        .foregroundColor(.white)
        .font(.headline)
        .background(Color.blue.ignoresSafeArea(edges: .top))
    }
}

extension CustomNavBarView {
    private var backButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "chevron.left")
        }
    }
    
    private var titleSection: some View {
        VStack (spacing: 4) {
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
            if let subtitle = subtitle {
                Text(subtitle)
            }
        }
    }
}

struct CustomNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CustomNavBarView(showBackButton: true, title: "Title here", subtitle: "Subtitle goes here")
            Spacer()
        }
    }
}
