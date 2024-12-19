//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Dylan on 05/12/2024.
//

import SwiftUI

struct AnimalDetailView: View {
    // MARK: - PROPERTIES
    let animal: Animal
    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(alignment: .center, spacing: 12.0) {
                //Hero Image
                Image(animal.image)
                    .resizable()
                    .scaledToFill()
                //Title
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8.0)
                    .foregroundStyle(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6.0)
                            .offset(y: 24.0)
                    )
                    .padding(.horizontal, 12.0)
                //Headline
                Text(animal.headline)
                    .frame(maxWidth: .infinity)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.accent)
                    .padding(.horizontal, 12.0)
                //Gallery
                Group {
                    AnimalDetailHeadingView(
                        headingImage:
                            "photo.on.rectangle.angled",
                        headingText: "Wilderness in Picture"
                    ).padding(.horizontal, 12.0)
                    AnimalGalleryScrollView(
                        gallery: animal.gallery
                    )
                }
                //Fact
                Group {
                    AnimalDetailHeadingView(
                        headingImage:
                            "questionmark.circle",
                        headingText: "Did you know?"
                    )
                    AnimalFactsTabView(
                        facts: animal.fact
                    )
                }.padding(.horizontal, 12.0)
                //Description
                Group {
                    AnimalDetailHeadingView(
                        headingImage:
                            "info.circle",
                        headingText: "All about \(animal.name)"
                    )
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                }.padding(.horizontal, 12.0)
                //Map
                Group {
                    AnimalDetailHeadingView(
                        headingImage:
                            "map",
                        headingText: "National Park"
                    )
                    AnimalMapView()
                }.padding(.horizontal, 12.0)
                //Link
                Group {
                    AnimalDetailHeadingView(
                        headingImage:
                            "books.vertical",
                        headingText: "Learn More"
                    )
                    AnimalExternalWebLinkView(
                        link: animal.link,
                        animalName: animal.name
                    ).padding(.bottom, 12.0)
                }.padding(.horizontal, 12.0)
            }
        }.navigationTitle("Learn about \(animal.name)")
            .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    NavigationView {
        AnimalDetailView(
            animal: animals.randomElement()!
        )
    }
}
