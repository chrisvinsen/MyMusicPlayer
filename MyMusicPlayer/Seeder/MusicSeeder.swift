//
//  MusicSeeder.swift
//  MyMusicPlayer
//
//  Created by Christianto Vinsen on 05/04/22.
//

import Foundation
import UIKit

struct MusicSeeder {
    var arrOfMusic : [Music] = []
    
    init() {
        let music0 = Music(
            image: UIImage(named: "happy.jpeg"),
            title: "Hati Hati Di Jalan",
            singer: "Tulus",
            lyrics: "Perjalanan membawamu\nBertemu denganku, ku bertemu kamu\nSepertimu yang kucari\nKonon aku juga s'perti yang kaucari\nKukira kita asam dan garam\nDan kita bertemu di belanga\nKisah yang ternyata tak seindah itu\nKukira kita akan bersama\nBegitu banyak yang sama\nLatarmu dan latarku\nKukira takkan ada kendala\nKukira ini 'kan mudah\nKau-aku jadi kita\nKasih sayangmu membekas\nRedam kini sudah pijar istimewa\nEntah apa maksud dunia\nTentang ujung cerita, kita tak bersama\nSemoga rindu ini menghilang\nKonon katanya waktu sembuhkan\nAkan adakah lagi yang sepertimu?\nKukira kita akan bersama\nBegitu banyak yang sama\nLatarmu dan latarku\nKukira takkan ada kendala\nKukira ini 'kan mudah\nKau-aku jadi kita\nKau melanjutkan perjalananmu\nKu melanjutkan perjalananku\nUh-uh, hu-uh-uh\nKukira kita akan bersama\nBegitu banyak yang sama\nLatarmu dan latarku\nKukira takkan ada kendala\nKukira ini 'kan mudah\nKau-aku jadi kita\nKukira kita akan bersama\nHati-hati di jalan\n",
            filename: "hati-hati-di-jalan",
            filetype: "mp3",
            startTime: 0,
            endTime: 242,
            isFavorite: false
        )
        let music1 = Music(
            image: UIImage(named: "daydreamer.jpeg"),
            title: "Daydreamer",
            singer: "AURORA",
            lyrics: "And we become night time dreamers Street walkers and small talkers When we should be daydreamers And moonwalkers and dream talkers And we become night time dreamers Street walkers, small talkers When we should be daydreamers And moonwalkers and dream talkers In real life",
            filename: "music",
            filetype: "mp3",
            startTime: 0,
            endTime: 199,
            isFavorite: false
        )
        let music2 = Music(
            image: UIImage(named: "is-this-love.jpeg"),
            title: "Is This Love",
            singer: "Aalia",
            lyrics: "A blue bird in my heart Why do you try to get it out It's sad It's sad to know you Don't take out my blue bird It only knows how to stay dark Don't spoil It shouldn't hurt no more",
            filename: "music",
            filetype: "mp3",
            startTime: 0,
            endTime: 199,
            isFavorite: false
        )
        let music3 = Music(
            image: UIImage(named: "auld-lang-syne.jpeg"),
            title: "Auld Lang Syne",
            singer: "Denmark + Winter",
            lyrics: "Should auld acquaintance be forgot And never brought to mind? Should auld acquaintance be forgot And days auld lang syne? For auld lang syne, my dear For auld lang syne We'll take a cup of kindness yet For auld lang syne",
            filename: "music",
            filetype: "mp3",
            startTime: 0,
            endTime: 199,
            isFavorite: false
        )
        let music4 = Music(
            image: UIImage(named: "10000-hours.jpeg"),
            title: "10.000 Hours",
            singer: "Dan + Shay & justin Bieber",
            lyrics: "I'd spend 10, 000 hours and 10, 000 more Oh, if that's what it takes to learn that sweet heart of yours And I might never get there, but I'm gonna try If it's 10, 000 hours or the rest of my life I'm gonna love you (Ooh, ooh-ooh, ooh, ooh) Do you miss the road that you grew up on? Did you get your middle name from your grandma? When you think about your forever now Do you think of me?",
            filename: "music",
            filetype: "mp3",
            startTime: 0,
            endTime: 199,
            isFavorite: false
        )
        
        arrOfMusic.append(music0)
        arrOfMusic.append(music1)
        arrOfMusic.append(music2)
        arrOfMusic.append(music3)
        arrOfMusic.append(music4)
    }
}
