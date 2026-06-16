////
////  DebugChallengeView.swift
////  Hig
////
//
//import SwiftUI
//import Nuvem
//
//struct DebugChallengeView: View {
//
//    @State private var challenges: [Challenge] = []
//    @State private var loading = true
//
//    var body: some View {
//        VStack(spacing: 20) {
//
//            if loading {
//                ProgressView("Buscando challenges no CloudKit...")
//            } else if challenges.isEmpty {
//                Text("Nenhum Challenge encontrado no CloudKit.")
//                    .foregroundStyle(.red)
//            } else {
//                ScrollView {
//                    VStack(spacing: 32) {
//                        ForEach(challenges.indices, id: \.self) { i in
//                            let c = challenges[i]
//
//                            VStack(alignment: .leading, spacing: 12) {
//
//                                // Identificação do record
//                                Text("Challenge \(i + 1)")
//                                    .font(.title.bold())
//
//                                Divider()
//
//                                // Campos de texto
//                                Group {
//                                    field("titleChallenge", value: c.titleChallenge)
//                                    field("titleChat", value: c.titleChat)
//                                    field("descriptionChallenge", value: c.descriptionChallenge)
//                                    field("correctSection", value: "\(c.correctSection)")
//                                    field("correctFeedback", value: c.correctFeedback)
//                                    field("wrongFeedback", value: c.wrongFeedback)
//                                    field("tappableAreas (área.values.count)", value: "\(c.area.values.count) área(s)")
//                                }
//
//                                Divider()
//
//                                // imageChallenge
//                                Text("imageChallenge:")
//                                    .font(.headline)
//
//                                Image(nsImage: c.imageChallenge)
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(maxHeight: 500)
////                                    .border(Color.gray, width: 1)
//
//                                Divider()
//
//                                // imageChat
//                                Text("imageChat (\(c.imageChat.count) imagem(ns)):")
//                                    .font(.headline)
//
//                                HStack(spacing: 16) {
//                                    ForEach(c.imageChat.indices, id: \.self) { j in
//                                        VStack {
//                                            Image(nsImage: c.imageChat[j])
//                                                .resizable()
//                                                .scaledToFit()
//                                                .frame(width: 120, height: 120)
//                                                .border(Color.blue, width: 1)
//                                            Text("índice \(j)")
//                                                .font(.caption)
//                                        }
//                                    }
//                                }
//                            }
//                            .padding()
//                            .background(Color.gray.opacity(0.1))
//                            .cornerRadius(12)
//                        }
//                    }
//                    .padding()
//                }
//            }
//        }
//        .task {
//            do {
//                challenges = try await Challenge.query(on: .default).all()
//                loading = false
//            } catch {
//                print("Erro ao buscar challenges: \(error)")
//                loading = false
//            }
//        }
//    }
//
//    private func field(_ label: String, value: String) -> some View {
//        HStack(alignment: .top) {
//            Text("\(label):")
//                .font(.caption.bold())
//                .foregroundStyle(.secondary)
//                .frame(width: 220, alignment: .leading)
//            Text(value.isEmpty ? "(vazio)" : value)
//                .font(.caption)
//                .foregroundStyle(value.isEmpty ? .red : .primary)
//        }
//    }
//}
//
//#Preview {
//    DebugChallengeView()
//        .frame(width: 700, height: 600)
//}
