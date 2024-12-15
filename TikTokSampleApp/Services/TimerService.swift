//
//  TimerService.swift
//  TikTokSampleApp
//
//  Created by Cirrius on 15/12/24.
//

import Foundation

protocol TimerDelegate: AnyObject {
    func timerDidFire()
}

class TimerManager {
    private var timer: Timer?
    var delegate: TimerDelegate?

    func startTimer(interval: TimeInterval, repeats: Bool = true) {
        timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(timerDidFire), userInfo: nil, repeats: repeats)
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    @objc private func timerDidFire() {
        delegate?.timerDidFire()
    }
}

class TimerObserver: TimerDelegate {
    func timerDidFire() {
        
    }
}

