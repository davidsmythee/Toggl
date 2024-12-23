//
//  ModeDetailsManager.swift
//  Toggl-Part2
//
//  Created by David Smythe on 10/28/24.
//

import Foundation

struct ModeDetailsProvider {
    static let details: [String: (image: String, description: String)] = [
        "general_mode": ("General", "Get smarter with General Mode! Every time you open your favorite app, you'll be prompted with a question from various subjects—keeping your mind sharp throughout the day. Perfect for a well-rounded mental workout!"),
        "sattutor_mode": ("SATtutor", "Master the SAT with SAT Tutor! Every time you open your favorite app, you'll face a new test question, turning those idle moments into quick, effective study sessions that help you stay prepared and confident."),
        "ibtutor_mode": ("IBtutor", "Crush your IB exams with IB Tutor! Each time you open your preferred app, you'll face a question tailored to your IB curriculum, integrating study moments seamlessly into your routine."),
        "codingtutor_mode": ("CodingTutor", "Level up your coding skills with Coding Tutor! Whenever you launch an app, tackle a quick coding challenge to refine your problem-solving abilities and strengthen your programming knowledge day by day."),
        "relax_mode": ("RelaxMode", "Take a break with Relax Mode. Every time you open your app, you'll be prompted with calming exercises or relaxation tips, ensuring you stay balanced and stress-free in the middle of your busy day."),
        "10points_mode": ("10points", "Boost your motivation with 10 Points Mode! Whenever you access your favorite app, you'll get a fun, bite-sized challenge that earns you points—making learning or relaxing feel like a game you can win.")
    ]
}

