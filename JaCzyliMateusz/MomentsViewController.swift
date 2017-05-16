//
//  MomentsViewController.swift
//  JaCzyliMateusz
//
//  Created by Mateusz on 13.05.2017.
//  Copyright © 2017 Mateusz. All rights reserved.
//

import UIKit

class MomentsViewController: UIViewController {

//OUTLETS
    @IBOutlet weak var momentsPhoto: UIImageView!
    @IBOutlet weak var topicOfMoment: UILabel!
    @IBOutlet weak var storyOfThatMoment: UILabel!
    
    var test = 1
    
    var history: [String] = ["Moja historia rozpoczyna się w 12.05.1997 r. Podobno tego dnia wszystkie komputery w odległości 20 km przestały działać. Kiedy udało mi się już przywitać z tym światem a moja mama pytała tylko o jedno - Chłopiec czy dziewczynka? Położna do dnia dzisiejszego powtarza, że nigdy nie była jeszcze tak pewna. - Informatyk - Odpowiedziała ...",
        
        "W tym wieku, chodź nie umiałem jeszcze pisać, ani czytać. Strasznie mocno chciałem poznać już tajniki programowania. Była to tak silna potrzeba, że podobno zaraz po skończonym leżakowaniu na swoim małym rowerze goniłem wszystkich informatyków w mieście. Dziś musze przyznać, że nie było to zbytnio rozważne, i do dzisiaj niektórzy z nich gdy mnie widzą automatycznie zaczynają uciekać ... ",
        
        "W czasach podstawówkowo - gimnazjalnych, zostałem przydzielony do oddziału hakerów wojska Polskiego. Wtedy też dostałem telefon od Steva Jobsa z prośba napisania nowego języka dla ich urządzeń. Już wtedy w mojej głowie narodził się pomysł Swifta. W każdej wolnej chwili wymyślałem coraz to kolejne rzeczy jakie powinien zawierać taki język ...",
        
        "Niestety podczas okresu licealnego kiedy musiałem przygotowywać się do matury, zawiesiłem swoją pracę nad nowym językiem, oddałem wszystko co stworzyłem do Apple. Jak możecie się domyślać to właśnie ten fakt spowodował wszystkie błędy, które występowały na samym początku. Ogólnie rzecz ujmując, wszystko co było złe w tym języku zawdzięczamy inżynierom Apple ...",
        
        "Wreszcie nastał okres w którym mogłem powiedzieć o sobie, że jestem dorosły. W dniu urodzin bardzo rozmyślałem co robić dalej ze swoim życiem. Dostawałem propozycje pracy od takich firm jak Apple, Microsoft czy IBM. Jednak cały czas w głębi duszy czułem, że to nie to. Cały czas czułem, że czeka na mnie coś więcej. Nie myliłem się (jak zwykle zresztą). Moim oczą ukazał się staż w firmie Allegro ... ",
        
        "W dniu dzisiejszym właśnie kończę opowiadać wam najważniejsze rzeczy na temat mojego życia. Oczywiście potrafię również przewidzieć co stanie się dalej, dlatego czas żebyście wy również poznali moją przyszłość ...",
        
        "W lipcu 2017 r. uda mi się podjąć staż w Allegro. I chodź oczywiście to ja zapoczątkowałem Swifta,  będę udawał, że znam go w początkującym stopniu, ponieważ nie chce żeby reszta programistów czuła się przy mnie jakoś gorzej ... ",
        
        "Kilka miesięcy po zakończonym Stażu dostaję w końcu bardo wyczekiwanego maila z propozycja pracy dla Allegro. Bez chwili zawahania na tym samy rowerze co za młodu, pedałuje by dostać się na rozmowę o pracę.",
        
        "Kiedy już udało mi się podjąć prawdziwą pracę, przestaję krępować się swoimi umiejętnościami. W ciagu tygodnia zostaje głównym programistą w firmie. Po kilku miesiącach Allegro uznało, że reszta programistów w firmie jest już zbędna i pozostawia mnie samego. Po 120 latach pracy (tak, 120 tutaj nie ma błędu) uznałem, że czas na coś nowego w mojej pracy. W ciagu kilku miesięcy udało mi się stworzyć SI która od teraz sama rozwijała aplikacje mobilna Allegro ...",
        
        "Dzięki moim zasługą dla firmy. Po mojej śmierci. Moja urna dostaje zaszczytne miejsce w głównej siedzibie Allegro, aby każdy mógł wspominać kto zabrał prace wszystkim programistą.",
        
        "A tak na poważnie, mam na imię Mateusz. Kilka dni temu wskoczyła mi 2 z przodu. I bardzo chciałbym podjąć staż w Państwa firmie. Programowaniem na urządzenia Apple zajmuje się od niecałego roku. I codziennie staram uczyć się nowych rzeczy. Wcześniej zajmowałem się też np. C++ i trochę Java. Jednak nie przypadły mi one do gustu tak jak aplikacje mobilne. Miałem też dość spory czas w którym tworzyłem strony internetowe. Nawet do teraz udaję mi się tworzyć proste strony oparte o małego CMS-a. Mimo wszystko całą swoja przyszłość wiąże właśnie z aplikacjami mobilnymi i mam nadzieje, że uda mi się dalej rozwijać w Allegro."]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         customizeView(test)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
       
        
    }

    func customizeView(_ number:Int)
    {
        switch number {
        case 1:
            momentsPhoto.image = UIImage(named:"lekarzusg.png")
            topicOfMoment.text = "1.Etap Narodzin"
            storyOfThatMoment.text! = history[0]
        case 2:
            momentsPhoto.image = UIImage(named:"dzieckorower.png")
            topicOfMoment.text = "2.Wiek przedszkolny"
            storyOfThatMoment.text! = history[1]
        case 3:
            momentsPhoto.image = UIImage(named:"czytanie.png")
            topicOfMoment.text = "3. Ciągła nauka"
            storyOfThatMoment.text! = history[2]
        case 4:
            momentsPhoto.image = UIImage(named:"matura.png")
            topicOfMoment.text = "4. Matura"
            storyOfThatMoment.text! = history[3]
        case 5:
            momentsPhoto.image = UIImage(named:"superman.png")
            topicOfMoment.text = "5. Dorosłość"
            storyOfThatMoment.text! = history[4]
        case 6:
            momentsPhoto.image = UIImage(named:"dzisiaj.png") // no
            topicOfMoment.text = "6. Dzień dzisiejszy"
            storyOfThatMoment.text! = history[5]
        case 7:
            momentsPhoto.image = UIImage(named:"janolifecartoon.png")
            topicOfMoment.text = "7. Staż"
            storyOfThatMoment.text! = history[6]
        case 8:
            momentsPhoto.image = UIImage(named:"list.png") 
            topicOfMoment.text = "8. Czekanie na wiadomość"
            storyOfThatMoment.text! = history[7]
        case 9:
            momentsPhoto.image = UIImage(named:"jabiurko.png")
            topicOfMoment.text = "9. Praca"
            storyOfThatMoment.text! = history[8]
        case 10:
            momentsPhoto.image = UIImage(named:"biuro.png")
            topicOfMoment.text = "10. Zasłużone miejsce"
            storyOfThatMoment.text! = history[9]
        case 11:
            momentsPhoto.image = UIImage(named:"prawda.png") // no
            topicOfMoment.text = "11.LAST"
            storyOfThatMoment.text! = history[10]
            momentsPhoto.contentMode = UIViewContentMode.scaleAspectFit;
        default:
            return
        }
    }
    

    @IBAction func backButtonAction(_ sender: UIButton) {
        dismiss(animated: true) {}
    }
  

}
