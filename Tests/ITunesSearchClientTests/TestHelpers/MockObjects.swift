// FS iTunes Search Client
// Copyright (C) 2024  FREEDOM SPACE, LLC

//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU Affero General Public License as published
//  by the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU Affero General Public License for more details.
//
//  You should have received a copy of the GNU Affero General Public License
//  along with this program.  If not, see <https://www.gnu.org/licenses/>.

//
//  MockObjects.swift
//
//
//  Created by Mykhailo Bondarenko on 12.04.2024.
//

@testable import ITunesSearchClient

enum MockObjects {
    static let userRatingCountForCurrentVersion = 35335
    static let userRatingCount = 35335
    static let primaryGenreId = 6007
    static let trackId = 361285480
    static let artistId = 284417353
    static var keynoteResult: Components.Schemas.Result {
        let result = Components.Schemas.Result(
            screenshotUrls: [
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource122/v4/13/dd/63/13dd63cc-d748-958d-3df5-6849c2db635a/16ed0767-3fa2-4102-8ed3-9852a6845214_1.png/406x228bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource112/v4/7a/45/49/7a45499e-ab28-0072-4012-202ea3e38cfb/0d7a18b7-2c39-43e2-8f1c-52ca30587bd9_2.png/406x228bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource122/v4/3e/7c/5b/3e7c5b2c-cb74-961a-5780-d22e314afb7b/bae05244-2a3e-4be8-82c0-f1116d98b2b3_3.png/406x228bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource122/v4/d8/b4/8a/d8b48ae5-3faa-f975-dc3a-ef6e9528f8db/39a7841c-d1e9-495e-a214-8792ab7061d4_4.png/406x228bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource112/v4/73/99/e6/7399e600-8a80-b638-579a-d7ce969ecf69/6022ad7a-844e-4724-befc-366846fda3da_5.png/406x228bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource112/v4/55/69/14/5569146b-2770-9dfd-1177-9b548094c1f7/ab10da5d-de8f-4de0-84ed-b4caa9aabd46_6.png/406x228bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource112/v4/8f/d5/cc/8fd5cc01-591f-3682-392b-a5d53633945e/57e68da1-cb98-49eb-9ab5-ae31da5b98ff_7.png/406x228bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource112/v4/0e/8b/8d/0e8b8d40-3f7d-9c77-e91d-a6a70dd8b228/7c0f50ac-2243-4880-bc5a-bc5568d5794c_8.png/406x228bb.png",
                "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource112/v4/89/9e/c1/899ec12b-72a3-5ad0-cfe6-a09f2ed6c46b/63c6c1cf-7489-4072-bc5d-184802034310_9.png/406x228bb.png"
            ],
            ipadScreenshotUrls: [],
            appletvScreenshotUrls: [],
            artworkUrl60: "https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/ba/5c/f7/ba5cf72b-6f31-3c53-6dd1-f1596f7534b3/AppIcon-0-1x_U007emarketing-0-0-0-7-0-0-sRGB-0-0-0-85-220-0.png/60x60bb.jpg",
            artworkUrl512: "https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/ba/5c/f7/ba5cf72b-6f31-3c53-6dd1-f1596f7534b3/AppIcon-0-1x_U007emarketing-0-0-0-7-0-0-sRGB-0-0-0-85-220-0.png/512x512bb.jpg",
            artworkUrl100: "https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/ba/5c/f7/ba5cf72b-6f31-3c53-6dd1-f1596f7534b3/AppIcon-0-1x_U007emarketing-0-0-0-7-0-0-sRGB-0-0-0-85-220-0.png/100x100bb.jpg",
            artistViewUrl: "https://apps.apple.com/us/developer/apple/id284417353?mt=12&uo=4",
            supportedDevices: [
                "iPhone5s-iPhone5s",
                "iPadAir-iPadAir",
                "iPadAirCellular-iPadAirCellular",
                "iPadMiniRetina-iPadMiniRetina",
                "iPadMiniRetinaCellular-iPadMiniRetinaCellular",
                "iPhone6-iPhone6",
                "iPhone6Plus-iPhone6Plus",
                "iPadAir2-iPadAir2",
                "iPadAir2Cellular-iPadAir2Cellular",
                "iPadMini3-iPadMini3",
                "iPadMini3Cellular-iPadMini3Cellular",
                "iPodTouchSixthGen-iPodTouchSixthGen",
                "iPhone6s-iPhone6s",
                "iPhone6sPlus-iPhone6sPlus",
                "iPadMini4-iPadMini4",
                "iPadMini4Cellular-iPadMini4Cellular",
                "iPadPro-iPadPro",
                "iPadProCellular-iPadProCellular",
                "iPadPro97-iPadPro97",
                "iPadPro97Cellular-iPadPro97Cellular",
                "iPhoneSE-iPhoneSE",
                "iPhone7-iPhone7",
                "iPhone7Plus-iPhone7Plus",
                "iPad611-iPad611",
                "iPad612-iPad612",
                "iPad71-iPad71",
                "iPad72-iPad72",
                "iPad73-iPad73",
                "iPad74-iPad74",
                "iPhone8-iPhone8",
                "iPhone8Plus-iPhone8Plus",
                "iPhoneX-iPhoneX",
                "iPad75-iPad75",
                "iPad76-iPad76",
                "iPhoneXS-iPhoneXS",
                "iPhoneXSMax-iPhoneXSMax",
                "iPhoneXR-iPhoneXR",
                "iPad812-iPad812",
                "iPad834-iPad834",
                "iPad856-iPad856",
                "iPad878-iPad878",
                "Watch4-Watch4",
                "iPadMini5-iPadMini5",
                "iPadMini5Cellular-iPadMini5Cellular",
                "iPadAir3-iPadAir3",
                "iPadAir3Cellular-iPadAir3Cellular",
                "iPodTouchSeventhGen-iPodTouchSeventhGen",
                "iPhone11-iPhone11",
                "iPhone11Pro-iPhone11Pro",
                "iPadSeventhGen-iPadSeventhGen",
                "iPadSeventhGenCellular-iPadSeventhGenCellular",
                "iPhone11ProMax-iPhone11ProMax",
                "iPhoneSESecondGen-iPhoneSESecondGen",
                "iPadProSecondGen-iPadProSecondGen",
                "iPadProSecondGenCellular-iPadProSecondGenCellular",
                "iPadProFourthGen-iPadProFourthGen",
                "iPadProFourthGenCellular-iPadProFourthGenCellular",
                "iPhone12Mini-iPhone12Mini",
                "iPhone12-iPhone12",
                "iPhone12Pro-iPhone12Pro",
                "iPhone12ProMax-iPhone12ProMax",
                "iPadAir4-iPadAir4",
                "iPadAir4Cellular-iPadAir4Cellular",
                "iPadEighthGen-iPadEighthGen",
                "iPadEighthGenCellular-iPadEighthGenCellular",
                "iPadProThirdGen-iPadProThirdGen",
                "iPadProThirdGenCellular-iPadProThirdGenCellular",
                "iPadProFifthGen-iPadProFifthGen",
                "iPadProFifthGenCellular-iPadProFifthGenCellular",
                "iPhone13Pro-iPhone13Pro",
                "iPhone13ProMax-iPhone13ProMax",
                "iPhone13Mini-iPhone13Mini",
                "iPhone13-iPhone13",
                "iPadMiniSixthGen-iPadMiniSixthGen",
                "iPadMiniSixthGenCellular-iPadMiniSixthGenCellular",
                "iPadNinthGen-iPadNinthGen",
                "iPadNinthGenCellular-iPadNinthGenCellular",
                "iPhoneSEThirdGen-iPhoneSEThirdGen",
                "iPadAirFifthGen-iPadAirFifthGen",
                "iPadAirFifthGenCellular-iPadAirFifthGenCellular",
                "iPhone14-iPhone14",
                "iPhone14Plus-iPhone14Plus",
                "iPhone14Pro-iPhone14Pro",
                "iPhone14ProMax-iPhone14ProMax",
                "iPadTenthGen-iPadTenthGen",
                "iPadTenthGenCellular-iPadTenthGenCellular",
                "iPadPro11FourthGen-iPadPro11FourthGen",
                "iPadPro11FourthGenCellular-iPadPro11FourthGenCellular",
                "iPadProSixthGen-iPadProSixthGen",
                "iPadProSixthGenCellular-iPadProSixthGenCellular",
                "iPhone15-iPhone15",
                "iPhone15Plus-iPhone15Plus",
                "iPhone15Pro-iPhone15Pro",
                "iPhone15ProMax-iPhone15ProMax"
            ],
            advisories: [],
            isGameCenterEnabled: false,
            features: [
                "iosUniversal"
            ],
            kind: "software",
            averageUserRatingForCurrentVersion: 4.10583999999999971208808347000740468502044677734375,
            averageUserRating: 4.10583999999999971208808347000740468502044677734375,
            trackCensoredName: "Keynote",
            languageCodesISO2A: [
                "AR",
                "CA",
                "HR",
                "CS",
                "DA",
                "NL",
                "EN",
                "FI",
                "FR",
                "DE",
                "EL",
                "HE",
                "HI",
                "HU",
                "ID",
                "IT",
                "JA",
                "KO",
                "MS",
                "NB",
                "PL",
                "PT",
                "RO",
                "RU",
                "ZH",
                "SK",
                "ES",
                "SV",
                "TH",
                "ZH",
                "TR",
                "UK",
                "VI"
            ],
            fileSizeBytes: "522563584",
            sellerUrl: "https://www.apple.com/apps/#keynote",
            formattedPrice: "Free",
            contentAdvisoryRating: "4+",
            userRatingCountForCurrentVersion: userRatingCountForCurrentVersion,
            trackViewUrl: "https://apps.apple.com/us/app/keynote/id361285480?uo=4",
            trackContentRating: "4+",
            minimumOsVersion: "16.0",
            currentVersionReleaseDate: "2024-04-02T15:31:46Z",
            releaseNotes:
"""
• Add a new look to your slides with the Dynamic Color, Minimalist Light, and Minimalist Dark themes
• Streamlined in-app notifications inform you when a person joins a collaborative presentation for the first time
• Preserve file format and full quality when adding HEIC photos taken on iPhone or iPad
• On iPad, press and hold the Command key on a connected keyboard to select noncontiguous words, sentences, or paragraphs using a trackpad or mouse
• Improved compatibility for slide transitions when importing and exporting Microsoft PowerPoint files
• Additional stability and performance improvements
""",
            artistId: artistId,
            artistName: "Apple",
            genres: [
                "Productivity",
                "Business"
            ],
            price: 0.00,
            description:
"""
Keynote is the most powerful presentation app ever designed for a mobile device.
Start with an Apple-designed theme and add text, images, charts, tables, and shapes with just a few taps.
Draw and write with Apple Pencil on iPad, or use your finger.
Bring it all to life with cinematic animations and transitions that look as though they were created by your own special effects team.
Add live video to your slideshow and appear right on your slides in remote presentations, how-to videos, and lectures.
Confidently present to your audience from anywhere, in person or virtually, and take turns controlling a presentation in multi-presenter slideshows.
Collaborate with others at the same time
• With real-time collaboration, your whole team can work together on a presentation at the same time on Mac, iPad, iPhone, and even on a PC
• Share your document publicly or with specific people, see who’s currently in the presentation with you, 
    and view other people’s cursors to follow their edits
• See a list of recent changes in collaborative presentations, including when people join, comment, and make edits
• Available for presentations stored in iCloud or in Box
Get started quickly
• Choose from over 40 Apple-designed themes to give your presentations a beautiful start or create a quick draft by starting with a text outline
• Use the slide navigator to quickly skim through your presentation, add new slides, and reorder slides
• Get quick access to shapes, media, tables, charts, and sharing options
• Import and edit Microsoft PowerPoint presentations
• Quickly open password-protected presentations using Touch ID or Face ID on supported devices
Create stunning presentations
• Easily change slide layouts and backgrounds
• Use the built-in camera to add live video right on your slides
• Engage your audience with interactive charts and chart animations
• Enhance your presentations with a library of over 700 editable shapes
• Quickly add your photos and videos from the Photos app using the Media Browser
• Add an interactive image gallery to view a collection of photos
• Easily remove image backgrounds
• Use gorgeous preset styles to make your text, tables, shapes, and images look beautiful
• Edit down to the pixel with rulers and alignment guides
Cinema-quality animations
• Beautiful cinematic slide transitions and impressive text and object animations
• Magic Move effect effortlessly animates and morphs graphics
• Emphasis builds let you add impact with one click
• See live on-canvas previews as you animate your slides
Present to your audience
• Customizable presenter display
• Rehearse a presentation with current slide, presenter notes, and timer all in one view
• Present on an external display or projector, or stream wirelessly using AirPlay and Apple TV
• Use multi-presenter slideshows to let participants take turns controlling a shared presentation from their own device
• Easily access the slide navigator, keyboard shortcuts, live video sources, or multi-presenter slideshow controls while presenting
• Highlight with Apple Pencil or with your finger while presenting on iPad
• Control your slideshow from iPhone, iPad, or Apple Watch\n• Create self-running, interactive shows for kiosks and displays
iCloud
• Turn on iCloud so you can access and edit your presentations from your Mac, iPad, iPhone, and from a Mac or PC browser at iCloud.com
• Keynote automatically saves your presentations as you make changes
Share a copy of your work
• Export presentations to Microsoft PowerPoint, PDF, HTML, movies, and image files\n• Use AirDrop to send your presentation to anyone nearby
• Quickly and easily share a link to your work via Mail or Messages
Some features may require Internet access; additional fees and terms may apply.
""",
            genreIds: [
                "6007",
                "6000"
            ],
            trackId: trackId,
            trackName: "Keynote",
            isVppDeviceBasedLicensingEnabled: true,
            bundleId: "com.apple.Keynote",
            releaseDate: "2010-04-01T20:40:46Z",
            currency: "USD",
            sellerName: "Apple Inc.",
            primaryGenreName: "Productivity",
            primaryGenreId: primaryGenreId,
            version: "14.0",
            wrapperType: "software",
            userRatingCount: userRatingCount
        )
        return result
    }
    
    static var appResponse: Components.Schemas.AppResponse {
        let response = Components.Schemas.AppResponse(resultCount: 1, results: [keynoteResult])
        return response
    }
}
