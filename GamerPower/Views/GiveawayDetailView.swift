//
//  GiveawayDetailView.swift
//  GamerPower
//
//  Created by Hussein Kishk on 06/06/2024.
//

import SwiftUI

struct GiveawayDetailView: View {
    @Binding var giveaway: Giveaway?
    @Environment(\.dismiss) var dismiss

    var body: some View {
        if let giveaway = giveaway {
            ScrollView {
                VStack() {
                    ZStack(alignment: .bottomLeading) {
                        if let url = URL(string: giveaway.image) {
                            AsyncImage(url: url)
                                .frame(height: 350)
                                .aspectRatio(contentMode: .fill)
                                .clipped()
                                .overlay(
                                    Rectangle()
                                        .fill(Color.black.opacity(0.6))
                                )
                        }
                        
                        VStack {
                            HStack {
                                Button(action: {
                                    dismiss()
                                }) {
                                    ZStack {
                                        Circle()
                                            .fill(Color.white)
                                            .frame(width: 32, height: 32)
                                        Image(systemName: "chevron.left")
                                            .foregroundColor(.black)
                                    }
                                    .padding()
                                }
                                .accessibility(identifier: "GiveawayDetailBackButton")
                                
                                Spacer()
                                Button(action: {
                                    self.giveaway?.liked.toggle()
                                }) {
                                    Image(systemName: giveaway.liked ? "heart.fill" : "heart")
                                        .font(.system(size: 24))
                                        .foregroundColor(.white)
                                        .padding()
                                        .accessibility(identifier: "GiveawayDetailLikeButton")
                                }
                            }.padding(.horizontal)
                                .padding(.top, UIHelpers.getStatusBarHeight())
                            
                            Spacer()
                            
                            HStack {
                                Text(giveaway.title)
                                    .font(.system(size: 24, weight: .bold))
                                    .foregroundColor(.white)
                                    .padding(.bottom, 16)
                                    .padding(.horizontal)
                                    .accessibility(identifier: "GiveawayDetailTitle")
                                
                                Spacer()
                                
                                Button(action: {
                                    // Action for Get it button
                                }) {
                                    Text("Get it")
                                        .font(.system(size: 16, weight: .bold))
                                        .padding(.vertical, 8)
                                        .padding(.horizontal, 16)
                                        .background(.white)
                                        .foregroundColor(.black)
                                        .cornerRadius(12)
                                        .accessibility(identifier: "GiveawayDetailGetItButton")
                                }
                                .padding(.top, 16)
                                .padding(.trailing, 16)
                            }
                        }
                    }

                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Spacer()
                            VStack {
                                Image(systemName: "dollarsign.circle.fill")
                                    .font(.system(size: 30))
                                    .padding(.bottom, 8)
                                Text(giveaway.worth ?? "N/A")
                                    .fontWeight(.medium)
                            }
                            Spacer()
                            Divider()
                            Spacer()
                            VStack {
                                Image(systemName: "person.2.fill")
                                    .font(.system(size: 30))
                                    .padding(.bottom, 8)
                                Text("\(giveaway.users ?? 0)")
                                    .fontWeight(.medium)
                            }
                            Spacer()
                            Divider()
                            Spacer()
                            VStack {
                                Image(systemName: "gamecontroller.fill")
                                    .font(.system(size: 30))
                                    .padding(.bottom, 8)
                                Text(giveaway.type)
                                    .fontWeight(.medium)
                            }
                            Spacer()
                        }
                        .padding(.top)
                        
                        VStack(spacing: 8) {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Platforms")
                                    .font(.headline)
                                
                                Text(giveaway.platforms)
                                    .font(.subheadline)
                            }
                            Spacer()
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Giveaway End Date")
                                    .font(.headline)
                                
                                Text(giveaway.endDateFormatted ?? "N/A")
                                    .font(.subheadline)
                            }
                        }
                        .padding(.horizontal)
                        
                        // Description
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Description")
                                .font(.headline)
                            
                            Text(giveaway.description)
                                .font(.subheadline)
                                .padding(.bottom, 16)
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .ignoresSafeArea(edges: .top)
            .navigationBarBackButtonHidden()
        }
    }
}

