//
//  QuickPostWidget.swift
//  QuickPostWidget
//
//  Created by Dylan da Silva on 2021/10/27.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct QuickPostWidgetEntryView : View {
    var entry: Provider.Entry
    
    @Environment(\.widgetFamily) var widgetFamily

    var body: some View {
        VStack(alignment: .center) {
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Rapture")
                        .font(Font.custom("Gilroy-Bold", size: 18))
                        .foregroundColor(.white)
                        .padding(.leading, 20)
                    
                    Text("Upload New Post")
                        .font(Font.custom("Gilroy-Regular", size: 12))
                        .foregroundColor(.white)
                        .padding(.leading, 20)
                }

                Spacer()
            }
            .padding(.top, 5)
            
            Divider()
                .background(Color("Red"))
                .padding(.leading, 20)
                .padding(.trailing, 20)
                .padding(.top, 5)
            
            HStack {
                if widgetFamily == .systemSmall {
                    Link(destination: URL(string: "widget://upload")!) {
                        Image(systemName: "square.and.arrow.up")
                            .font(.system(size: 22))
                            .frame(width: 60, height: 60)
                            .foregroundColor(.white)
                            .background(Color("Red"))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .shadow(color: Color("Red").opacity(0.4), radius: 15)
                    }
                    
                    Link(destination: URL(string: "widget://profile")!) {
                        Image(systemName: "person")
                            .font(.system(size: 22))
                            .frame(width: 60, height: 60)
                            .foregroundColor(.white)
                            .background(Color("Red"))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .shadow(color: Color("Red").opacity(0.4), radius: 15)
                    }
                }
            }
            .padding(.top, 10)
        }
    }
}

@main
struct QuickPostWidget: Widget {
    let kind: String = "QuickPostWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            QuickPostWidgetEntryView(entry: entry)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("WidgetBackground"))
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct QuickPostWidget_Previews: PreviewProvider {
    static var previews: some View {
        QuickPostWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
